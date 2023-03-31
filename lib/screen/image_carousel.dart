import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  Timer? timer;

  PageController controller = PageController(initialPage: 0);
  @override
  void initState() {
    // TODO:타이머 실행
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      // int currentPage = controller.page!.toInt();
      // int nextPage = currentPage + 1;
      // if (nextPage > 4) {
      //   nextPage = 0;
      // }

      // controller.animateToPage(
      //   nextPage,
      //   duration: const Duration(milliseconds: 400),
      //   curve: Curves.linear,
      // );
      int currentPage = controller.page!.toInt();
      // 첫페이지 돌아오는 거
      int nextPage = (currentPage + 1) % 5;

      controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    // 메모리 안전
    controller.dispose();
    if (timer != null) {
      timer!.cancel();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [1, 2, 3, 4, 5]
            .map((e) => Image.asset(
                  'asset/image/image_$e.jpg',
                  fit: BoxFit.cover,
                ))
            .toList(),
      ),
    );
  }
}
