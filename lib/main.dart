// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:leaderboard/pages/custom_drawer.dart';
import 'package:leaderboard/pages/first_page.dart';
import 'package:leaderboard/pages/spinner_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/drawer': (context) => const CustomDrawer(),
        '/spinner': (context) => const SpinnerPage()
      },
    );
  }
}
