import 'package:flutter/material.dart';

class ImageListingScreen extends StatefulWidget {
  const ImageListingScreen({super.key});

  @override
  State<ImageListingScreen> createState() => _ImageListingScreenState();
}

class _ImageListingScreenState extends State<ImageListingScreen> {

  List imageList = ['https://5.imimg.com/data5/AK/RA/MY-68428614/apple.jpg','https://picsum.photos/250?image=9','https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_640.jpg','https://img.freepik.com/free-photo/blue-house-with-blue-roof-sky-background_1340-25953.jpg','https://m.media-amazon.com/images/I/91oF9q-jE5L.jpg','https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_640.jpg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Images')),
      body: ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (ctx,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(imageList[index],height: 200,width: 200,),
        );
      }),
    );
  }
}