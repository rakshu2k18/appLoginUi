import 'package:flutter/material.dart';

import '../boarding_screen/login_screen.dart';
import '../boarding_screen/otp_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/loginPage':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/otpScreen':
        Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) =>  OtpScreen(
            mobileNo:arguments["mobileNo"]
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
    }
  }
}
