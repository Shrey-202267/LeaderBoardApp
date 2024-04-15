// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:twjapp/pages/custom_drawer.dart';
import 'package:twjapp/pages/first_page.dart';
import 'package:twjapp/pages/home_page.dart';
import 'package:twjapp/pages/spinner_page.dart';
import 'package:twjapp/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/drawer': (context) => const CustomDrawer(),
        '/spinner': (context) => const SpinnerPage()
      },
    );
  }
}
