import 'package:flutter/material.dart';
import 'package:netflix/screens/firstpage/view/widgets/appbar.dart';
import 'package:netflix/screens/secondpage/view/sample.dart';
import 'package:netflix/screens/thirdpage/view/widgets/thirdsample.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentindex = 0;

  final List<Widget> pages = [FirstpageAppbar(), Sample(), ThirdSample()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      appBar: AppBar(),
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
