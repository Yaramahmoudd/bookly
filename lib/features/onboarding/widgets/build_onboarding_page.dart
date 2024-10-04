import 'package:bookly/core/helpers/spacing.dart';
import 'package:bookly/core/theming/font_weight.dart';
import 'package:bookly/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildOnboardingPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final int pageIndex;

  const BuildOnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.pageIndex,
  });

  @override
  State<BuildOnboardingPage> createState() => _BuildOnboardingPageState();
}

class _BuildOnboardingPageState extends State<BuildOnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    // Trigger the animation for the first page
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.1,
                width: double.infinity,
                decoration: BoxDecoration(
                    //borderRadius: BorderRadiusDirectional.circular(16),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(widget.imagePath))),
              ),
              verticalSpace(30),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  widget.title,
                  style: TextStyles.font24WhiteBold,
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(20),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  widget.description,
                  style: TextStyles.font16WhiteMedium.copyWith(
                    fontWeight: FontWeightHelper.regular,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
