import 'package:present_app/presentation/screens/getting_started_screen.dart';
import 'package:present_app/presentation/screens/login_screen.dart';
import 'package:present_app/presentation/screens/home_page_screen.dart';
import 'package:present_app/presentation/screens/signup_screen.dart';
import 'package:present_app/presentation/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'conistants/strings.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case gettingStartedScreen:
        return MaterialPageRoute(
          builder: (_) => GettingStartedScreen(),
        );
      case startScreen:
        return MaterialPageRoute(
          builder: (_) => StartScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
        );
      case homePageScreen:
        return MaterialPageRoute(
          builder: (_) => HomePageScreen(),
        );
    }
    return null;
  }
}
