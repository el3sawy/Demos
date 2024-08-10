import 'package:tennis_game/score_type.dart';

final class EquallityScore {
  call(int score) {
    final result = ScoreType.getResult(score);
    return score >= 3 ? ScoreType.duece.name : result.appendAll;
  }
}
