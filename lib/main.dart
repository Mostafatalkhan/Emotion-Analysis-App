import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/feature/Login/presentation/manage/cubit/login_cubit.dart';
import 'package:graduationproject/feature/Login/presentation/view/login_view.dart';
import 'package:graduationproject/feature/setting/presentation/manage/Complaints%20Cubit/complaints_cubit.dart';
import 'package:graduationproject/feature/setting/presentation/manage/cubit/setting_cubit.dart';
import 'package:graduationproject/feature/setting/presentation/view/setting_view.dart';
import 'package:graduationproject/feature/splash/ui/custom_splash_screen.dart';
import 'package:graduationproject/views/face_view.dart';
import 'package:graduationproject/views/home_view.dart';
import 'package:graduationproject/views/speech_view.dart';
import 'core/utils/api_service.dart';
import 'core/utils/constant.dart';
import 'core/utils/shared_preference.dart';
import 'feature/OnBoarding/presentation/manage/cubit/on_boarding_cubit.dart';
import 'feature/OnBoarding/presentation/view/on_boarding_view.dart';
import 'feature/register/presentation/manage/cubit/register_cubit.dart';
import 'feature/setting/presentation/view/about_us_view.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.init();
  await SharedPreference.init();

  bool? onBoarding= SharedPreference.getData(key: 'onBoarding');
  //token=SharedPreference.getData(key: 'token');
  print(token);

  // Widget? widget;
  // if(onBoarding !=null){
  //   // if(token !=null){
  //      widget=const Home();
  //    }
  //   else{
  //     widget=const LoginView();
  //   }
  // }else{
  //   widget =const OnBoardingView();
  // }

  runApp( MyApp(startWidget: SplashScreen(),));
}



class MyApp extends StatefulWidget {
  const MyApp({super.key,required this.startWidget});

  final Widget? startWidget;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>OnBoardingCubit(),),
        BlocProvider(create: (BuildContext context)=>LoginCubit(),),
        BlocProvider(create: (BuildContext context)=>RegisterCubit(),),
        BlocProvider(create: (BuildContext context)=>SettingCubit()..getProfile(),),
        BlocProvider(create: (BuildContext context)=>ComplaintsCubit(),),
        // BlocProvider(create: (BuildContext context)=>LayoutCubit(),),
        // BlocProvider(create: (BuildContext context)=>HomeCubit()..getProducts(),),
      ],
      child:     const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Emotion Analysis',
        home: SplashScreen(),
      ),
    );
  }
}
