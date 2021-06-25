import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  bool get darkMode => Theme.of(this).brightness == Brightness.dark;
}
