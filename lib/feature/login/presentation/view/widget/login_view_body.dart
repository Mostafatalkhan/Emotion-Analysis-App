import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/feature/Login/presentation/manage/cubit/login_cubit.dart';
import 'package:graduationproject/feature/Login/presentation/manage/cubit/login_states.dart';
import 'package:graduationproject/feature/login/presentation/view/widget/text_field_section.dart';
import 'package:graduationproject/views/home_view.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/shared_preference.dart';
import '../../../../register/presentation/view/register_view.dart';
import 'image_and_text_section.dart';
import 'material_button_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is LoginSuccessStates) {
          if (state.loginModel.status) {
            print(state.loginModel.message);
            print(state.loginModel.data!.token);
            SharedPreference.saveData(
              key: 'token',
              value: state.loginModel.data!.token,
            ).then((value) => {
              token=state.loginModel.data!.token!,
              navigateAndFinish(context,  const Home())
            });
            showToast(
                text: state.loginModel.message,
                color: Colors.green,
            );
          } else {
            showToast(
              text: state.loginModel.message,
              color: Colors.red,
            );
          }
        }
      },
      builder: (BuildContext context, Object? state) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Expanded(
                        child: Column(
                          children: [
                            ImageAndTextSection(),
                            SizedBox(
                              height: 30,
                            ),
                            TextFieldSection(),
                            SizedBox(
                              height: 20,
                            ),
                            MaterialButtonSection(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              navigateTo(
                                context,
                                const RegisterView(),
                              );
                            },
                            child: const Text(
                              'Sign Up',
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
              ),
            ),
          ],
        );
      },
    );
  }
}
