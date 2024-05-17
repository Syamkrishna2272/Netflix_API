import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeMainCard extends StatelessWidget {
  HomeMainCard({super.key, required this.size});
  Size size;

  @override
  Widget build(BuildContext context) {
    // final paletecolor=palate?.colors.first;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 2.0],
            tileMode: TileMode.clamp,
          ),
        ),
        width: double.infinity,
        height: size.height * 0.60,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://m.media-amazon.com/images/I/81y0foYjoFL._AC_UF1000,1000_QL80_.jpg'),
                  fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0, 2),
                    blurRadius: 10,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(150, 255, 255, 255),
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                      child: Text(
                        'Play',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(150, 255, 255, 255),
                        borderRadius: BorderRadius.circular(25)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.black,
                        ),
                        Text(
                          ' My List',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
