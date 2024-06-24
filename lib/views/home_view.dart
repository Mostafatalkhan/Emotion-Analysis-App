import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/constant.dart';
import 'package:graduationproject/feature/Text/text_view.dart';
import 'package:graduationproject/feature/setting/presentation/view/setting_view.dart';
import 'package:graduationproject/views/face_view.dart';
import 'package:graduationproject/views/speech_view.dart';
import 'package:graduationproject/views/text_view.dart';
import 'package:graduationproject/widgets/card_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: SizedBox(
          width: 500,
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Image.asset(
                  'assets/images/logo.jpg',
                  width: 50,
                  height: 50,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Choose option',
                  style: TextStyle(
                      fontSize: 26, fontFamily: 'Inter', color: Colors.black),
                ),
              ),
              const Icon(
                Icons.touch_app,
                color: Colors.black,
              )
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            navigateTo(context, const SettingView());
          }, icon: const Icon(Icons.settings),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SpeechView();
                },
              ));
            },
            child: CardWidget(
              w: 0.25,
              size: size,
              text: 'Speech Analysis',
              image: 'assets/images/voice.png',
              icon: 'assets/images/speaking.png',
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const TextViewItem();
                },
              ));
            },
            child: CardWidget(
                w: 0.34,
                icon: 'assets/images/text icon.png',
                image: 'assets/images/Text.png',
                text: 'Text Analysis',
                size: size),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return FaceView();
                },
              ));
            },
            child: CardWidget(
                w: 0.23,
                icon: 'assets/images/face-detection.png',
                image: 'assets/images/face-reco.jpg',
                text: 'Face Recognition',
                size: size),
          )
        ]),
      ),
    );
  }
}
