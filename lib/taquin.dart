class JeuTaquin {
  List<String> _grilleTaquin = List.generate(9, (index) => "");
  int _tour = 0;
  String _Joueur = "";
  int _victoireX = 0;
  int _victoireY = 0;

  JeuTaquin(this._tour, this._Joueur, this._victoireX, this._victoireY);

  int getTour() {
    return this._tour;
  }

  String getJoueur() {
    return this._Joueur;
  }

  int getVictoireX() {
    return this._victoireX;
  }

  int getVictoireY() {
    return this._victoireY;
  }

  void setTour(nbTour) {
    this._tour = nbTour;
  }

  void setJoueur(nvJoueur) {
    this._Joueur = nvJoueur;
  }
}
