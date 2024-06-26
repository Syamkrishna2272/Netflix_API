import 'package:flutter/material.dart';
import 'package:netflix/screens/homepage/view/widgets/home_appbar_button.dart';
import 'package:netflix/screens/searchpage/search.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar(
      {super.key,
      required this.colorNotifier,
      required this.safeAreaHeight,
      required this.tabBarNotifier});

  final ValueNotifier<bool> colorNotifier;
  final double safeAreaHeight;
  final ValueNotifier<bool> tabBarNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: colorNotifier,
      builder: (context, isTransperant, child) {
        return SizedBox(
          height: 160,
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: isTransperant
                    ? Colors.black.withOpacity(.5)
                    : Colors.transparent,
                height: 65 + safeAreaHeight,
                child: Column(
                  children: [
                    Container(
                      height: safeAreaHeight,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 70,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/227_Netflix_logo-512.png'),
                                  fit: BoxFit.contain)),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 26,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SearchPage()));
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('lib/assets/profile.png')),
                            borderRadius: BorderRadius.circular(4),
                            // color: Colors.greenAccent,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: tabBarNotifier,
                  builder: (context, value, child) {
                    return AnimatedContainer(
                      curve: Curves.easeInCubic,
                      duration: const Duration(milliseconds: 300),
                      height: value ? 50 : 0,
                      width: double.maxFinite,
                      color: isTransperant
                          ? Colors.black.withOpacity(.5)
                          : Colors.transparent,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CustomOutlinebutton(label: "TV shows"),
                          SizedBox(
                            width: 10,
                          ),
                          CustomOutlinebutton(label: "Movies"),
                          SizedBox(
                            width: 10,
                          ),
                          CustomOutlinebutton(label: "Catagories"),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        );
      },
    );
  }
}
