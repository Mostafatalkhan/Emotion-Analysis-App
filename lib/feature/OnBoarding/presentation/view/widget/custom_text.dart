import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.onBoardingModel});

  final onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: onBoardingModel.title,
                style: const TextStyle(
                  color: Color(0xFF8B4CFC),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.24,
                ),
              ),
              const TextSpan(
                text: 'Emotion Analysis',
                style: TextStyle(
                  color: Color(0xFF100F11),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.24,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        // Text(
        //   onBoardingModel.title,
        //   textAlign: TextAlign.center,
        //   style: AppStyles.styleSemiBold20,
        // ),
        const SizedBox(
          height: 34,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 29,
          ),
          child: Text(
            onBoardingModel.body,
            textAlign: TextAlign.center,
            style: AppStyles.styleMedium16,
          ),
        )
      ],
    );
  }
}
