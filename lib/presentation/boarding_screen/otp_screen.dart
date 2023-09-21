import 'dart:async';

import 'package:apploginui/constants/color_constants.dart';
import 'package:apploginui/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants/text_constants.dart';
import '../../constants/widget_constants.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  String mobileNo;
  OtpScreen({super.key, required this.mobileNo});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        if (mounted) {
          setState(() {
            secondsRemaining--;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            enableResend = true;
          });
        }
      }
    });
  }

  String userEnteredOtp = "";

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: commonAppBar(otpVerify),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: sHeight * 0.35, child: Image.asset(otpImg)),
              const Text(otpSentText),
              Text(
                "+91${widget.mobileNo}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              PinCodeFields(
                length: 4,
                fieldBorderStyle: FieldBorderStyle.square,
                responsive: false,
                fieldHeight: sWidth * 0.13,
                fieldWidth: sWidth * 0.17,
                borderWidth: sWidth * 0.005,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0),
                activeBorderColor: Colors.red,
                autofocus: true,
                borderRadius: BorderRadius.circular(sWidth * 0.02),
                keyboardType: TextInputType.number,
                autoHideKeyboard: true,
                fieldBackgroundColor: appWhiteColor,
                textStyle: const TextStyle(fontSize: 18),
                onComplete: (pin) {},
                onChange: (value) {
                  userEnteredOtp = value;
                },
              ),
              vSpacer(sHeight * 0.02),
              GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: detailsSubmitted);
                  },
                  child: sphericalRedButton(verifyOtp, context)),
              vSpacer(sHeight * 0.02),
              !enableResend
                  ? myText(noOTP + resendIn + secondsRemaining.toString(),
                      appGreyColor, 15)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myText(noOTP, appGreyColor, 15),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                secondsRemaining = 30;
                                enableResend = !enableResend;
                              });
                            },
                            child: myText(resend, Colors.red, 15)),
                      ],
                    ),
              vSpacer(sHeight * 0.05),
              const Text(
                termsAC,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
