import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/service/api_service.dart';

class FirstTabpage extends StatelessWidget {
 const FirstTabpage({super.key, required this.future});

 final Future future;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Colors.transparent);
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text('Somthing went wrong'),
            );
          }
          final data = snapshot.data ?? [];
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (ctx, index) {
                final values = data[index];
                String imagePath = values.coverImage;
                String imageUrl = '$baseUrl$imagePath';
                final date = DateTime.parse(values.releaseDate);
                final month = DateFormat('MMM').format(date);
                final fullMonth = DateFormat('MMMM').format(date);
                final day = date.day;
                return Container(
                  color: Colors.black,
                  height: size.height / 1.9,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    month,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  day.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 5, top: 5, bottom: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),
                              height: size.height / 3.7,
                              width: (size.width / 1.2),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          values.title,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 30, top: 15),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.notifications_none_sharp,
                                        size: 22,
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.info_outline_rounded,
                                          size: 22,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 44),
                            child: Text(
                              'Coming $fullMonth $day',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 44),
                        child: Text(
                          values.overview,
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 14,
                              height: 1.3,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
