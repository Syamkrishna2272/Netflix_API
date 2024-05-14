import 'package:flutter/material.dart';
import 'package:netflix/screens/homepage/view/widgets/home_appbar_button.dart';

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
                duration: Duration(milliseconds: 500),
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
                          height: 60,
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
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => SearchPage()));
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.greenAccent,
                          ),
                        ),
                        SizedBox(
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
                      duration: Duration(milliseconds: 300),
                      height: value ? 50 : 0,
                      width: double.maxFinite,
                      color: isTransperant
                          ? Colors.black.withOpacity(.5)
                          : Colors.transparent,
                      child: Row(
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
    // AppBar(
    //   leading: Container(
    //     height: 50,
    //     width: 60,
    //     decoration: const BoxDecoration(
    //         // color: Colors.amber,
    //         image: DecorationImage(
    //             image: NetworkImage(
    //                 'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/227_Netflix_logo-512.png'))),
    //   ),
    //   actions: [
    //     Row(
    //       children: [
    //         IconButton(onPressed: () {}, icon: Icon(Icons.search)),
    //         const SizedBox(
    //           width: 20,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Container(
    //             height: 35,
    //             width: 35,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(4),
    //               color: Colors.greenAccent,
    //             ),
    //           ),
    //         ),
    //       ],
    //     )
    //   ],
    // );
  }
}
