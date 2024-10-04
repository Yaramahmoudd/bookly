import 'dart:async'; // Import for Timer
import 'package:bookly/core/helpers/extensions.dart';
import 'package:bookly/core/helpers/spacing.dart';
import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/core/theming/colors.dart';
import 'package:bookly/core/theming/font_weight.dart';
import 'package:bookly/core/theming/styles.dart';
import 'package:bookly/core/widgets/app_text_button.dart';
import 'package:bookly/features/onboarding/widgets/build_onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  Timer? _pageTimer; // Timer for automatic page transitions
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Trigger the animation for the first page
    _animationController.forward();

    // Automatically change pages every 3 seconds
    _pageTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPageIndex < 2) {
        // Change pages until the last one
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0; // Reset to the first page
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      // _animationController.forward(
      //     from: 0.0); // Restart animation on page change
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    _pageTimer?.cancel(); // Cancel the timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              _currentPageIndex = index; // Update the current page index
              _animationController.forward(
                  from: 0.0); // Restart animation on page change
            },
            children: const [
              BuildOnboardingPage(
                  imagePath: 'assets/images/Book 1 High.png',
                  title: 'Different exercises',
                  description:
                      'Exercise plans for all levels prepared by a professional medical team.',
                  pageIndex: 0),
              BuildOnboardingPage(
                  imagePath: 'assets/images/Book 2 High.png',
                  title: 'Stay Hydrated',
                  description:
                      'Tips on keeping your body hydrated with the right nutrition',
                  pageIndex: 1),
              BuildOnboardingPage(
                  imagePath: 'assets/images/Book 3 Hightligh.png',
                  title: 'Track Progress',
                  description:
                      'Monitor your workout progress with easy-to-use tools.',
                  pageIndex: 2),
            ],
          ),
          // Smooth Page Indicator
          Positioned(
            bottom: 235.h,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3, // Make sure the count matches the number of pages
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.white,
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: ColorsManager.gry,
                  expansionFactor: 4,
                ),
              ),
            ),
          ),
          // Bottom Buttons
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text('Do you have a registered account?',style: TextStyles.font16WhiteMedium.copyWith(
                    fontWeight: FontWeightHelper.regular,
                  ) ,),
                  verticalSpace(10),
                  AppTextButton(
                    buttonText: 'Not yet!',
                    textStyle: TextStyles.font15BlackMedium,
                    onPressed: () {},
                    buttonWidth: MediaQuery.of(context).size.width / 1.3,
                    borderRadius: 104,
                    backgroundColor: Colors.white,
                    verticalPadding: 10,
                  ),
                  verticalSpace(12),
                  AppTextButton(
                    buttonText: 'Login',
                    textStyle: TextStyles.font16WhiteMedium,
                    onPressed: () {
                      context.pushReplacementNamed(Routes.homeScreen);
                    },
                    buttonWidth: MediaQuery.of(context).size.width / 1.3,
                    borderRadius: 104,
                    borderColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    verticalPadding: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
