import 'package:flutter/material.dart';
import 'package:flutter_project/layout/scroll_layout.dart';
import 'package:flutter_project/screen/scroll_view/single_child_scroll_view.dart';

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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SingleChildScrollViewScreen(),
                  ),
                );
              },
              child: const Text(
                'SingleChildScrollViewScreen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
