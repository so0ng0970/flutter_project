import 'package:flutter/material.dart';
import 'package:flutter_project/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BasicAppbarTabbarScreen'),
          bottom: TabBar(
            tabs: TABS
                .map((e) => Tab(
                      icon: Icon(e.icon),
                      child: Text(e.label),
                    ))
                .toList(),
          ),
        ),
        body: Column(),
      ),
    );
  }
}
