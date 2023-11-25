import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('TextDirectionUtility Tests', () {
    test('Properties are initialized correctly', () {
      expect(textDirection.rtl(), isA<TextDirectionAttribute>());
      expect(textDirection.ltr(), isA<TextDirectionAttribute>());
      expect(textDirection.rtl().value, TextDirection.rtl);
      expect(textDirection.ltr().value, TextDirection.ltr);
    });
  });
}
