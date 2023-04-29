import 'package:flutter/material.dart';
import 'package:flutter_project/const/colors.dart';
import 'package:flutter_project/layout/scroll_layout.dart';

class GridViewScreen extends StatelessWidget {
  List<int> numbers = List.generate(100, (index) => index);
  GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: 'GridViewScreen',
      body: renderMaxExtent(),
    );
  }

  // 1
  // GridView.count - 한번에 데이터를 다 불러옴
  Widget renderCount() {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      children: numbers
          .map(
            (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e),
          )
          .toList(),
    );
  }

  // 2
  // 보이는 것만 그림
  Widget renderBuilderCrossAxisCount() {
    return GridView.builder(
      //
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 3,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
    );
  }

  // 3
  // 최대 사이즈
  Widget renderMaxExtent() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
      // 갯수
      itemCount: 100,
    );
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
}
