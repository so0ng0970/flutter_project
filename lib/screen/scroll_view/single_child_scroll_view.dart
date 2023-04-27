import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_project/layout/scroll_layout.dart';
import 'package:flutter_project/screen/scroll_view/scroll_main.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  const SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
        title: 'SingleChildScrollView',
        body: Container(
          child: const Text('HELLO'),
        ));
  }
}
