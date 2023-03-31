import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('버튼'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.cyan;
                    }
                    return Colors.amber;
                  },
                ),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.white;
                    }
                    return Colors.red;
                  },
                ),
                padding: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const EdgeInsets.all(100.0);
                    }
                    return const EdgeInsets.all(20.0);
                  },
                ),
              ),
              child: const Text('buttonStyle'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  // 글자 및 애니메이션 효과
                  foregroundColor: Colors.black,
                  // 배경색
                  backgroundColor: Colors.red,
                  // 그림자색
                  shadowColor: Colors.green,
                  // 3d 입체감의 높이
                  elevation: 10.0,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  padding: const EdgeInsets.all(15.0),
                  // 테두리
                  side: const BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  )),
              child: const Text(
                'elevatedButton',
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.amber,
                backgroundColor: Colors.green,
              ),
              child: const Text('outlinedButton'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.pink,
                backgroundColor: Colors.blue,
              ),
              child: const Text('textButton'),
            ),
          ],
        ),
      ),
    );
  }
}
