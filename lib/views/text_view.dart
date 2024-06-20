import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduationproject/widgets/default_app_bar.dart';
import 'package:graduationproject/widgets/default_button.dart';

class TextView extends StatelessWidget {
  const TextView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: defaultAppBar(context, 'Text Analysis'),
        body: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Image.asset(
                'assets/images/smile.png',
                width: size.width * 0.73,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                top: 18,
                bottom: 18,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff6D5DF3))),
                        ),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Make sure to write in grammer ',
                            style: TextStyle(fontSize: 18, fontFamily: 'inter'),
                          ),
                          Text(
                            ' correctly.',
                            style: TextStyle(fontSize: 18, fontFamily: 'inter'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff6D5DF3))),
                      ),
                      const Text(
                        ' Write your text.',
                        style: TextStyle(fontSize: 18, fontFamily: 'inter'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff6D5DF3))),
                      ),
                      const Text(
                        ' Click Get result.',
                        style: TextStyle(fontSize: 18, fontFamily: 'inter'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                  maxLines: 5,
                  maxLength: 2000,
                  decoration: InputDecoration(
                      hintText: 'Write Your Text Here',
                      //  prefixIcon: Icon(Icons.edit),
                      //  suffixIcon: Icon(Icons.edit),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)))),
            ),
            const SizedBox(
              height: 8,
            ),
            DefaultButton(
              size: size,
              txt: 'Get Result',
            )
          ]),
        ),
      ),
    );
  }
}
