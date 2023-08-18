import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceSearchScreenController extends GetxController{
  List<String> books = ['In Search of Lost Time','Ramayan','Mahabharat','Sruti and Smriti','Abhang','Gita Govinda','Lilavati','Yajur Veda',];
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
  }

  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
  }

  void stopListening() async {
    await speechToText.stop();
  }

  void onSpeechResult(SpeechRecognitionResult result) {
      lastWords.value = result.recognizedWords;
  }

  void searchInList(String searchData){
    searchController.addListener(() {
      lastWords.value = searchController.text;
      if(searchController.text.isNotEmpty){
        matchData.value = books.where((element) => element.toLowerCase().contains(searchData)).toList();
      }else{
        matchData.clear();
      }
     });
  }
}