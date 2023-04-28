import 'package:flutter/material.dart';
import 'package:flutter_project/const/colors.dart';
import 'package:flutter_project/layout/scroll_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: 'SingleChildScrollView',
      // 한번에 다 렌더링 되어서 최적화에 좋지 않다. - 가벼운 것만 쓰는게 나음 
      body: SingleChildScrollView(
        child: Column(
          children: numbers
              .map(
                (e) => renderContainer(
                  color: rainbowColors[e % rainbowColors.length],
                  index: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  // 1
  // 기본 렌더링법
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors.map((e) => renderContainer(color: e)).toList(),
      ),
    );
  }

  // 2
  // 화면을 넘어가지 않아도 스크롤 되기하기
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      // neverScrollableScrollPhysics - 스크롤 안됨
      // 화면을 안 벗어나도 스크롤 하게 할 수 있다.
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(children: [
        renderContainer(color: Colors.red),
        renderContainer(color: Colors.yellow),
      ]),
    );
  }

  // 3
  // 위젯이 잘리지 않게 하기
  Widget renderClip() {
    return ScrollLayout(
      title: 'SingleChildScrollView',
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(children: [
          renderContainer(color: Colors.red),
        ]),
      ),
    );
  }

  // 4
  // 여러가지 physics 정리
  Widget renderPhysics() {
    return SingleChildScrollView(
      // AlwaysScrollableScrollPhysics() - 스크롤 됨
      // neverScrollableScrollPhysics - 스크롤 안됨
      // BouncingScrollPhysics() - ios 스타일
      // ClampingScrollPhysics() - android 스타일
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: rainbowColors.map((e) => renderContainer(color: e)).toList(),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if (index != null) {
      print(index);
    }
    return Container(
      height: 300,
      color: color,
    );
  }
}
