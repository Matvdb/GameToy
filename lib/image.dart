import 'package:flutter/cupertino.dart';

class Manette extends StatelessWidget {
  const Manette({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/mannette.png');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
    );
  }
}

class SimpsonTicTacToe extends StatelessWidget {
  const SimpsonTicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =
        const AssetImage('assets/images/simpson_tictactoe.jpg');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
    );
  }
}

class Morpion extends StatelessWidget {
  const Morpion({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/morpion.png');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
    );
  }
}

class Taquin extends StatelessWidget {
  const Taquin({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/taquin.png');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
    );
  }
}
