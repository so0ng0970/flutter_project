import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TestWidget(label: 'test1'),
            const TestWidget(label: 'test2'),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('build'))
          ],
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  final String label;
  const TestWidget({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    print('$label build 실행');
    return Container(
      child: Text(
        label,
      ),
    );
  }
}
