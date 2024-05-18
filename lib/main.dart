import 'package:flutter/material.dart';
import 'package:netflix/screens/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:netflix/service/funtions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getnowplaying();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BottomNavScreen(),
    );
  }
}
