import 'package:flutter/material.dart';
import 'package:netflix/screens/new&hotpage/view/widgets/first_tab.dart';
import 'package:netflix/screens/new&hotpage/view/widgets/fourth_tab.dart';
import 'package:netflix/screens/new&hotpage/view/widgets/new&hot_appbar.dart';
import 'package:netflix/screens/new&hotpage/view/widgets/second_tab.dart';
import 'package:netflix/screens/new&hotpage/view/widgets/third_tab.dart';
import 'package:netflix/service/funtions.dart';

class NewHotpage extends StatelessWidget {
  const NewHotpage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: appbarWidget(
            title: "New & Hot",
            context: context,
            notification: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                child: TabBar(
                  splashFactory: NoSplash.splashFactory,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 6),
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.white.withOpacity(.7),
                  isScrollable: true,
                  tabs: [
                    customTab(text: '🍿 Coming Soon'),
                    customTab(text: '🔥 Everyone\'s watching'),
                    customTab(text: '🔟 Top 10 Tv Shows'),
                    customTab(text: '🔟 Top 10 Movies')
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              FirstTabpage(future: upcoming()),
              SecondTabpage(future: getnowplaying()),
              ThirdTabpage(future: TvDramas()),
              FourthTabpage(future: topRatedMovies())
            ],
          ),
        ),
      ),
    );
  }

  Padding customTab({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Tab(text: text),
    );
  }
}
