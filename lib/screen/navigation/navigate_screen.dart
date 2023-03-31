import 'package:flutter/material.dart';
import 'package:flutter_project/layout/main_layout.dart';
import 'package:flutter_project/screen/navigation/route_one_screen.dart';

class Navigatescreen extends StatelessWidget {
  const Navigatescreen({super.key});

  @override
  Widget build(BuildContext context) {
    // WillPopScope - 스택에 더이상 뒤로갈 페이지가 없으면 안드로이드 자체에 있는 뒤로가기를 막거나 허용할때 쓴다
    return WillPopScope(
      onWillPop: () async {
        // true - pop 가능
        // false - pop 불가능
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayout(title: 'Home Screen', children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          onPressed: () {
            print(Navigator.of(context).canPop());
          },
          child: const Text('can pop'),
        ),

        // Navigator.of(context).maybePop(); - 스택에 더이상 뒤로갈 페이지가 없으면 뒤로가기 안됨
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          child: const Text('Maybe Pop'),
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
      ]),
    );
  }
}
