import 'package:flutter/material.dart';
import '../../constants/image_constants.dart';
import '../../constants/text_constants.dart';
import '../../constants/widget_constants.dart';
import 'login_screen_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: commonAppBar(login),
        body: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20, vertical:20),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(loginImg),
                vSpacer(sHeight*0.05),
                enterMobile(context, _mobileController),
                vSpacer(sHeight * 0.02),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/otpScreen",
                          arguments: {"mobileNo": _mobileController.text});
                      _mobileController.clear();
                    },
                    child: sphericalRedButton(getOtp, context)),
                vSpacer(sHeight * 0.05),
                const Text(
                  termsAC,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
