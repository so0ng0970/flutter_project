import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://soonger.tistory.com');

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('soonger'),
          backgroundColor: Colors.orange,
          actions: [
            IconButton(
              onPressed: () {
                controller
                    .loadRequest(homeUrl );
              },
              icon: const Icon(
                Icons.home,
              ),
            ),
          ],
        ),
        body: WebViewWidget(
          controller: controller,
        )

        // WebView(
        //   onWebViewCreated: (WebViewController controller) {
        //     this.controller = controller;
        //   },
        //   initialUrl: homeUrl,
        //   javascriptMode: JavascriptMode.unrestricted, // 자바스크립트 가능해짐 동영상
        // ),
        );
  }
}
