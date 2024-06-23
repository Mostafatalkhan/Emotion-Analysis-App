import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manage/cubit/setting_cubit.dart';
import '../../manage/cubit/setting_states.dart';
import 'item.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit,SettingStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=SettingCubit().get(context);
        if(state is NotificationSuccessStates) {
          return ListView.separated(
          itemBuilder: (context,index)=>Item(model: cubit.notificationModel!.data!.data![index]),
          separatorBuilder: (context,index)=>const SizedBox(
            height: 20,
          ),
          itemCount: cubit.notificationModel!.data!.data!.length,
        );
        }
        else if (state is NotificationErrorStates) {
          return Text(state.error);
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
