import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/constant.dart';
import '../../manage/cubit/setting_cubit.dart';
import '../../manage/cubit/setting_states.dart';

class ChangePasswordViewBody extends StatelessWidget {
  ChangePasswordViewBody({Key? key}) : super(key: key);

  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BlocConsumer<SettingCubit, SettingStates>(
        listener: (BuildContext context, state) {
          if (state is ChangePasswordSuccessStates) {
            if (state.changePasswordModel.status!) {
              return showToast(
                  text: state.changePasswordModel.message!,
                  color: Colors.green);
            } else {
              return showToast(
                  text: state.changePasswordModel.message!, color: Colors.red);
            }
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = SettingCubit().get(context);
          return Column(
            children: [
              textFormField(
                text: 'Current Password',
                isObscureText: true,
                type: TextInputType.visiblePassword,
                controller: currentPasswordController,
              ),
              const SizedBox(
                height: 30,
              ),
              textFormField(
                text: 'New Password',
                isObscureText: true,
                type: TextInputType.visiblePassword,
                controller: newPasswordController,
              ),
              const SizedBox(
                height: 30,
              ),
              textFormField(
                text: 'Confirm Password',
                isObscureText: true,
                type: TextInputType.visiblePassword,
                controller: confirmNewPasswordController,
              ),
              const SizedBox(
                height: 30,
              ),
              ConditionalBuilder(
                condition:state is! ChangePasswordLoadingStates,
                builder:(context)=>Padding(
                  padding: const EdgeInsets.symmetric(
                    //horizontal: 20,
                    vertical: 10,
                  ),
                  child: buildMaterialButton(
                    function: () {
                      if (newPasswordController.text ==
                          confirmNewPasswordController.text) {
                        cubit.changePassword(
                          current_password: currentPasswordController.text,
                          new_password: newPasswordController.text,
                        );
                      } else {
                        showToast(
                          text: 'The Password is not identical',
                          color: Colors.red,
                        );
                      }
                    },
                    width: 300,
                    text: 'Update Password',
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueGrey,
                  ),
                ),
                fallback:(context)=>const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        },
      ),
    );
  }
}
