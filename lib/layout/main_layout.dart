import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const MainLayout({required this.title, required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'Home Screen', children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children),
    ]);
  }
}
