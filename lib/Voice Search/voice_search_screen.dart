import 'package:demo_search_application/Voice%20Search/voice_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoiceSearchScreen extends StatelessWidget {
  const VoiceSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final voiceSearchScreenController = Get.put(VoiceSearchScreenController());
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.cyan,
        appBar: AppBar(title: Text('Voice Search'),backgroundColor: Colors.amber,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                onFieldSubmitted: (value) => voiceSearchScreenController.searchInList(value),
                onChanged: (value) => voiceSearchScreenController.searchInList(value),
                controller: voiceSearchScreenController.searchController,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: (){
                    voiceSearchScreenController.startListening();
                  },
                  child: Icon(Icons.mic),
                )
              ),),
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