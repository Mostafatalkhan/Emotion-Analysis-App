// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:graduationproject/widgets/default_app_bar.dart';
// import 'package:graduationproject/widgets/default_button.dart';
//
// class TextView extends StatefulWidget {
//   const TextView({super.key});
//
//   @override
//   State<TextView> createState() => _TextViewState();
// }
//
// class _TextViewState extends State<TextView> {
//
//   void _showBottomSheet(String result) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 'Analysis Result',
//                 style: TextStyle(
//                   fontSize: 25,
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text.rich(
//                 TextSpan(
//                   children: [
//                     const TextSpan(
//                       text: 'You’re on a ',
//                       style: TextStyle(
//                         color: Color(0xFF100F11),
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: 0.24,
//                       ),
//                     ),
//                     TextSpan(
//                       text: '$result way! ',
//                       style: const TextStyle(
//                         color: Color(0xFF8B4CFC),
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: 0.24,
//                       ),
//                     ),
//                     const TextSpan(
//                       text: 'Your day is going ',
//                       style: TextStyle(
//                         color: Color(0xFF100F11),
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: 0.24,
//                       ),
//                     ),
//                     const TextSpan(
//                       text: 'amazing',
//                       style: TextStyle(
//                         color: Color(0xFF8B4CFC),
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: 0.24,
//                       ),
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Keep tracking your mood to know how to improve your mental health.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xA5160B29),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text(
//                     'Got it',
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10), // Add some space at the bottom
//             ],
//           ),
//         );
//       },
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         appBar: defaultAppBar(context, 'Text Analysis'),
//         body: SingleChildScrollView(
//           child: Column(children: [
//             Center(
//               child: Image.asset(
//                 'assets/images/smile.png',
//                 width: size.width * 0.73,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 40.0,
//                 top: 18,
//                 bottom: 18,
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 7.0),
//                         child: Container(
//                           width: 7,
//                           height: 7,
//                           decoration: BoxDecoration(
//                               border:
//                                   Border.all(color: const Color(0xff6D5DF3))),
//                         ),
//                       ),
//                       const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             ' Make sure to write in grammer ',
//                             style: TextStyle(fontSize: 18, fontFamily: 'inter'),
//                           ),
//                           Text(
//                             ' correctly.',
//                             style: TextStyle(fontSize: 18, fontFamily: 'inter'),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 7,
//                         height: 7,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: const Color(0xff6D5DF3))),
//                       ),
//                       const Text(
//                         ' Write your text.',
//                         style: TextStyle(fontSize: 18, fontFamily: 'inter'),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 7,
//                         height: 7,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: const Color(0xff6D5DF3))),
//                       ),
//                       const Text(
//                         ' Click Get result.',
//                         style: TextStyle(fontSize: 18, fontFamily: 'inter'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: TextFormField(
//                   maxLines: 5,
//                   maxLength: 2000,
//                   decoration: InputDecoration(
//                       hintText: 'Write Your Text Here',
//                       //  prefixIcon: Icon(Icons.edit),
//                       //  suffixIcon: Icon(Icons.edit),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(16)))),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             DefaultButton(
//               size: size,
//               txt: 'Get Result',
//               function: (){},
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
