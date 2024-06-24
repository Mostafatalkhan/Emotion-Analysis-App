import 'package:flutter/material.dart';
import 'package:graduationproject/widgets/custom_text_field.dart';
import 'package:graduationproject/widgets/sign_button.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: size.height * 0.25,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: IconButton(
                              icon: const Icon(
                                size: 28,
                                Icons.arrow_circle_left_outlined,
                                color: Color(0xff253544),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    Image.asset(
                      'assets/images/images (1).jpeg',
                      width: size.width * 0.5,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Name'),
                      customTextField(
                          hinttxt: 'Full Name',
                          preficon: Icon(Icons.person_2),
                          type: TextInputType.name),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Username'),
                      customTextField(
                          hinttxt: 'UserName',
                          preficon: Icon(Icons.account_box_outlined)),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Phone Number',
                      ),
                      customTextField(
                          hinttxt: '+201118604615',
                          preficon: Icon(Icons.phone_android_rounded),
                          type: TextInputType.number),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Email'),
                      customTextField(
                          hinttxt: 'You@gmail.com',
                          preficon: Icon(Icons.email_outlined),
                          type: TextInputType.emailAddress),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Password'),
                      customTextField(
                          hinttxt: '************',
                          suficon: Icon(Icons.remove_red_eye_outlined),
                          preficon: Icon(Icons.lock_outline_rounded),
                          type: TextInputType.visiblePassword),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Confirm Password'),
                      customTextField(
                          hinttxt: '************',
                          preficon: Icon(Icons.lock_outline_rounded),
                          type: TextInputType.visiblePassword,
                          suficon: Icon(Icons.remove_red_eye_outlined)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SignButton(size: size, txt: 'Sign up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
