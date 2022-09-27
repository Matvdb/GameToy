import 'dart:async';
import 'package:flutter_application_1/homeScreen.dart';
import 'package:flutter_application_1/image.dart';

import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 223, 2, 252),
            Color.fromARGB(255, 179, 176, 0),
          ],
        )),
        child: Column(
          children: const [
            Padding(padding: EdgeInsets.all(60)),
            SizedBox(height: 400, width: 450, child: Manette()),
            SizedBox(height: 300, width: 300, child: Loader()),
          ],
        ));
  }
}
