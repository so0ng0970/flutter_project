import 'package:flutter/material.dart';
import 'package:flutter_project/layout/main_layout.dart';
import 'package:flutter_project/screen/navigation/route_three_screen.dart';

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
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed('/three', arguments: 'arguments : ${999}');
          },
          child: const Text('push named'),
        ),
        ElevatedButton(
          onPressed: () {
            //   Navigator.of(context).pushReplacement()는 전에 페이지를 지워버린다. 3에서  ..pop() 쓰면 1로 이동
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const RouteThreeScreen(),
              ),
            );
          },
          child: const Text(
            'pushReplacement three',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/three',
                // 특정 라우터만 삭제 안할수 있음
                (route) => route.settings.name == '/');
          },
          child: const Text('pushAndRemoveUntil three'),
        )
      ],
    );
  }
}
