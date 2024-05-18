import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/screens/downloadpage/view/imagecard.dart';
import 'package:netflix/screens/new&hotpage/view/widgets/new&hot_appbar.dart';

class Downloadpage extends StatelessWidget {
  const Downloadpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbarWidget(title: "Downloads", context: context),
      body: Container(
        height: size.height,
        width: double.maxFinite,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Smart Downloads",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: size.height / 25,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Turn on Downloads for You",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
                ),
              ),
              SizedBox(
                height: size.height / 41,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  "We'll download movies and shows just for you, so you'll always have something to watch",
                  style: TextStyle(
                      fontSize: 15, wordSpacing: 2, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 68, 68, 68),
                          radius: size.width * .33,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 33,
                      top: 62,
                      child: DownloadCard(
                        angle: pi / 16,
                        imagepath:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqiBu7vjmwrGmXbOnrFxDgmmlYwh4OUomm9FnF0i8lvBuUyD3yWEd_38mV7nM_XQIktU8&usqp=CAU',
                        height: size.height * .20,
                        width: size.width * .30,
                        margin: EdgeInsets.only(left: 150),
                      ),
                    ),
                    Positioned(
                      // right: 35,
                      left: 33,
                      top: 62,

                      child: DownloadCard(
                        angle: pi / -16,
                        imagepath:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKoHgb3BtJjDQQjxwNVTM6Lfbe2f9iIA4_mQ&s',
                        height: size.height * .20,
                        width: size.width * .30,
                        margin: EdgeInsets.only(right: 150),
                      ),
                    ),
                    Positioned(
                      left: 117,
                      top: 45,
                      child: DownloadCard(
                        angle: 0,
                        imagepath:
                            'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p16721608_p_v10_ab.jpg',
                        height: size.width * .50,
                        width: size.width * .35,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.maxFinite,
                  height: size.height / 15,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                      child: Text(
                    "Set Up",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
                ),
              ),
              SizedBox(
                height: size.height / 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 35, 35),
                    borderRadius: BorderRadius.circular(8)),
                height: size.height / 25,
                width: size.width / 2,
                child: const Center(
                  child: Text(
                    'Find More to Download',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
