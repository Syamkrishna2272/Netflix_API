import 'package:flutter/material.dart';

class FirstpageAppbar extends StatelessWidget {
  const FirstpageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 60,
          decoration: const BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/227_Netflix_logo-512.png'))),
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 26,
            )),
        const SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.greenAccent,
            ),
          ),
        ),
      ],
    );
  }
}
