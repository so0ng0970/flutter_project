import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false, - 디버그 없애기 
      home: Scaffold(
        backgroundColor: const Color(0xFF4a5449),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/logo.png',
            ),
            const CircularProgressIndicator(
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
