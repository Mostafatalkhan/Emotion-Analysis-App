// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:file_picker/file_picker.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SpeechToTextScreen(),
//     );
//   }
// }
//
// class SpeechToTextScreen extends StatefulWidget {
//   @override
//   _SpeechToTextScreenState createState() => _SpeechToTextScreenState();
// }
//
// class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
//   String _responseText = '';
//   String _fileName = '';
//
//   Future<void> _pickAndUploadFile() async {
//     try {
//       final result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['wav', 'mp3', 'm4a'],
//       );
//
//       if (result != null) {
//         final file = File(result.files.single.path!);
//         await _transcribeFile(file);
//       }
//     } catch (e) {
//       print('Error picking file: $e');
//       setState(() {
//         _responseText = 'Failed to pick or upload file.';
//         _fileName = '';
//       });
//     }
//   }
//
//   Future<void> _transcribeFile(File file) async {
//     final url = Uri.parse('https://api.deepgram.com/v1/listen?smart_format=true&language=en&model=nova-2');
//     final token = 'Token a53963f6ca4c443d909b1f88b0d9758975b85ffd';
//
//     final request = http.Request('POST', url)
//       ..headers['Authorization'] = token
//       ..headers['Content-Type'] = 'audio/mpeg'
//       ..bodyBytes = await file.readAsBytes();
//
//     final response = await http.Response.fromStream(await request.send());
//     if (response.statusCode == 200) {
//       final responseData = jsonDecode(response.body);
//       final List<dynamic>? alternatives =
//       responseData['results']['channels'][0]['alternatives'];
//       if (alternatives != null) {
//         // Prepare the full response text for display
//         setState(() {
//           _responseText = jsonEncode(responseData['results']['channels'][0]['alternatives'][0]['transcript']); // Displaying entire JSON response for simplicity
//           _fileName = file.path.split('/').last;
//         });
//       }
//       else {
//         setState(() {
//           _responseText = 'No transcription alternatives found.';
//           _fileName = '';
//         });
//       }
//     } else {
//       print('Error: ${response.reasonPhrase}');
//       setState(() {
//         _responseText = 'Failed to transcribe audio.';
//         _fileName = '';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Voice File'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _pickAndUploadFile,
//               child: Text('Pick and Upload Voice File'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Selected file: $_fileName',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'API Response:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     _responseText,
//                     style: TextStyle(fontSize: 14),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
