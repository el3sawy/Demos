enum ScoreType {
  love,
  fifteen,
  thirty,
  forty,
  duece;

  static String getResult(int score) {
    final name = ScoreType.values[score].toString();
    return ScoreType.values[score].name;
  }

  String get name {
    switch (this) {
      case ScoreType.love:
        return "Love";
      case ScoreType.fifteen:
        return "Fifteen";
      case ScoreType.thirty:
        return "Thirty";
      case ScoreType.forty:
        return "Forty";
      case ScoreType.duece:
        return "Deuce";
    }
  }
}

extension StringAll on String {
  get appendAll => this + "-All";
}
