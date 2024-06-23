import 'package:flutter/material.dart';

import '../../../../core/utils/constant.dart';
import 'widget/account_view_body.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: appBar(context: context,text: 'Edit Profile',
      ),
      body: const AccountViewBody(),
    );
  }
}
