import 'package:flutter/material.dart';
import 'package:flutter_project/layout/main_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(title: 'Route Three ', children: [
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
        child: const Text('pop'),
      ),
    ]);
  }
}
