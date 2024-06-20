import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  customTextField({
    this.type,
    this.hinttxt,
    this.preficon,
    this.suficon,
    super.key,
  });
  String? hinttxt;
  Icon? suficon;
  Icon? preficon;
  TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      decoration: InputDecoration(
          hintText: hinttxt,
          suffixIcon: suficon,
          prefixIcon: preficon,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB2CCFF)),
              borderRadius: BorderRadius.circular(6)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB2CCFF)),
              borderRadius: BorderRadius.circular(6))),
    );
  }
}
