import 'package:flutter/material.dart';
import 'package:graduationproject/widgets/default_app_bar.dart';
import 'package:graduationproject/widgets/default_button.dart';

class FaceView extends StatelessWidget {
  const FaceView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context, 'Face Recognition'),
      body: Column(children: [
        Column(children: [
          Center(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/camera.png',
                  width: size.width * 0.73,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    top: size.height * 0.31,
                    left: size.width * 0.18,
                    child: Text(
                      'Click to open camera',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 18, bottom: 18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff6D5DF3))),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Make sure you are in the bright ',
                          style: TextStyle(fontSize: 18, fontFamily: 'inter'),
                        ),
                        Text(
                          '  environment.',
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
                      ' Look into the camera.',
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
                      ' Keep Your Face up.',
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
          SizedBox(
            height: size.height * 0.03,
          ),
          DefaultButton(
            size: size,
            txt: 'Get Result',
          )
        ]),
      ]),
    );
  }
}
