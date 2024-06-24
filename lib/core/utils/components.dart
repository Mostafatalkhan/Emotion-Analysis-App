import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_styles.dart';

Widget buildContainer({
  required String text,
  required Function function,
}) =>
    GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: 48,
        padding: const EdgeInsets.all(14),
        decoration: ShapeDecoration(
          color: const Color(0xFF3F80FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles.styleMedium18.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

PreferredSizeWidget buildAppBar() => AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xB2B2CCFF)),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Center(
              child: Text(
                'Skip',
                style: AppStyles.styleSemiBold16
                    .copyWith(color: const Color(0xFF3F80FF)),
              ),
            ),
          ),
        ],
      ),
    );

Widget buildTextField({
  required TextInputType textInputType,
  required IconData prefixIcon,
  IconData? suffixIcon,
  required String text,
  bool obscureText = false,
  required TextEditingController controller,
   Function? suffixFunction,
    required dynamic validateFunction,
}) =>
    TextFormField(
      style: const TextStyle(
        color: Color(0xFF919AAB),
        fontSize: 16,
      ),
      validator: validateFunction,
      cursorHeight: 20,
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xB2B2CCFF),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xB2B2CCFF),
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xB2B2CCFF),
            ),
          ),
          prefixIcon: Icon(
            prefixIcon,
            size: 16,
            color: const Color(0xff001640),
          ),
          suffixIcon: IconButton(
            onPressed: (){
              suffixFunction!();
              },
            icon: Icon(
            suffixIcon,
            size: 16,
            color: const Color(0xff001640),),
          ),
          hintText: text,
          hintStyle: AppStyles.styleRegular12
              .copyWith(color: const Color(0xFF919AAB))),
    );

Future<void> buildShowDialog({
  required context,
  required String image,
  required String name,
  required Function function,
}) =>
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  image,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(name),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      function();
                    },
                    child: const Text('OK'),
                  ),
                ),
              ],
            ),
          ),
    );

Future buildShowLoading(context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Please Wait'),
          content: SizedBox(
            height: 50,
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      });
}


Widget textFormField({
  required String text,
  required TextInputType type,
  required TextEditingController controller,
  bool isObscureText=false,
}) =>
    TextFormField(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      obscureText: isObscureText,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
          label: Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          )),
    );


Widget customLoadingView()=>const Center(child: CircularProgressIndicator());