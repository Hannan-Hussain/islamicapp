import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamicapp/screens/home-screen.dart';

class Introductionscreen extends StatefulWidget {
  const Introductionscreen({super.key});

  @override
  State<Introductionscreen> createState() => _IntroductionscreenState();
}

class _IntroductionscreenState extends State<Introductionscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Read Quran",
              bodyWidget: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Customize your reading view , read in multiple languages, Listen different audios',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              image: Center(
                child: Image.asset(
                  "assets/quran.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            PageViewModel(
              title: "Prayer Alerts",
              bodyWidget: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Choose your Adan, which prayer to be notified of, and how often',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              image: Center(
                child: Image.asset(
                  "assets/prayer.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            PageViewModel(
              title: "Build Better Habits",
              bodyWidget: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Make Islamic practices a part of your daily life in a way that best suits you',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              image: Center(
                child: Image.asset(
                  "assets/zakat.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
          onDone: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Homescreen()),
              (route) => false,
            );
          },
          showNextButton: true,
          next: const Icon(Icons.arrow_forward),
          done: const Text(
            "Done",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Colors.black26,
            activeColor: Colors.green,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
