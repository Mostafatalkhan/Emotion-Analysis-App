// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:graduationproject/widgets/default_app_bar.dart';
// import 'package:graduationproject/widgets/default_button.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
//
// class FaceView extends StatefulWidget {
//   const FaceView({Key? key}) : super(key: key);
//
//   @override
//   State<FaceView> createState() => _FaceViewState();
// }
//
// class _FaceViewState extends State<FaceView> {
//   File? _image;
//   String _result = '';
//   bool _loading = false;
//   final ImagePicker _picker = ImagePicker();
//
//   final String rapidApiKey =
//       '5e84df6469msh678eda669f1db75p1ab887jsn5edddf0c7566'; // Replace with your RapidAPI key
//   final String rapidApiHost = 'faceanalyzer-ai.p.rapidapi.com';
//   final String endpoint = 'https://faceanalyzer-ai.p.rapidapi.com/faceanalysis';
//
//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final XFile? pickedFile = await _picker.pickImage(source: source);
//
//       if (pickedFile != null) {
//         setState(() {
//           _image = File(pickedFile.path);
//           _result = ''; // Clear the previous result
//         });
//       } else {
//         setState(() {
//           _result = 'No image selected.';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _result = 'Error picking image: $e';
//       });
//     }
//   }
//
//   Future<void> _analyzeFaces() async {
//     if (_image == null) return;
//
//     setState(() {
//       _loading = true; // Show loading indicator
//     });
//
//     try {
//       // Prepare request headers
//       Map<String, String> headers = {
//         'x-rapidapi-key': rapidApiKey,
//         'x-rapidapi-host': rapidApiHost,
//       };
//
//       // Prepare the request body
//       var request = http.MultipartRequest('POST', Uri.parse(endpoint))
//         ..headers.addAll(headers)
//         ..files.add(await http.MultipartFile.fromPath('image', _image!.path));
//
//       // Send POST request to RapidAPI Face Analyzer
//       var response = await request.send();
//
//       if (response.statusCode == 200) {
//         // Parse JSON response
//         var responseBody = await response.stream.bytesToString();
//         var jsonResponse = jsonDecode(responseBody);
//
//         // Extract and print emotions
//         List<dynamic> faces = jsonResponse['body']['faces'];
//         if (faces.isNotEmpty) {
//           var emotions = faces[0]['facialFeatures']['Emotions'];
//           // Convert the list to a string
//           String formattedEmotions = emotions.join(', ');
//           setState(() {
//             _result = formattedEmotions;
//           });
//         } else {
//           setState(() {
//             _result = 'No faces detected.';
//           });
//         }
//       } else {
//         setState(() {
//           _result = 'Error ${response.statusCode}: ${response.reasonPhrase}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _result = 'Error analyzing faces: $e';
//       });
//     } finally {
//       setState(() {
//         _loading = false; // Hide loading indicator
//       });
//     }
//
//     // Show result in a bottom sheet
//     _showBottomSheet(_result);
//   }
//
//   void _showBottomSheet(String result) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
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
//                   fontSize: 18,
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
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: defaultAppBar(context, 'Face Recognition'),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         _image == null
//                             ? const Text('No image selected.')
//                             : Image.file(
//                           _image!,
//                           width: double.infinity,
//                         ),
//                         const SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: () => _pickImage(ImageSource.gallery),
//                           child: const Text('Pick Image from Gallery'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () => _pickImage(ImageSource.camera),
//                           child: const Text('Take a Picture'),
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 16.0),
//                             child: Container(
//                               width: 7,
//                               height: 7,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: const Color(0xff6D5DF3))),
//                             ),
//                           ),
//                           const Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 ' Make sure you are in the bright ',
//                                 style: TextStyle(
//                                     fontSize: 18, fontFamily: 'inter'),
//                               ),
//                               Text(
//                                 '  environment.',
//                                 style: TextStyle(
//                                     fontSize: 18, fontFamily: 'inter'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             width: 7,
//                             height: 7,
//                             decoration: BoxDecoration(
//                                 border:
//                                 Border.all(color: const Color(0xff6D5DF3))),
//                           ),
//                           const Text(
//                             ' Look into the camera.',
//                             style: TextStyle(fontSize: 18, fontFamily: 'inter'),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             width: 7,
//                             height: 7,
//                             decoration: BoxDecoration(
//                                 border:
//                                 Border.all(color: const Color(0xff6D5DF3))),
//                           ),
//                           const Text(
//                             ' Keep Your Face up.',
//                             style: TextStyle(fontSize: 18, fontFamily: 'inter'),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             width: 7,
//                             height: 7,
//                             decoration: BoxDecoration(
//                                 border:
//                                 Border.all(color: const Color(0xff6D5DF3))),
//                           ),
//                           const Text(
//                             ' Click Get result.',
//                             style: TextStyle(fontSize: 18, fontFamily: 'inter'),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: size.height * 0.03,
//                   ),
//                   DefaultButton(
//                     size: size,
//                     txt: 'Get Result',
//                     function: _analyzeFaces, // Trigger face analysis
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           if (_loading)
//             Container(
//               color: Colors.black.withOpacity(0.5),
//               child: Center(
//                 child: LoadingAnimationWidget.threeRotatingDots(
//                   color: Colors.white, size: 70,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
