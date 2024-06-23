import 'package:flutter/material.dart';
import 'package:graduationproject/widgets/default_app_bar.dart';
import 'package:graduationproject/widgets/default_button.dart';

class SpeechView extends StatelessWidget {
  const SpeechView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context, 'Speech Analysis'),
      body: Column(children: [
        Center(
          child: Image.asset(
            'assets/images/speech.png',
            width: size.width * 0.73,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, top: 18, bottom: 18),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff6D5DF3))),
                  ),
                  const Text(
                    ' Make sure you voice is clear.',
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
                    ' Upload voice from your device.',
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
                    ' Talk into microphone.',
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
        GestureDetector(
          onTap: () {},
          child: Container(
              height: size.height * 0.09,
              width: size.width * 0.84,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tap here to uplaod the  ',
                            style: TextStyle(fontFamily: 'inter', fontSize: 18),
                          ),
                          Text(
                            'voice',
                            style: TextStyle(fontFamily: 'inter', fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset('assets/images/upload.png'),
                    ],
                  ),
                ),
              )),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
              height: size.height * 0.09,
              width: size.width * 0.84,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              'Tap here to Talk   ',
                              style:
                                  TextStyle(fontFamily: 'inter', fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      Image.asset(
                        'assets/images/microphone.png',
                        width: 45,
                      ),
                    ],
                  ),
                ),
              )),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        DefaultButton(
          size: size,
          txt: 'Get Result',
          function: (){},
        )
      ]),
    );
  }
}
