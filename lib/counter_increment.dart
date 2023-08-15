import 'package:flutter/material.dart';

class CounterIncrement extends StatefulWidget {
  const CounterIncrement({super.key});

  @override
  State<CounterIncrement> createState() => _CounterIncrementState();
}

class _CounterIncrementState extends State<CounterIncrement> {
  int counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          counter++;
        });
      }),
      body: Center(
        child: Text('$counter'),
      ),
    );
  }
}