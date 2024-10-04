import 'package:bookly/features/home/ui/screens/book_details_screen.dart';
import 'package:bookly/features/home/ui/screens/home_screen.dart';
import 'package:bookly/features/onboarding/screens/onboarding_screen.dart';
import 'package:bookly/features/splash/ui/screens/splash_screen1.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )

    switch (settings.name) {
      case Routes.splashScreen1:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen1(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
        case Routes.bookDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const BookDetailsScreen(),
        );
        case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) =>  OnboardingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}