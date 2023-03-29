import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            number++;
          });
        },
        child: Center(
          child: Container(
            color: Colors.blue,
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                number.toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
