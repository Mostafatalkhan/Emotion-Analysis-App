// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:graduationproject/views/home_view.dart';

class SignButton extends StatelessWidget {
  SignButton({
    //required this.fun,
    super.key,
    required this.size,
    required this.txt,
  });
  String? txt;
  final Size size;
  Function? fun;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      },
      child: Container(
        child: Center(
          child: Text(
            txt!,
            style: TextStyle(
                fontFamily: 'Inter', fontSize: 18, color: Colors.white),
          ),
        ),
        width: double.infinity,
        height: size.height * 0.066,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff6D5DF3), Color(0xff6CD8E1)])),
      ),
    );
  }
}
