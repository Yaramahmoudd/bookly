import 'package:bookly/core/helpers/extensions.dart';
import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/features/splash/ui/screens/widgets/sliding_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(begin: const Offset(0,15), end: Offset.zero).animate(animationController);
    animationController.forward();
    tohome();
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/Logo.png'),
        SlidingWidget(slidingAnimation: slidingAnimation)
      ],
    );
  }
  void tohome() {
    Future.delayed(const Duration(seconds: 3),() async {
      WidgetsFlutterBinding.ensureInitialized();
      context.pushReplacementNamed(Routes.onboardingScreen);
    });
  }
}

