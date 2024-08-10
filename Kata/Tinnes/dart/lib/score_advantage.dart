class AdvantageScore {
  String call(int firstScore, int secondScore) {
    int scoreDiff = firstScore - secondScore;
    if (scoreDiff >= 2) return "Win for player1";

    switch (scoreDiff) {
      case 1:
        return "Advantage player1";
      case -1:
        return "Advantage player2";
      default:
        return "Win for player2";
    }
  }
}
