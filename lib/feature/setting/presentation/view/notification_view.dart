import 'package:flutter/material.dart';

import '../../../../core/utils/constant.dart';
import 'widget/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body:  const NotificationViewBody(),
    );
  }
}
