import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceSearchScreenController extends GetxController {
  List<String> books = [
    'In Search of Lost Time',
    'Ramayan',
    'Mahabharat',
    'Sruti and Smriti',
    'Abhang',
    'Gita Govinda',
    'Lilavati',
    'Yajur Veda',
  ];
  SpeechToText speechToText = SpeechToText();
  RxBool speechEnabled = false.obs;
  RxString lastWords = ''.obs;
  TextEditingController searchController = TextEditingController();
  RxList matchData = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initSpeech();
  }

  void initSpeech() async {
    speechEnabled.value = await speechToText.initialize();
    print('voice search initialized');
  }

  void startListening() async {
    initSpeech();
    await speechToText.listen(onResult: onSpeechResult);
    update(['updateVoice']);
    print('started listen');
  }

  void stopListening() async {
    await speechToText.stop();
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    matchData.clear();
    lastWords.value = result.recognizedWords;
    searchController.text = result.recognizedWords;
    //  if (searchController.text.isNotEmpty) {
      for (var i = 0; i < books.length; i++) {
        if(books[i].contains(searchController.text) || books[i] == searchController.text){
          matchData.add(books[i]);
        }
        
      }
        // matchData.add( books.where((element) => element.toLowerCase().contains(searchController.text)))
            // ;
        print('matched data 1---->${matchData.toString()}');
      // } else {
      //   matchData.clear();
      // }
    
    // searchInList(searchController.text);
    // update(['updateVoice']);
    print('on result checked---  ${searchController.text}');
   
  }

  void searchInList(String searchData) {
    searchController.addListener(() {
      lastWords.value = searchController.text;
      if (searchController.text.isNotEmpty) {
        matchData.value = books
            .where((element) => element.toLowerCase().contains(searchData))
            .toList();
        print('matched data---->${matchData.toString()}');
      } else {
        matchData.clear();
      }
    });
  }
}
