import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:islamicapp/screens/Audio-screen.dart';
import 'package:islamicapp/screens/Home-01-screen.dart';
import 'package:islamicapp/screens/prayer-screen.dart';
import 'package:islamicapp/screens/quran-screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectIndex = 0;

  List<Widget> widgetList = [
    Home01screen(),
    Quranscreen(),
    Audioscreen(),
    Prayerscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widgetList[selectIndex],

        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.purple,
          initialActiveIndex: selectIndex, 
          onTap: updateindex, 
          items: const [
            TabItem(
              icon: ImageIcon(AssetImage("assets/home.png")),
              title: 'Home',
            ),
            TabItem(
              icon: ImageIcon(AssetImage("assets/holyQuran.png")),
              title: 'Quran',
            ),
            TabItem(
              icon: ImageIcon(AssetImage("assets/audio.png")),
              title: 'Audio',
            ),
            TabItem(
              icon: ImageIcon(AssetImage("assets/mosque.png")),
              title: 'Prayer',
            ),
          ],
        ),
      ),
    );
  }

  void updateindex(int index) {
    setState(() {
      selectIndex = index;
    });
  }
}
