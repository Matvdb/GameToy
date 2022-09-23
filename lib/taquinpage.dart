import 'package:flutter/material.dart';
import 'package:flutter_application_1/taquin.dart';

class TaquinPage extends StatefulWidget {
  const TaquinPage({super.key, required this.title});
  final String title;

  @override
  State<TaquinPage> createState() => _TaquinState();
}

class _TaquinState extends State<TaquinPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Taquin')),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ElevatedButton(onPressed: null, child: Text('')),
                  ElevatedButton(onPressed: null, child: Text("")),
                  ElevatedButton(onPressed: null, child: Text("")),
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ElevatedButton(onPressed: null, child: Text("")),
                    ElevatedButton(onPressed: null, child: Text("")),
                    ElevatedButton(onPressed: null, child: Text("")),
                  ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ElevatedButton(onPressed: null, child: Text("")),
                  ElevatedButton(onPressed: null, child: Text("")),
                  ElevatedButton(onPressed: null, child: Text("")),
                ],
              ),
            ],
          ),
        ));
  }
}
