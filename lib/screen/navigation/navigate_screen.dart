import 'package:flutter/material.dart';
import 'package:flutter_project/screen/navigation/route_one_screen.dart';

class Navigatescreen extends StatelessWidget {
  const Navigatescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const RouteOneScreen();
                  }),
                );
              },
              child: const Text('push'),
            )
          ],
        ),
      ),
    );
  }
}
