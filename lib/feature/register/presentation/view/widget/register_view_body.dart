import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/feature/register/presentation/view/widget/text_field_section.dart';
import 'package:graduationproject/feature/register/presentation/view/widget/text_view.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../login/presentation/view/login_view.dart';
import '../../manage/cubit/register_cubit.dart';
import '../../manage/cubit/register_states.dart';
import 'button_view.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (BuildContext context, state) {
        if(state is RegisterSuccessStates)
          {
            if(state.registerModel.status!)
              {
                print(state.registerModel.message);
                print(state.registerModel.data!.token);
                showToast(
                  text: state.registerModel.message!,
                  color: Colors.green,
                );
                navigateAndFinish(context, const LoginView());
              }
            else{
              showToast(
                text: state.registerModel.message!,
                color: Colors.red,
              );
            }
          }
      },
      builder: (BuildContext context, Object? state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child:  Column(
                  children: [
                    const Expanded(
                      child: Column(
                        children: [
                          TextView(),
                          SizedBox(
                            height: 30,
                          ),
                          TextFieldSection(),
                          SizedBox(
                            height: 30,
                          ),
                          ButtonView(),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(
                              context,
                              const LoginView(),
                            );
                          },
                          child: const Text(
                            'Login here',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
