import 'package:demo_search_application/app/home_screen.dart';
import 'package:demo_search_application/counter_increment.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CounterDecrement extends StatefulWidget {
  const CounterDecrement({super.key});

  @override
  State<CounterDecrement> createState() => _CounterDecrementState();
}

class _CounterDecrementState extends State<CounterDecrement> {
  int counter = 100;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          counter--;
        });
      }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$counter'),
            ElevatedButton(onPressed: (){
              context.go('/incrementCounter');
            }, child: const Text('Go to Next Screen'))
          ],
        ),
      ),
    );
  }
}