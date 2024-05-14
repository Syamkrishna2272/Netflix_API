import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/screens/homepage/view/widgets/homeappbar.dart';

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
          HomeAppbar(
              colorNotifier: colorNotifier,
              safeAreaHeight: safeAreaHeight,
              tabBarNotifier: tabBarNotifier)
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
