import 'package:flutter/material.dart';
import 'package:flutter_project/screen/tabbar/appbar_using_controller.dart';
import 'package:flutter_project/screen/tabbar/basic_appbar_tabbar_screen.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const BasicAppbarTabbarScreen(),
                  ),
                );
              },
              child: const Text(
                'Basic Appbar TabBar Screen',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AppbarUsingController(),
                  ),
                );
              },
              child: const Text(
                'Appbar Using Controller',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
