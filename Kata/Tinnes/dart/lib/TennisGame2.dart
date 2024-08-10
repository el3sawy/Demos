import 'dart:core';

import 'package:tennis_game/score_type.dart';

import 'TennisGame.dart';

class TennisGame2 implements TennisGame {
  int P1point = 0;
  int P2point = 0;

  String _player1Name;
  String _player2Name;
  static const String LOVE = "love";
  TennisGame2(
    this._player1Name,
    this._player2Name,
  );

  String getScore() {
    final diff = (P1point - P2point).abs();
    if (P1point == P2point) {
      return P1point >= 3 ? "Deuce" : ScoreType.getResult(P1point).appendAll;
    } else if (P1point > P2point) {
      if (P1point < 4) {
        return ScoreType.getResult(P1point) +
            "-" +
            ScoreType.getResult(P2point);
      }
      return diff == 1 ? "Advantage player1" : "Win for player1";
    } else {
      if (P2point < 4) {
        return ScoreType.getResult(P1point) +
            "-" +
            ScoreType.getResult(P2point);
      }
      return diff == 1 ? "Advantage player2" : "Win for player2";
    }
  }

  void SetP1Score(int number) {
    for (int i = 0; i < number; i++) {
      P1Score();
    }
  }

  void SetP2Score(int number) {
    for (int i = 0; i < number; i++) {
      P2Score();
    }
  }

  void P1Score() {
    P1point++;
  }

  void P2Score() {
    P2point++;
  }

  void wonPoint(String player) {
    if (player == "player1")
      P1Score();
    else
      P2Score();
  }
}
