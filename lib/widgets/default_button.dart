// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    super.key,
    required this.size,
    required this.txt, required this.function,
  });
  String? txt;
  final Size size;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        child: Center(
          child: Text(
            txt!,
            style: TextStyle(
                fontFamily: 'Inter', fontSize: 24, color: Colors.white),
          ),
        ),
        width: size.width * 0.6,
        height: size.height * 0.093,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff6D5DF3), Color(0xff6CD8E1)])),
      ),
    );
  }
}
