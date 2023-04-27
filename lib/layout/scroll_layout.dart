import 'package:flutter/material.dart';

class ScrollLayout extends StatelessWidget {
  final String title;
  final Widget body;
  const ScrollLayout({required this.title, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
