import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    required this.w,
    required this.icon,
    required this.image,
    required this.text,
    super.key,
    required this.size,
  });
  double? w;
  String? text;
  String? icon;
  String? image;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.27,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29.0),
        ),
        elevation: 5,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: Image.asset(
                image!,
                width: size.width * 0.95,
                height: size.height * 0.21,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                top: size.height * 0.22,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                  ),
                  child: Row(
                    children: [
                      Text(
                        text!,
                        style: TextStyle(fontSize: 25, fontFamily: 'ABeeZee'),
                      ),
                      SizedBox(
                        width: size.width * w!,
                      ),
                      SizedBox(
                          child: Image.asset(height: 30, width: 30, icon!)),
                      // SvgPicture.asset(
                      //   height: 25,
                      //   width: 25,
                      //   'assets/images/speaking-head.svg',
                      // ),
                    ],
                  ),
                ))
          ],
        ),
        // decoration: BoxDecoration(
        //     color: Colors.white, borderRadius: BorderRadius.circular(29)),
        // height: size.height * 0.26,
        //      color: Colors.blue,
      ),
    );
  }
}
