import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTextField(
          text: 'Email',
          prefixIcon: Icons.mail_outline,
          controller: loginEmailController,
          type: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 20,
        ),
        buildTextField(
          text: 'Password',
          prefixIcon: Icons.lock_open,
          controller: loginPasswordController,
          type: TextInputType.visiblePassword,
          obscureText: true,
        ),
        // Align(
        //   alignment: AlignmentDirectional.topEnd,
        //   child: TextButton(
        //     onPressed: () {},
        //     child: const Text(
        //       'Forget Password?',
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 16,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
