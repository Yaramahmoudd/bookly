import 'package:flutter/material.dart';
class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/Logo.png'),
        const Text('read free books',textAlign: TextAlign.center,)
      ],
    );
  }
}