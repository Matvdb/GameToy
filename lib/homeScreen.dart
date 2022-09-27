import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: Manette(),
            ),
            Text("GameToy",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 30.0,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: 1000,
        width: 1080,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Bienvenu dans ",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  "GameToy",
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tictacto');
                  },
                  child: Container(
                      height: 50,
                      width: 200,
                      color: Colors.purple,
                      child: Row(
                        children: const [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Morpion(),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Text("Jeu du Tic Tac Toe")
                        ],
                      )),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/taquin');
                    },
                    child: Container(
                        height: 50,
                        width: 200,
                        color: Colors.purple,
                        child: Row(
                          children: const [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Taquin(),
                            ),
                            Padding(padding: EdgeInsets.all(13)),
                            Text("Jeu du Taquin")
                          ],
                        ))),
              ],
            ),
            const Padding(padding: EdgeInsets.all(60)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Application crée en "),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: FlutterLogo(),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
