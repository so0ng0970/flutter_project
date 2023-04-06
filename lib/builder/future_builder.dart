import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuildScreen extends StatefulWidget {
  const FutureBuildScreen({super.key});

  @override
  State<FutureBuildScreen> createState() => _FutureBuildScreenState();
}

class _FutureBuildScreenState extends State<FutureBuildScreen> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
      // FutureBuilder 캐싱, 기존의 데이터를 기억을 한다. 잘 활용하면 고객들한테 로딩이 안 걸린거 처럼 속일 수 있음 
      body: FutureBuilder(
        future: getNumber(),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 한번도 데이터 요청을 안했을때 사용 ,
          // if (!snapshot.hasData) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }

          if(snapshot.hasData){
            // 데이터 있을때 위젯 렌더링 
          }
          if(snapshot.hasError){
            // 에러가 있을때 위젯 렌더링 
          }
          // 로딩중일때 위젯 렌더링 

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Future Build',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Constate : ${snapshot.connectionState}',
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

  Future<int> getNumber() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    final random = Random();

    // throw Exception('에러가 발생했습니다');

    return random.nextInt(100);
  }
}
