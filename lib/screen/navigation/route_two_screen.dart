import 'package:flutter/material.dart';
import 'package:flutter_project/layout/main_layout.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: ' Route Two',
      children: [
        Text(
          argument.toString(),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'pop',
          ),
        ),
      ],
    );
  }
}
