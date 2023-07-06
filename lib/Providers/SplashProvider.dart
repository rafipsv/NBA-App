// ignore_for_file: file_names

import 'package:flutter/material.dart';

// starting of splash provider class
class SplashProvider with ChangeNotifier {
  int index = 0;
  List<String> images = [
    "assets/images/nba_player6-removebg.png",
    "assets/images/nba_player-removebg.png",
    "assets/images/nba_player2-removebg.png",
    "assets/images/nba_player8-removebg.png",
  ];
  // changing index value for change images.
  void changeImage() {
    index++;
    if (index == images.length) {
      index = 0;
      notifyListeners();
    }
    notifyListeners();
  }
}
