import 'package:flutter/material.dart';
import 'package:flutter_application_1/image.dart';

class TaquinPage extends StatefulWidget {
  const TaquinPage({super.key, required this.title});
  final String title;

  @override
  State<TaquinPage> createState() => _TaquinPageState();
}

class _TaquinPageState extends State<TaquinPage> {
  @override
  static const String Joueur1 = "";
  late String currentPlayer;
  late bool gameEnd;
  late List<String> occuper;

  @override
  void initState() {
    initialisationGame();
    super.initState();
  }

  void initialisationGame() {
    currentPlayer = Joueur1;
    gameEnd = false;
    occuper = ["8", "6", "4", "3", "5", "7", "2", "1", ""];
  }

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
            Text("Taquin",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 30.0,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: 950,
        width: 950,
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
          children: [
            const SizedBox(
              height: 150,
              width: 300,
              child: Taquin(),
            ),
            const Padding(padding: EdgeInsets.all(30)),
            _headerText(),
            _gameContainer(),
            _restartButton(),
          ],
        ),
      )),
    );
  }

  Widget _headerText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Taquin",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        Text("Le principe est d'aligner chaque nombres dans l'ordre"),
        Text(
          "Y arriveras-tu ?",
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _gameContainer() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.height / 2,
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: 9,
          itemBuilder: (context, int index) {
            return _box(index);
          }),
    );
  }

  Widget _box(int index) {
    return InkWell(
      onTap: () {
        if (index - 1 >= 0 && occuper[index - 1] == 0 && index % 4 != 0 ||
            index + 1 < 9 && occuper[index + 1] == 0 && (index + 1) % 4 != 0 ||
            (index - 4 >= 0 && occuper[index - 4] == 0 ||
                (index + 4 < 9 && occuper[index + 4] == 0))) {
          setState(() {
            occuper[occuper.indexOf('0')] = occuper[index];
          });
        }
        setState(() {
          occuper[index] = currentPlayer;
          winner();
        });
      },
      child: Container(
        color: Colors.black38,
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            occuper[index],
            style: const TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }

  _restartButton() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            initialisationGame();
          });
        },
        child: const Text("Recommencer la partie"));
  }

  winner() {
    List<List<String>> grilleWin = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', ''],
    ];

    for (var winPosition in grilleWin) {
      String grille0 = occuper[0];
      String grille1 = occuper[1];
      String grille2 = occuper[2];

      if (grille0.isNotEmpty) {
        if (grille0 == grille1 && grille0 == grille2) {
          messageFin("Le Joueur $grille0 à gagner !");
          gameEnd = true;
          return;
        }
      }
    }
  }

  messageFin(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        "Partie finie \n $message",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      ),
    ));
  }
}
