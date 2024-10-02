// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:async';
import 'package:bookly/core/theming/colors.dart';
import 'package:bookly/features/splash/ui/screens/splash_screen2.dart';
import 'package:flutter/material.dart';



class SplashScreen1 extends StatefulWidget {
  const SplashScreen1 ({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> with SingleTickerProviderStateMixin {
  double ballY = 0;
  double widthVal = 50;
  double heightVal = 50;
  double bottomVal = 500;
  bool add = false;
  bool showShadow = false;
  int times = 0;
  bool showComic = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(
            () {
              if (add) {
                ballY += 15;
              } else {
                ballY -= 15;
              }
              if (ballY <= -200) {
                times += 1;
                add = true;
                showShadow = true;
              }
              if (ballY >= 0) {
                add = false;
                showShadow = false;
                widthVal += 50;
                heightVal += 50;
                bottomVal -= 200;
              }
              if (times == 3) {
                showShadow = false;
                widthVal = MediaQuery.of(context).size.width;
                heightVal =  MediaQuery.of(context).size.height;
                Timer(Duration(milliseconds: 300), (){
                  setState(() {
                    showComic=true;
                  });
                });
                _controller.stop();
              }
              setState(() {});
            },
          );
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    bottom: bottomVal,
                    duration: Duration(milliseconds: 1000),
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: Offset(0, ballY),
                          child: AnimatedScale(
                            duration: Duration(milliseconds: 200),
                            scale: times == 3 ? 5 : 1,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 1000),
                              width: widthVal,
                              height: heightVal,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: ColorsManager.kPrimaryColor),
                            ),
                          ),
                        ),
                        if (showShadow)
                          Container(
                            width: 50,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.2),
                                borderRadius: BorderRadius.circular(100)),
                          )
                      ],
                    ),
                  ),
                  if (showComic)
                    Positioned(
                        child: SplashScreen2())
                ],
              ),
            ),
    );
  }
}

