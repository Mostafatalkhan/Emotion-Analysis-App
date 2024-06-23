import 'package:flutter/material.dart';

import '../../../data/model/notification_model.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.model}) : super(key: key);

  final Data model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              '${model.title}',
              style:const TextStyle(
                  fontSize: 20,
                  color: Colors.black
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${model.message}',
              style:const TextStyle(
                  fontSize: 20,
                  color: Colors.grey
              ),
            ),
          ],
        ),
      ),
    );
  }
}
