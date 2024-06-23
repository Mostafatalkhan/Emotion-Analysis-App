import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant.dart';
import '../../manage/cubit/register_cubit.dart';
import '../../manage/cubit/register_states.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = RegisterCubit().get(context);
        return ConditionalBuilder(
          condition: state is! RegisterLoadingStates,
          builder: (context)=>Card(
            elevation: 15,
            shadowColor: Colors.blue.shade50,
            color: Colors.blue,
            shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            child: buildMaterialButton(
              function: () {
                if(registerPasswordController.text == registerConfirmPasswordController.text)
                  {
                    cubit.userRegister(
                      email: registerEmailController.text,
                      password: registerPasswordController.text,
                      name: registerNameController.text,
                      phone: registerPhoneController.text,
                    );
                  }
                else
                  {
                    showToast(
                      text:'كلمة السر غير متطابقة',
                      color: Colors.red,
                    );
                  }

              },
              text: 'Create',
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue.shade900,
              width: 220,
              height: 60,
            ),
          ),
          fallback: (context)=>const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
