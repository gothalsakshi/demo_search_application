import 'package:demo_search_application/Voice%20Search/voice_screen.dart';
import 'package:demo_search_application/Voice%20Search/voice_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoiceSearchScreen extends StatefulWidget {
  const VoiceSearchScreen({super.key});

  @override
  State<VoiceSearchScreen> createState() => _VoiceSearchScreenState();
}

class _VoiceSearchScreenState extends State<VoiceSearchScreen> {
  final voiceSearchScreenController = Get.put(VoiceSearchScreenController());

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.cyan,
        appBar: AppBar(title: Text('Voice Search'),backgroundColor: Colors.amber,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => TextFormField(
                onSaved: (value)=> voiceSearchScreenController.searchInList(value!),
                onFieldSubmitted: (value) => voiceSearchScreenController.searchInList(value),
                onChanged: (value) => voiceSearchScreenController.searchInList(value),
                controller: voiceSearchScreenController.searchController,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: (){
                    Get.to(RecognizedVoiceScreen());
                    // voiceSearchScreenController.matchData.clear();
                    // voiceSearchScreenController.speechEnabled.value = ! voiceSearchScreenController.speechEnabled.value;
                    // if(voiceSearchScreenController.speechEnabled.value){
                    //   voiceSearchScreenController.startListening();
                    // }else{
                    //   voiceSearchScreenController.searchController.clear();
                    //   voiceSearchScreenController.stopListening();
                    // }
                  },
                  child: voiceSearchScreenController.speechEnabled.value ? Icon(Icons.mic) : Icon(Icons.mic_off),
                )
              ))),
              Text('Search text ${voiceSearchScreenController.searchController.text}'),
              Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: 
                voiceSearchScreenController.matchData.isNotEmpty ? voiceSearchScreenController.matchData.length : 
                voiceSearchScreenController.books.length,
                itemBuilder: (ctx,index){
                return ListTile(title: Text(
                  voiceSearchScreenController.matchData.isNotEmpty ? voiceSearchScreenController.matchData[index] :
                  voiceSearchScreenController.books[index]));
              }))
            ],
          ),
        ),
      ),
    );
  }
}