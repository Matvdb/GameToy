import 'package:flutter/material.dart';
import 'package:flutter_application_1/taquinGeneration.dart';
import 'package:flutter_application_1/image.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  void iniState() {
    super.initState();
    numbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      child: Column(
        children: <Widget>[
          _headerText(),
          MonTitre(size),
          Grid(numbers, size, clickGrid),
        ],
      ),
    ));
  }

  void clickGrid(index) {
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 9 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0 ||
            (index + 4 < 9 && numbers[index + 4] == 0))) {
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
      });
    }
  }

  Widget _headerText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Taquin",
          style: TextStyle(fontSize: 30.0),
        ),
        Text("Le principe est d'aligner les nombres dans l'ordre"),
        Text("Y arriveras-tu ?")
      ],
    );
  }
}

class MonTitre extends StatelessWidget {
  var size;
  MonTitre(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      padding: EdgeInsets.all(5.0),
      child: Text("test",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          )),
    );
  }
}
