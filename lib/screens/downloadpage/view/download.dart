import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/screens/downloadpage/view/imagecard.dart';
import 'package:netflix/screens/new&hotpage/view/widgets/new&hot_appbar.dart';
import 'package:netflix/service/api_service.dart';
import 'package:netflix/service/funtions.dart';

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
              FutureBuilder(
                  future: getnowplaying(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                          color: Colors.transparent);
                    } else if (snapshot.hasError || !snapshot.hasData) {
                      return const Center(
                        child: Text('Somthing went wrong'),
                      );
                    }
                    final data = snapshot.data ?? [];
                    return Center(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: size.width * .33,
                              backgroundColor:
                                  const Color.fromARGB(255, 68, 68, 68),
                            ),
                          ),
                          Positioned(
                            right: 33,
                            top: 62,
                            child: DownloadCard(
                              angle: pi / 16,
                              imagepath: '$baseUrl${data[0].coverImage}',
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
                              imagepath: '$baseUrl${data[1].coverImage}',
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
                              imagepath: '$baseUrl${data[2].coverImage}',
                              height: size.width * .50,
                              width: size.width * .35,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Container(
                  width: 185,
                  height: size.height / 18,
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
