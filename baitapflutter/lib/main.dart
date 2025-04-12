import 'package:baitapflutter/layout1.dart';
import 'package:baitapflutter/layout2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.grey[100], //BackgroundColor của layout 1
        // backgroundColor: const Color.fromARGB(255, 47, 54, 70), //BackgroundColor của layout 2
        body: SafeArea(
          child: HomeLayout()
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

