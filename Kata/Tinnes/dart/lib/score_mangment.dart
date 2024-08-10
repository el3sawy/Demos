import 'package:tennis_game/equallity_score.dart';
import 'package:tennis_game/score_advantage.dart';
import 'package:tennis_game/score_type.dart';

final class ScoreMangment {
  static const int _WIN_SCORE_WIN_VALUE = 4;
  String configScore(int firstScore, int secondScore) {
    String score = "";
    if (firstScore == secondScore) {
      return EquallityScore()(firstScore);
    } else if (_isGameWon(firstScore) || _isGameWon(secondScore)) {
      return AdvantageScore()(firstScore, secondScore);
    } else {
      score += ScoreType.getResult(firstScore);
      score += "-";
      score += ScoreType.getResult(secondScore);
    }
    return score;
  }

  bool _isGameWon(int socre) {
    return socre >= _WIN_SCORE_WIN_VALUE;
  }
}
