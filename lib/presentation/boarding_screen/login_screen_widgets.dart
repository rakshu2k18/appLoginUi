import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../constants/text_constants.dart';

Widget enterMobile(context, TextEditingController pController) {
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  double sHeight = MediaQuery.of(context).size.height;
  return Container(
    height: sHeight * 0.065,
    decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(50))),
    child: InternationalPhoneNumberInput(
      maxLength: 10,
      textFieldController: pController,
      initialValue: number,
      formatInput: false,
      spaceBetweenSelectorAndTextField: 0,
      onInputChanged: (value) {},
      keyboardType: TextInputType.number,
      cursorColor: Colors.red,
      selectorConfig: const SelectorConfig(
          setSelectorButtonAsPrefixIcon: true,
          trailingSpace: false,
          // leadingPadding: 10,
          selectorType: PhoneInputSelectorType.DROPDOWN),
      inputDecoration: const InputDecoration(
          border: InputBorder.none,
          hintText: mobileNo,
          hintStyle: TextStyle(fontSize: 14)),
    ),
  );
}
