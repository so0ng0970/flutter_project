import 'package:flutter/material.dart';
import 'package:flutter_project/layout/main_layout.dart';
import 'package:flutter_project/screen/navigation/route_one_screen.dart';

class Navigatescreen extends StatelessWidget {
  const Navigatescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'Home Screen', children: [
      ElevatedButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return const RouteOneScreen(
                number: 123,
              );
            }),
          );
          print(result);
        },
        child: const Text('push'),
      )
    ]);
  }
}
