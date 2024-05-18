import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/screens/homepage/view/widgets/home_main_card.dart';
import 'package:netflix/screens/homepage/view/widgets/homeappbar.dart';
import 'package:netflix/screens/homepage/view/widgets/movie_widget.dart';
import 'package:netflix/service/funtions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  final ValueNotifier<bool> tabBarNotifier = ValueNotifier(true);

  final ValueNotifier<bool> colorNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      _scrollListner();
    });
    final safeAreaHeight = MediaQuery.of(context).padding.top;
    final size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.black,
      height: size.height,
      width: double.maxFinite,
      child: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: EdgeInsets.zero,
            children: [
              HomeMainCard(size: size),

              MovieWidget(
                text: 'Trending Now',
                mQuerySize: size,
                future: getnowplaying(),
              ),

              MovieWidget(
                  text: 'New Releases',
                  mQuerySize: size,
                  future: newReleases()),

              MovieWidget(
                  text: 'Top 10 Movies',
                  mQuerySize: size,
                  future: topRatedMovies()),

              // Tvcard(
              //     size: size,
              //     text: 'Bingeworthy TV Dramas',
              //     future: TvDramas()),

              MovieWidget(
                  text: 'Up Coming Movies',
                  mQuerySize: size,
                  future: upcoming()),

              // MovieWidget(
              //     text: ' Top 10 Movies',
              //     mQuerySize: size,
              //     future: getnowplaying()),

              // MovieWidget(
              //     text: 'New Releases',
              //     mQuerySize: size,
              //     future: getnowplaying()),

              // MovieWidget(
              //     text: 'New Releases',
              //     mQuerySize: size,
              //     future: getnowplaying()),

              // MovieWidget(
              //     text: 'New Releases',
              //     mQuerySize: size,
              //     future: getnowplaying())
              // MovieWidget(
              //   text: 'New Releases',
              //   mQuerySize: size,
              // ),
              // MovieWidget(
              //   text: 'Top 10 Movies',
              //   mQuerySize: size,
              // ),
              // MovieWidget(
              //   text: 'Up Coming Movies',
              //   mQuerySize: size,
              // ),
              // MovieWidget(
              //   text: 'Airing Today',
              //   mQuerySize: size,
              // ),
            ],
          ),
          HomeAppbar(
              colorNotifier: colorNotifier,
              safeAreaHeight: safeAreaHeight,
              tabBarNotifier: tabBarNotifier),
        ],
      ),
    );
  }

  _scrollListner() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      tabBarNotifier.value = true;
    } else {
      tabBarNotifier.value = false;
    }
    if (scrollController.offset > 400) {
      colorNotifier.value = true;
    } else {
      colorNotifier.value = false;
    }
  }
}
