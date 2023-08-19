// import 'package:flutter/material.dart';

// class VoiceSearchScreen extends StatelessWidget {
//   const VoiceSearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text('Recognized data')),
//     );
//   }
// }

import 'package:demo_search_application/Voice%20Search/voice_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: VoiceSearchScreen(),
//     );
//   }
// }

class RecognizedVoiceScreen extends StatefulWidget {
  const RecognizedVoiceScreen({super.key});

  @override
  _RecognizedVoiceScreenState createState() => _RecognizedVoiceScreenState();
}

class _RecognizedVoiceScreenState extends State<RecognizedVoiceScreen> {
  final controller = Get.put(VoiceSearchScreenController());
  
@override
  void initState() {
    super.initState();
    controller.initSpeech();
    controller.startListening();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: IconButton(onPressed: (){
        Get.back();
      }, icon: Icon(Icons.close)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Recognized Words:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Obx(() => Text(
              controller.lastWords.value,
              style: const TextStyle(fontSize: 24),
            )),
          ],
        ),
      ),
    );
  }
}
