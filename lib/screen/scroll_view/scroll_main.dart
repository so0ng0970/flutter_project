import 'package:flutter/material.dart';
import 'package:flutter_project/layout/scroll_layout.dart';

class ScrollMainScreen extends StatelessWidget {
  const ScrollMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'DD',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
