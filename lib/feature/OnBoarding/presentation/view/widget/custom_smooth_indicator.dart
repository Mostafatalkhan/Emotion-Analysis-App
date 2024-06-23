import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/list/on_boarding_list.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator({super.key,required this.pageController,required this.cubit});

  final pageController;
  final cubit;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: model.length,
      effect: const SlideEffect(
        spacing: 6.0,
        dotWidth: 12.0,
        dotHeight: 12.0,
        paintStyle: PaintingStyle.stroke,
        strokeWidth: 1,
        dotColor: Color(0xFFB2CCFF),
        activeDotColor: Color(0xFF001640),
      ),
    );
  }
}
