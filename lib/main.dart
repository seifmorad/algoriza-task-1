import 'package:flutter/material.dart';
import '../OnBoardingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Algoriza Task 1',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: const OnBoardingView(),
    );
  }
}
