// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class EmotionService {
//   final String apiUrl = 'https://api.edenai.run/v2/text/emotion_detection';
//   final String apiKey =
//       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYTM1MzY3MDktYmNmYi00OGNhLThjY2UtMmVjZDk5NDVmOTIyIiwidHlwZSI6ImFwaV90b2tlbiJ9.nM1-gYN36CObQJpUbQ8uyJW7XkPg1pewgdRkL_pr7QA';
//
//   Future<Map<String, dynamic>> detectEmotion(String text) async {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'Authorization': apiKey,
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         "providers": ["nlpcloud"],
//         "text": text,
//         "settings": {},
//         "response_as_dict": true,
//         "attributes_as_list": false,
//         "show_original_response": false,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> responseBody = jsonDecode(response.body);
//       if (responseBody.containsKey('nlpcloud') &&
//           responseBody['nlpcloud'].containsKey('items') &&
//           responseBody['nlpcloud']['items'] is List<dynamic> &&
//           responseBody['nlpcloud']['items'].isNotEmpty) {
//         Map<String, dynamic> firstItem = responseBody['nlpcloud']['items'][0];
//         return {
//           'emotion': firstItem['emotion'],
//           'emotion_score': firstItem['emotion_score'].toString(),
//         };
//       } else {
//         throw Exception('No emotion detected');
//       }
//     } else {
//       throw Exception('Failed to detect emotion');
//     }
//   }
// }
//
//
// class EmotionDetectorScreen extends StatefulWidget {
//   @override
//   _EmotionDetectorScreenState createState() => _EmotionDetectorScreenState();
// }
//
// class _EmotionDetectorScreenState extends State<EmotionDetectorScreen> {
//   final TextEditingController _textController = TextEditingController();
//   final EmotionService _emotionService = EmotionService();
//   Map<String, dynamic> _emotionResult = {};
//
//   void _detectEmotion() async {
//     String text = _textController.text;
//     if (text.isEmpty) {
//       return;
//     }
//
//     try {
//       Map<String, dynamic> result = await _emotionService.detectEmotion(text);
//       setState(() {
//         _emotionResult = result;
//       });
//     } catch (e) {
//       setState(() {
//         _emotionResult = {'error': 'Error: $e'};
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emotion Detector'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 labelText: 'Enter text',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _detectEmotion,
//               child: Text('Detect Emotion'),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Emotion Result:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             _emotionResult.containsKey('emotion')
//                 ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Emotion: ${_emotionResult['emotion']}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Score: ${_emotionResult['emotion_score']}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ],
//             )
//                 : Text(
//               _emotionResult.containsKey('error')
//                   ? _emotionResult['error']
//                   : 'No emotion detected',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:graduationproject/widgets/default_app_bar.dart';
import 'package:graduationproject/widgets/default_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EmotionService {
  final String apiUrl = 'https://api.edenai.run/v2/text/emotion_detection';
  final String apiKey =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiZmRkNDZlNDctNjZhNy00MWIwLTlmOWEtODlmOGFkYjE2MzQ2IiwidHlwZSI6ImFwaV90b2tlbiJ9.h40ZPj6DaqNg0vu1MIOE0HVOcVcr-sMIQiS_0A4Xm1M';

  Future<String> detectEmotion(String text) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': apiKey,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "providers": ["nlpcloud"],
        "text": text,
        "settings": {},
        "response_as_dict": true,
        "attributes_as_list": false,
        "show_original_response": false,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody.containsKey('nlpcloud') &&
          responseBody['nlpcloud'].containsKey('items') &&
          responseBody['nlpcloud']['items'] is List<dynamic> &&
          responseBody['nlpcloud']['items'].isNotEmpty) {
        Map<String, dynamic> firstItem = responseBody['nlpcloud']['items'][0];
        String emotion = firstItem['emotion'];

        if (emotion.toLowerCase() == "joy") {
          emotion = "happy";
        }

        return emotion;
      } else {
        return 'No emotion detected';
      }
    } else {
      return 'Failed to detect emotion';
    }
  }
}

class TextViewItem extends StatefulWidget {
  const TextViewItem({super.key});

  @override
  State<TextViewItem> createState() => _TextViewState();
}

class _TextViewState extends State<TextViewItem> {
  final TextEditingController _textController = TextEditingController();
  final EmotionService _emotionService = EmotionService();
  bool _loading = false;

  void _detectEmotion() async {
    String text = _textController.text;
    if (text.isEmpty) {
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      String result = await _emotionService.detectEmotion(text);
      setState(() {
        _loading = false;
      });
      _showBottomSheet(result);
    } catch (e) {
      setState(() {
        _loading = false;
      });
      _showBottomSheet('Error: $e');
    }
  }

  void _showBottomSheet(String result) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Analysis Result',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'You’re on a ',
                      style: TextStyle(
                        color: Color(0xFF100F11),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.24,
                      ),
                    ),
                    TextSpan(
                      text: '$result way! ',
                      style: const TextStyle(
                        color: Color(0xFF8B4CFC),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.24,
                      ),
                    ),
                    const TextSpan(
                      text: 'Your day is going ',
                      style: TextStyle(
                        color: Color(0xFF100F11),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.24,
                      ),
                    ),
                     TextSpan(
                      text: result,
                      style: const TextStyle(
                        color: Color(0xFF8B4CFC),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.24,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Keep tracking your mood to know how to improve your mental health.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xA5160B29),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Got it',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Add some space at the bottom
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: defaultAppBar(context, 'Text Analysis'),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                                  border: Border.all(color: const Color(0xff6D5DF3))),
                            ),
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ' Make sure to write in grammar ',
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
                    controller: _textController,
                    maxLines: 5,
                    maxLength: 2000,
                    decoration: InputDecoration(
                      hintText: 'Write Your Text Here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                DefaultButton(
                  size: size,
                  txt: 'Get Result',
                  function: _detectEmotion,
                )
              ]),
            ),
            if (_loading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: LoadingAnimationWidget.threeRotatingDots(
                    color: Colors.white, size: 70,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
