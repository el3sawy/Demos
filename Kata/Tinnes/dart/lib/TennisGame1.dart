// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:core';
import 'package:tennis_game/player.dart';
import 'package:tennis_game/score_mangment.dart';
import 'TennisGame.dart';

class TennisGame1 implements TennisGame {
  late Player _fierstPlayer;
  late Player _secondPlayer;
  late ScoreMangment _scoreMangment;
  static const int POINT_SCORE = 1;

  TennisGame1(String firstPlyerName, String secondPlayerName) {
    this._fierstPlayer = new Player(firstPlyerName, 0);
    this._secondPlayer = new Player(secondPlayerName, 0);
    this._scoreMangment = new ScoreMangment();
  }

  void wonPoint(String playerName) {
    if (playerName == _fierstPlayer.name)
      _fierstPlayer.score += POINT_SCORE;
    else
      _secondPlayer.score += POINT_SCORE;
  }

  String getScore() {
    return _scoreMangment.configScore(_fierstPlayer.score, _secondPlayer.score);
  }
}
