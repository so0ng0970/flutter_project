import 'package:flutter/material.dart';
import 'package:flutter_project/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          renderSliverAppBar(),
          renderChildSliverList(),
          renderSliverGridBuilder(),
        ],
      ),
    );
  }

  // Appbar
  SliverAppBar renderSliverAppBar() {
    return SliverAppBar(
      centerTitle: true,
      // floating - 위로 스크롤 하면 보임
      floating: true,
      // Pinned - 스크롤을 해도 고정되어있음
      pinned: false,
      // snap - 자석효과 , floating이 true 여야 한다.
      snap: true,
      // stretch - 맨 위에서 한계 이상으로 스크롤 했을 때 남는 공간을 차지
      // 안드로이드는 BouncingScrollPhysics() 상태일때 가능함
      stretch: true,
      expandedHeight: 200,
      collapsedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Image.asset(
          'asset/image/image_3.jpg',
          fit: BoxFit.cover,
        ),
        title: const Text(
          'hi :)',
        ),
      ),

      title: const Text('CustomScrollViewScreen'),
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

  // 3
  // GridView.count 유사함
  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e))
            .toList(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  // 4
  // GridView.Builder()와 비슷함
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 100,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
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
