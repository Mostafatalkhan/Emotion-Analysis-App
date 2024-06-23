import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/constant.dart';
import '../../manage/cubit/setting_cubit.dart';
import '../../manage/cubit/setting_states.dart';

class TextFieldView extends StatelessWidget {
  const TextFieldView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SettingCubit,SettingStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit = SettingCubit().get(context).profileModel;
        if(cubit !=null)
        {
          profileNameController.text = cubit.data!.name!;
          profileEmailController.text = cubit.data!.email!;
          profilePhoneController.text = cubit.data!.phone!;
        }
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              textFormField(
                text: 'Name',
                type: TextInputType.name,
                controller: profileNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              textFormField(
                text: 'Email',
                type: TextInputType.emailAddress,
                controller: profileEmailController,
              ),
              const SizedBox(
                height: 20,
              ),
              textFormField(
                text: 'Phone',
                type: TextInputType.phone,
                controller: profilePhoneController,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
