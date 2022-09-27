import 'package:flutter/material.dart';
import 'package:flutter_application_1/image.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key, required this.title});
  final String title;

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  @override
  static const String Joueur1 = "X";
  static const String Joueur2 = "O";

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
    occuper = ["", "", "", "", "", "", "", "", ""];
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
            Text("Tic Tac Toe",
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
            Color.fromARGB(255, 248, 252, 2),
            Color.fromARGB(255, 68, 67, 0),
          ],
        )),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
              width: 300,
              child: SimpsonTicTacToe(),
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
      children: [
        const Text(
          "Tic Tac Toe",
          style: TextStyle(fontSize: 30.0),
        ),
        Text("tour de $currentPlayer"),
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
        if (gameEnd || occuper[index].isNotEmpty) {
          return;
        }
        setState(() {
          occuper[index] = currentPlayer;
          changerTour();
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

  changerTour() {
    if (currentPlayer == Joueur1) {
      currentPlayer = Joueur2;
    } else {
      currentPlayer = Joueur1;
    }
  }

  winner() {
    List<List<int>> grilleWin = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var winPosition in grilleWin) {
      String grille0 = occuper[winPosition[0]];
      String grille1 = occuper[winPosition[1]];
      String grille2 = occuper[winPosition[2]];

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
