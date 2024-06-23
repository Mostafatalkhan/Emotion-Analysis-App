import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates>
{
  OnBoardingCubit():super (OnBoardingInitialStates());
  OnBoardingCubit get(context)=>BlocProvider.of(context);

  bool isLast=false;

}