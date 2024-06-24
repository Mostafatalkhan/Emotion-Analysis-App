import 'package:flutter/material.dart';
import 'package:graduationproject/views/home_view.dart';
import 'package:graduationproject/views/register.dart';
import 'package:graduationproject/widgets/custom_text_field.dart';
import 'package:graduationproject/widgets/default_button.dart';
import 'package:graduationproject/widgets/sign_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});
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
              Center(
                child: Image.asset(
                  'assets/images/images (1).jpeg',
                  width: size.width * 0.7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: customTextField(
                  type: TextInputType.emailAddress,
                  hinttxt: 'Username or Email',
                  preficon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: customTextField(
                  type: TextInputType.visiblePassword,
                  hinttxt: '********',
                  preficon: Icon(
                    Icons.lock_open_outlined,
                  ),
                  suficon: Icon(Icons.remove_red_eye),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  children: [
                    Container(
                        color: Color(0xff3F80FF),
                        child: Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 6,
                    ),
                    Text('Remember Me'),
                    Spacer(),
                    TextButton(
                        onPressed: () {}, child: Text('Forget Password?')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: SignButton(
                  size: size,
                  txt: 'Log in',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don`t have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ));
                      },
                      child: Text('register'))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
