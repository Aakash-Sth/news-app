import 'package:flutter/material.dart';

extension NavExtension on BuildContext {
  void push(Widget screen) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
