import 'package:flutter/material.dart';
import 'package:flutter_application_1/splashScreen.dart';
import 'package:flutter_application_1/taquinpage.dart';
import 'package:flutter_application_1/tictacto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/tictacto': (BuildContext context) =>
            const TicTacToePage(title: "Tic Tac To"),
        '/taquin': (BuildContext context) => const TaquinPage(title: 'Taquin'),
      },
    );
  }
}
