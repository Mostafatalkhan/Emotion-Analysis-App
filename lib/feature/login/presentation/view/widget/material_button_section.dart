import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/feature/Login/presentation/manage/cubit/login_cubit.dart';
import 'package:graduationproject/feature/Login/presentation/manage/cubit/login_states.dart';

import '../../../../../core/utils/constant.dart';

class MaterialButtonSection extends StatelessWidget {
  const MaterialButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = LoginCubit().get(context);
        return Column(
          children: [
            ConditionalBuilder(
              condition: state is! LoginLoadingStates,
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
                      cubit.userLogin(
                        email: loginEmailController.text,
                        password: loginPasswordController.text,
                      );
                  },
                  text: 'LOG IN',
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade900,
                  width: 220,
                  height: 60,
                ),
              ),
              fallback:(context)=> const Center(child: CircularProgressIndicator()),
            ),
            // const SizedBox(
            //   height: 30,
            // ),
            // const Text(
            //   'Or connect using',
            //   style: TextStyle(
            //     fontSize: 18,
            //     color: Colors.grey,
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 30,
            //   ),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: buildMaterialButton(
            //           text: 'f  Facebook',
            //           borderRadius: BorderRadius.circular(12),
            //           color: Colors.blue.shade700,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       Expanded(
            //         child: buildMaterialButton(
            //           text: 'G  Google',
            //           borderRadius: BorderRadius.circular(12),
            //           color: Colors.deepOrange,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
