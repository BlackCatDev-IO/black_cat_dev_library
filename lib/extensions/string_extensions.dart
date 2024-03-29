import 'package:flutter/material.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';

  String get allInCaps => this.toUpperCase();

  String get capitalizeFirstOfEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");

  String get capitalizeFirstWord => this.split(" ").map((str) => str).join(" ");

  bool get hasNumber => _hasNumber(this);

  bool _hasNumber(String str) {
    bool hasNumber = false;
    for (final char in str.characters) {
      if (_numeric.hasMatch(char)) {
        hasNumber = true;
      }
    }
    return hasNumber;
  }

  List<String> splitWordList() {
    final wordList = <String>[];
    for (final word in this.split(' ')) {
      wordList.add(word);
    }
    return wordList;
  }
}

final _numeric = RegExp(r'^-?[0-9]+$');
