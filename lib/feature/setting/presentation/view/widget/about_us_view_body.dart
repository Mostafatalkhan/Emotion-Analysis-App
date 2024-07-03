import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class AboutUsViewBody extends StatelessWidget {

  const AboutUsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo.jpg',
            width: 250,
          ),
          const SizedBox(height: 10),
          const Text(
            'This App specializes in emotion analysis technology, utilizing text, video, and voice to accurately interpret human emotions. Our innovative application integrates machine learning, natural language processing, facial recognition, and voice analysis to deliver real-time insights across various interactions.',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

}
