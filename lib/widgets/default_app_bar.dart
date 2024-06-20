import 'package:flutter/material.dart';

AppBar defaultAppBar(BuildContext context, String text) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: const Icon(
        size: 28,
        Icons.arrow_circle_left_outlined,
        color: Color(0xff253544),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: true,
    title: Text(
      text,
      style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
    ),
  );
}
