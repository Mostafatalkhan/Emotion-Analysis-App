import 'package:flutter/material.dart';

import '../../../../core/utils/constant.dart';
import 'widget/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const SettingViewBody(),
    );
  }
}
