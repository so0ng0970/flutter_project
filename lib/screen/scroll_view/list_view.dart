import 'package:flutter/material.dart';
import 'package:flutter_project/const/colors.dart';
import 'package:flutter_project/layout/scroll_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: 'ListView',
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: (context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        },
        // 사이에 원하는 빌더를 넣을 수 있음 , 배너와 광고 넣을때 좋음
        // 5개의 item 마다 광고 넣어주기
        separatorBuilder: (context, index) {
          index += 1;
          if (index % 5 == 0) {
            return renderContainer(
                color: Colors.black, index: index, height: 100);
          } else {
            return const SizedBox(
              height: 50,
            );
          }
        },
      ),
    );
  }

  // 1 - renderDefault()
  Widget renderDefault() {
    return ListView(
      children: numbers
          .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ))
          .toList(),
    );
  }

  // 2 - renderBuilder
  Widget renderBuilder() {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        });
  }

  // 3 separateBuider
  Widget renderSeparated() {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
      // 사이에 원하는 빌더를 넣을 수 있음 , 배너와 광고 넣을때 좋음
      // 5개의 item 마다 광고 넣어주기
      separatorBuilder: (context, index) {
        index += 1;
        if (index % 5 == 0) {
          return renderContainer(
              color: Colors.black, index: index, height: 100);
        } else {
          return Container();
        }
      },
    );
  }
}

Widget renderContainer({
  required Color color,
  required int index,
  double? height,
}) {
  print(index);
  return Container(
    height: height ?? 300, // 만약에 null 이면 300 넣음
    color: color,
    child: Center(
      child: Text(
        index.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    ),
  );
}
