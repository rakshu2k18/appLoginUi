import 'package:apploginui/constants/color_constants.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? commonAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

Widget sphericalRedButton(String btnText, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * .07,
    decoration: BoxDecoration(
        color: appRedColor,
        border: Border.all(color: appRedColor),
        borderRadius: const BorderRadius.all(Radius.circular(50))),
    child: Center(child: myText(btnText, Colors.white, 15)),
  );
}

Widget myText(var myText, Color textClr, double myFontSize) {
  return Text(myText.toString(),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: textClr, fontSize: myFontSize));
}

Widget vSpacer(double sHeight) {
  return SizedBox(
    height: sHeight,
  );
}

Widget hSpacer(double spacerWidth) {
  return SizedBox(
    width: spacerWidth,
  );
}



