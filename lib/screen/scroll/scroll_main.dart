import 'package:flutter/material.dart';
import 'package:flutter_project/layout/scroll_layout.dart';
import 'package:flutter_project/screen/grid/grid_view_screen.dart';
import 'package:flutter_project/screen/scroll/list_view.dart';
import 'package:flutter_project/screen/scroll/single_child_scroll_view.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String name;
  ScreenModel({
    required this.builder,
    required this.name,
  });
}

class ScrollMainScreen extends StatelessWidget {
  final screens = [
    ScreenModel(
      builder: (_) => SingleChildScrollViewScreen(),
      name: 'SingleChildScrollViewScreen',
    ),
    ScreenModel(
      builder: (_) => ListViewScreen(),
      name: 'ListViewScreen',
    ),
    ScreenModel(
      builder: (_) => GridViewScreen(),
      name: 'GridViewScreen',
    ),
  ];
  ScrollMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: screens
                .map(
                  (screen) => ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: screen.builder,
                        ),
                      );
                    },
                    child: Text(screen.name),
                  ),
                )
                .toList()),
      ),
    );
  }
}
