import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/feature/setting/presentation/view/widget/text_account.dart';

import '../../../../../core/utils/constant.dart';
import '../../manage/cubit/setting_cubit.dart';
import '../../manage/cubit/setting_states.dart';
import '../account_view.dart';


class Account extends StatelessWidget {
   const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit,SettingStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: InkWell(
            onTap: (){
              navigateTo(context, const AccountView());
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children:  [
                    //if(SettingCubit().get(context).profileModel !=null)
                    //   const CircleAvatar(
                    //   radius: 30,
                    //   backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg'
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(SettingCubit().get(context).profileModel !=null)
                          const TextAccount(),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Mobile Developer',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 18,),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}