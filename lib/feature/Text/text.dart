// lib/emotion_service.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmotionService {
  final String apiUrl = 'https://api.edenai.run/v2/text/emotion_detection';
  final String apiKey = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYTM1MzY3MDktYmNmYi00OGNhLThjY2UtMmVjZDk5NDVmOTIyIiwidHlwZSI6ImFwaV90b2tlbiJ9.nM1-gYN36CObQJpUbQ8uyJW7XkPg1pewgdRkL_pr7QA';

  Future<Map<String, dynamic>> detectEmotion(String text) async {
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
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to detect emotion');
    }
  }
}

class EmotionDetectorScreen extends StatefulWidget {
  @override
  _EmotionDetectorScreenState createState() => _EmotionDetectorScreenState();
}

class _EmotionDetectorScreenState extends State<EmotionDetectorScreen> {
  final TextEditingController _textController = TextEditingController();
  final EmotionService _emotionService = EmotionService();
  String _emotionResult = '';

  void _detectEmotion() async {
    String text = _textController.text;
    if (text.isEmpty) {
      return;
    }

    try {
      Map<String, dynamic> result = await _emotionService.detectEmotion(text);
      setState(() {
        _emotionResult = result.toString();
      });
    } catch (e) {
      setState(() {
        _emotionResult = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emotion Detector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _detectEmotion,
              child: Text('Detect Emotion'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Emotion Result:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              _emotionResult,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
