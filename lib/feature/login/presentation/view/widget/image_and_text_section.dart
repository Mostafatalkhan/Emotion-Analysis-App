import 'package:flutter/material.dart';

class ImageAndTextSection extends StatelessWidget {
  const ImageAndTextSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/images (1).jpeg'),
            ),
          ),
        ),
        const Text(
          'Welcome back!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Log in to your existant account',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
