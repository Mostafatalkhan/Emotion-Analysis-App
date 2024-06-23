import 'package:flutter/material.dart';

import '../../../data/list/on_boarding_list.dart';
import 'build_item_page_view.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, this.cubit, this.pageController});

  final cubit;
  final pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (index){
        if (index == model.length - 1) {
          cubit.isLast = true;
        } else {
          cubit.isLast = false;
        }
      },
      itemBuilder: (context, index) => BuildItemPageView(
        onBoardingModel: model[index],
        pageController: pageController, cubit: cubit,
      ),
      itemCount: model.length,
    );
  }
}
