import 'package:flutter/material.dart';

class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({super.key});

  @override
  State<StreamBuilderScreen> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
      // future랑 마찬가지로 캐싱이 된다
      // future은 dispose를 할 필요가 없지만  StreamBuilder은 닫는거 까지 알아서 해결을 해준다.
      body: StreamBuilder<int>(
        stream: streamNumbers(),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'StreamBuilder',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Constate : ${snapshot.connectionState}', //active 상태에서 빌드를 할 수있음
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Data: ${snapshot.data}',
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Error: ${snapshot.error}',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text(
                    'setState',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      // if (i == 5) {
      //   throw Exception('i = 5');
      // }

      await Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
      yield i;
    }
  }
}
