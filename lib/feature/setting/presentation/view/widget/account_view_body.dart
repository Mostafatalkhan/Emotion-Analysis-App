import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/feature/setting/presentation/view/widget/text_field.dart';
import '../../../../../core/utils/constant.dart';
import '../../manage/cubit/setting_cubit.dart';
import '../../manage/cubit/setting_states.dart';
import 'account_image_and_text.dart';
import 'button_section.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit,SettingStates>(
      listener: (BuildContext context, state) {
        if(state is UpdateProfileSuccessStates)
          {
            if(state.profileModel.status!)
              {
                showToast(
                    text: 'Update Successfully',
                    color: Colors.green,
                );
              }
          }
      },
      builder: (BuildContext context, Object? state) {
        return ConditionalBuilder(
          condition: SettingCubit().get(context).profileModel !=null,
          builder: (BuildContext context) =>const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children:  [
                AccountImageAndTextSection(),
                TextFieldView(),
                AccountButtonViewSection(),
              ],
            ),
          ), fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }


}
