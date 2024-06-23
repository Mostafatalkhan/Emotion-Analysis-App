import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';

class TextFieldSection extends StatelessWidget {
   const TextFieldSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTextField(
          text: 'Name',
          prefixIcon: Icons.person_outline,
          controller: registerNameController,
          type: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        buildTextField(
          text: 'Email',
          prefixIcon: Icons.mail_outline,
          controller: registerEmailController,
          type: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 20,
        ),
        buildTextField(
          text: 'Phone',
          prefixIcon: Icons.phone_android,
          controller: registerPhoneController,
          type: TextInputType.phone,
        ),
        const SizedBox(
          height: 20,
        ),
        buildTextField(
          text: 'Password',
          prefixIcon: Icons.lock_open,
          controller: registerPasswordController,
          type: TextInputType.visiblePassword,
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        buildTextField(
          text: 'Confirm Password',
          prefixIcon: Icons.lock_open,
          controller: registerConfirmPasswordController,
          type: TextInputType.visiblePassword,
          obscureText: true,
        ),
      ],
    );
  }
}
