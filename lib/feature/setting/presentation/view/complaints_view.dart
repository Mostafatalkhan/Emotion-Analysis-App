import 'package:flutter/material.dart';

import '../../../../core/utils/constant.dart';
import 'widget/complaints_view_body.dart';

class ComplaintsView extends StatelessWidget {
  const ComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: appBar(context: context,text: 'Add Complaints'),
      body:  ComplaintsViewBody(),
    );
  }
}
