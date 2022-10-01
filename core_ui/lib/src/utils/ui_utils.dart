import 'package:flutter/material.dart';

extension UiUtils on BuildContext {
  bool isWideScreen() {
    return MediaQuery.of(this).size.width > 600;
  }
}