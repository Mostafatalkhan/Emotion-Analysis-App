import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constant.dart';
import '../../manage/cubit/setting_cubit.dart';
import '../../manage/cubit/setting_states.dart';

class AccountButtonViewSection extends StatelessWidget {
  const AccountButtonViewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit,SettingStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: ConditionalBuilder(
            condition: state is! UpdateProfileLoadingStates,
            builder: (BuildContext context) =>buildMaterialButton(
              function: () {
                SettingCubit().get(context).updateProfile(
                  name: profileNameController.text,
                  email: profileEmailController.text,
                  phone: profilePhoneController.text,
                );
              },
              width: 300,
              text: 'Update Profile',
              borderRadius: BorderRadius.circular(8),
              color: Colors.blueGrey,
            ),
            fallback: (BuildContext context) =>const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
