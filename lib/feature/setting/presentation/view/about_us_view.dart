import 'package:flutter/material.dart';

import '../../../../core/utils/constant.dart';
import 'widget/about_us_view_body.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context: context,text: 'About Us'),
      body: const AboutUsViewBody(),
    );
  }
}
