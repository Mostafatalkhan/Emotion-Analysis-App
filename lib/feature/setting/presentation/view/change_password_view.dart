import 'package:flutter/material.dart';

import '../../../../core/utils/constant.dart';
import 'widget/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: appBar(context: context,text: 'Change Password'),
      body:  ChangePasswordViewBody(),
    );
  }

}
