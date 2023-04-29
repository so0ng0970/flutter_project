import 'package:flutter/material.dart';
import 'package:flutter_project/const/colors.dart';
import 'package:flutter_project/layout/scroll_layout.dart';

class ReorderableListScreen extends StatefulWidget {
  const ReorderableListScreen({super.key});

  @override
  State<ReorderableListScreen> createState() => _ReorderableListScreenState();
}

class _ReorderableListScreenState extends State<ReorderableListScreen> {
  List<int> numbers = List.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: 'ReorderableListViewScreen',
      body: renderBuilder(),
    );
  }

  // 1
  // ReorderableListView()
  // 순서 바꿀 수 있음, 퍼포먼스는 안좋음
  Widget renderDefault() {
    return ReorderableListView(
      // 순서가 바뀌면 실행된다
      onReorder: (int oldIndex, int newIndex) {
        setState(
          () {
            // oldIndex , newIndex 모두 옮기기 전에 산정한다.
            //
            // [red, orange, yellow]
            // [0, 1, 2]
            // red를 yellow 다음으로 옮기고 싶다.
            // red : 0 (oldIndex)-> 3 (newIndex)
            // [orange, yellow, red]
            //
            // [red, orange, yellow]
            // yellow를 red 전으로 옮기고 싶다.
            // yellow :  2(oldIndex)-> 0(newIndex)
            // [yellow, red, orange]
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = numbers.removeAt(oldIndex);
            numbers.insert(newIndex, item);
          },
        );
      },
      children: numbers
          .map((e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length], index: e))
          .toList(),
    );
  }

  // 2
  // ReorderableListView.builder()
  Widget renderBuilder() {
    return ReorderableListView.builder(
      itemBuilder: (context, index) {
        // index만 넣으면 index 값으로 변경되어서 전이랑 똑같음
        return renderContainer(
          color: rainbowColors[numbers[index] % rainbowColors.length],
          index: numbers[index],
        );
      },
      itemCount: numbers.length,
      onReorder: (int oldIndex, int newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = numbers.removeAt(oldIndex);
        numbers.insert(newIndex, item);
      },
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
      // 시스템이 볼땐 똑같은 컨네이너여서 key값을 넣어서 구별시켜야한다.
      key: Key(index.toString()),
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
