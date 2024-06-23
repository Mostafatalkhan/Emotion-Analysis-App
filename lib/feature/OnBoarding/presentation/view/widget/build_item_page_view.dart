import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/shared_preference.dart';
import '../../../../Login/presentation/view/login_view.dart';
import '../../../data/model/on_boarding_model.dart';
import 'custom_smooth_indicator.dart';
import 'custom_text.dart';

class BuildItemPageView extends StatelessWidget {
   const BuildItemPageView({super.key, required this.onBoardingModel,required this.pageController,required this.cubit});

  final OnBoardingModel onBoardingModel;
  final pageController;
  final cubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Image.asset(onBoardingModel.image,width: 300,height: 300,),
          const SizedBox(
            height: 20,
          ),
          CustomText(onBoardingModel: onBoardingModel),
          const SizedBox(
            height: 34,
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30
            ),
            child: Row(
              children: [
                Expanded(child: CustomSmoothIndicator(pageController: pageController, cubit: cubit,)),
                GestureDetector(
                  onTap: () {
                    if (cubit.isLast) {
                      SharedPreference.saveData(key: 'onBoarding', value: true).then((value)
                      {
                        if(value) {
                          navigateAndFinish(context, const LoginView());
                        }
                      }
                      );
                    }
                    pageController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                  child: Container(
                    height: 48,
                    width: 80,
                    padding: const EdgeInsets.all(14),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF672197),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          container(),
        ],
      ),
    );
  }
}
