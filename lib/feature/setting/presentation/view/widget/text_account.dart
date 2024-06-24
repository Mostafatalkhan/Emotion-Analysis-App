import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant.dart';
import '../../manage/cubit/setting_cubit.dart';
import '../../manage/cubit/setting_states.dart';

class TextAccount extends StatelessWidget {
  const TextAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit,SettingStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit = SettingCubit().get(context).profileModel;
        if(cubit !=null)
        {
          profileNameController.text = cubit.data!.name!;
        }
        return Column(
          children: [
            Text(
              SettingCubit().get(context).profileModel!.data!.name!,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
