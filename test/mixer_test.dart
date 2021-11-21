import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/box/box.utils.dart';

void main() {
  group("Mixer Test", () {
    test('', () async {
      expect(
        m(20),
        BoxUtility.marginInsets(
          const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        ),
      );
    });
  });
}
