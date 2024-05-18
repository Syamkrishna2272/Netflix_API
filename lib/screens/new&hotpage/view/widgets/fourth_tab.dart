import 'package:flutter/material.dart';

class FourthTabpage extends StatelessWidget {
  FourthTabpage({super.key});

  // Future future;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: size.height / 2.3,
            width: double.maxFinite,
            color: Colors.black,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://mymodernmet.com/wp/wp-content/uploads/2021/04/Nature-Sounds-For-Well-Being-03.jpg'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10)),
                    height: size.height / 4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: SizedBox(
                        width: size.width / 2.5,
                        height: 50,
                        child: Text(
                          "values.title",
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share,
                                      size: 22,
                                    )),
                              ],
                            ),
                            Text(
                              "Share",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                        size: 28,
                                      )),
                                ],
                              ),
                              Text(
                                "Add",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        size: 28,
                                      )),
                                ],
                              ),
                              Text(
                                "Info",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "values.overview,",
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
  }
}
