import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manage/cubit/on_boarding_cubit.dart';
import '../../manage/cubit/on_boarding_states.dart';
import 'custom_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit,OnBoardingStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=OnBoardingCubit().get(context);
        return CustomPageView(cubit: cubit,pageController: pageController,);
      },
    );
  }
}
