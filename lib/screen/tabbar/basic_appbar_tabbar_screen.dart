import 'package:flutter/material.dart';
import 'package:flutter_project/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BasicAppbarTabbarScreen'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  indicatorColor: Colors.amber,
                  indicatorWeight: 4.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.grey[800],
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  tabs: TABS
                      .map((e) => Tab(
                            icon: Icon(e.icon),
                            child: Text(e.label),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          // 스크롤 불가
          // physics: const NeverScrollableScrollPhysics(),
          children: TABS
              .map(
                (e) => Center(
                  child: Icon(
                    e.icon,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
