import 'package:flutter/material.dart';
import 'package:flutter_project/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('CustomScrollViewScreen'),
          ),
          renderBuilderSliverList()
        ],
      ),
    );
  }

  // 1
  // ListView 기본 생성자와 유사
  SliverList renderChildSliverList() {
    return SliverList(
      // 기본형태 리스트뷰
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }

  // 2
  // ListView.builder 생성자와 유사
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        },
        // 갯수
        childCount: 100,
      ),
    );
  }

  Widget renderTest() {
    return Column(
      children: [
        // 이론상 ListView 무한한 높이 차지 할 수 있음
        // 그래서 Expanded 써서 column 안에서만 차지하라고 해야함
        Expanded(
          child: ListView(
            children: rainbowColors
                .map(
                  (e) => renderContainer(
                    color: e,
                    index: 1,
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: rainbowColors
                .map((e) => renderContainer(
                      color: e,
                      index: 1,
                    ))
                .toList(),
          ),
        ),
      ],
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
