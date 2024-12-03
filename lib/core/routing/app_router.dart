
import 'package:flutter/material.dart';
import 'package:reveria/core/features/home/ui/home_screen.dart';
import 'package:reveria/core/features/login/login_screen.dart';
import 'package:reveria/core/features/onboarding/onboarding_screen.dart';
import 'package:reveria/core/features/register/ui/register_screen.dart';
import 'package:reveria/core/routing/routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this argument is passed when using Navigator.pushNamed
   final arguments = settings.arguments;
    
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
        case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}