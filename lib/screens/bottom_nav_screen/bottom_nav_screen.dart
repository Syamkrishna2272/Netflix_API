import 'package:flutter/material.dart';
import 'package:netflix/screens/homepage/view/home_screen.dart';
import 'package:netflix/screens/new&hotpage/view/new&hot_screen.dart';
import 'package:netflix/screens/downloadpage/view/download.dart';


class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentindex = 0;

  final List<Widget> pages = [HomeScreen(), NewHotpage(), Downloadpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library_outlined), label: "New & Hot"),
            BottomNavigationBarItem(
                icon: Icon(Icons.download_for_offline), label: "Downloads"),
          ]),
    );
  }
}
