import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieWidget extends StatelessWidget {
  MovieWidget({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 110,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage('https://static.toiimg.com/photo/105285086.cms')),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Item $index',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
