import 'package:flutter/material.dart';
import 'package:islamicapp/screens/splash-screen.dart';
// import 'package:islamicapp/screens/home_screen.dart';
import 'package:islamicapp/screens/juzz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // 👇 ROUTE SYSTEM ENABLED HERE
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        JuzScreen.id: (context) {
          final juzNumber = ModalRoute.of(context)!.settings.arguments as int;
          return JuzScreen(juzNumber: juzNumber);
        },
        // You can add more named routes here later
      },
    );
  }
}
