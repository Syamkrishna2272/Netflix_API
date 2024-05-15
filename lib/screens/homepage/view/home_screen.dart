import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/screens/homepage/view/widgets/home_main_card.dart';
import 'package:netflix/screens/homepage/view/widgets/homeappbar.dart';
import 'package:netflix/screens/homepage/view/widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
              // MovieWidet(),
              HomeAppbar(
                  colorNotifier: colorNotifier,
                  safeAreaHeight: safeAreaHeight,
                  tabBarNotifier: tabBarNotifier),
              HomeMainCard(size: size),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Trending Now",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              MovieWidget(
                text: 'Trending Now',
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Trending Now",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              MovieWidget(
                text: 'Trending Now',
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Trending Now",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              MovieWidget(
                text: 'Trending Now',
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Trending Now",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              MovieWidget(
                text: 'Trending Now',
              )
            ],
          )
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
