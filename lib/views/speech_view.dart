import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/widgets/default_app_bar.dart';
import 'package:graduationproject/widgets/default_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SpeechView extends StatefulWidget {
  const SpeechView({super.key});

  @override
  State<SpeechView> createState() => _SpeechViewState();
}

class _SpeechViewState extends State<SpeechView> {
  String _responseText = '';
  String _fileName = '';
  File? _selectedFile;

  final EmotionService _emotionService = EmotionService();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _loading = false;
  String _emotionResult = '';

  void _detectEmotion() async {
    String text = _responseText;
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
        _emotionResult = result;
      });

      _showBottomSheet();
    } catch (e) {
      setState(() {
        _loading = false;
      });
      _showBottomSheet('Error: $e');
    }
  }

  void _playAudio() async {
    if (_selectedFile?.path != null) {
      await _audioPlayer.play(DeviceFileSource(_selectedFile!.path));
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _showBottomSheet([String? result]) {
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
                      text: 'Your emotion is ',
                      style: TextStyle(
                        color: Color(0xFF100F11),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.24,
                      ),
                    ),
                    TextSpan(
                      text: _emotionResult,
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

  Future<void> _pickAndUploadFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['wav', 'mp3', 'm4a'],
      );

      if (result != null) {
        final file = File(result.files.single.path!);
        setState(() {
          _selectedFile = file;
          _fileName = file.path.split('/').last;
        });
        await _transcribeFile(file);
      }
    } catch (e) {
      print('Error picking file: $e');
      setState(() {
        _responseText = 'Failed to pick or upload file.';
        _fileName = '';
        _selectedFile = null;
      });
    }
  }

  Future<void> _transcribeFile(File file) async {
    final url = Uri.parse('https://api.deepgram.com/v1/listen?smart_format=true&language=en&model=nova-2');
    final token = 'Token a53963f6ca4c443d909b1f88b0d9758975b85ffd';

    final request = http.Request('POST', url)
      ..headers['Authorization'] = token
      ..headers['Content-Type'] = 'audio/mpeg'
      ..bodyBytes = await file.readAsBytes();

    final response = await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final List<dynamic>? alternatives =
      responseData['results']['channels'][0]['alternatives'];
      if (alternatives != null && alternatives.isNotEmpty) {
        setState(() {
          _responseText = alternatives[0]['transcript'];
        });
      } else {
        setState(() {
          _responseText = 'No transcription alternatives found.';
        });
      }
    } else {
      print('Error: ${response.reasonPhrase}');
      setState(() {
        _responseText = 'Failed to transcribe audio.';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context, 'Speech Analysis'),
      body: Stack(
        children: [
          Column(children: [
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
              onTap: _pickAndUploadFile,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: size.height * 0.086,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Upload Voice File',
                                style: TextStyle(fontFamily: 'inter', fontSize: 18),
                              ),
                            ],
                          ),
                          Spacer(),
                          Image.asset('assets/images/upload.png'),
                        ],
                      ),
                    ),
                  )),
            ),
            if (_selectedFile?.path != null) ...[
              ElevatedButton(
                onPressed: _playAudio,
                child: const Text(
                  'Play Audio',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
            // const SizedBox(
            //   height: 8,
            // ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //       height: size.height * 0.09,
            //       width: size.width * 0.84,
            //       child: Card(
            //         elevation: 8,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(16)),
            //         child: Padding(
            //           padding: const EdgeInsets.only(left: 10),
            //           child: Row(
            //             children: [
            //               const Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Padding(
            //                     padding: EdgeInsets.only(top: 20.0),
            //                     child: Text(
            //                       'Tap here to Talk   ',
            //                       style:
            //                           TextStyle(fontFamily: 'inter', fontSize: 18),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               const SizedBox(
            //                 width: 70,
            //               ),
            //               Image.asset(
            //                 'assets/images/microphone.png',
            //                 width: 45,
            //               ),
            //             ],
            //           ),
            //         ),
            //       )),
            // ),
            SizedBox(
              height: size.height * 0.03,
            ),
            DefaultButton(
              size: size,
              txt: 'Get Result',
              function: _detectEmotion,
            )
          ]),
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
    );
  }
}

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


