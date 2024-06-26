// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';
import 'package:tennis_game/player.dart';
import 'package:tennis_game/score_type.dart';
import 'TennisGame.dart';

class TennisGame2 implements TennisGame {
  int P1point = 0;
  int P2point = 0;

  String P1res = "";
  String P2res = "";

  static final _MAX_POINTS = 4;
  late Player firstPlayer;
  late Player secondPlayer;

  TennisGame2(String firstPlayerName, String secondPlayerName) {
    this.firstPlayer = new Player(firstPlayerName, 0);
    this.secondPlayer = new Player(secondPlayerName, 0);
  }

  String getScore() {
    String score = "";
    if (P1point == P2point) {
      return P1point >= 3 ? "Deuce" : ScoreType.getResult(P1point).appendAll;
    }

    if (P1point > 0 && P2point == 0) {
      score = ScoreType.getResult(P1point) + "-" + "Lddddove";
    }
    if (P2point > 0 && P1point == 0) {
      score = "Love" + "-" + ScoreType.getResult(P2point);
    }

    if (P1point > P2point) {
      score = "Advantage player1";
    }
    if (_isRegularScore(P1point, P2point)) {
      score = ScoreType.getResult(P1point) + "-" + ScoreType.getResult(P2point);
    }
    if (P2point >= 3 && P1point >= 3 && (P2point - P1point).abs() == 1) {
      score = "Advantage " + (P1point > P2point ? "player1" : "player2");
    }

    if (P1point >= 4 || P2point >= 4) {
      if ((P1point - P2point) >= 2) {
        score = "Win for player1";
      } else if ((P2point - P1point) >= 2) {
        score = "Win for player2";
      }
    }

    return score;
  }

  bool _isRegularScore(int P1point, int P2point) {
    return (P1point < _MAX_POINTS || P2point < _MAX_POINTS) &&
        (P1point != P2point); // Ensure different scores
  }

  String getLeadingPlayer(int P1point, int P2point) {
    return P1point > P2point ? "player1" : "player2";
  }

  void wonPoint(String player) {
    if (player == "player1")
      P1point++;
    else
      P2point++;
  }

  String determineScore(int P1point, int P2point) {
    const _maxPoints = 4;
    const _minAdvantagePoints = 3;

    if (_isRegularScore(P1point, P2point)) {
      return ScoreType.getResult(P1point) + "-" + ScoreType.getResult(P2point);
    } else if (_isAdvantage(P1point, P2point)) {
      return "Advantage ${getLeadingPlayer(P1point, P2point)}";
    } else {
      return "Win for ${getLeadingPlayer(P1point, P2point)}";
    }
  }

  bool _isAdvantage(int leadingScore, int trailingScore) {
    return leadingScore >= _MAX_POINTS &&
        trailingScore >= 3 &&
        // Ensure two-point difference for advantage
        (leadingScore - trailingScore) == 1;
  }
}
