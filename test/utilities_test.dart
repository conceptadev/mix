import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/utilities.dart';
import 'package:mix/src/attributes/widgets/box/box.utils.dart';

void main() {
  group("Test Mix Utilities", () {
    test('Test Margin Utilities', () async {
      expect(
        m(20),
        BoxUtility.margin(
          const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        ),
      );
      expect(
        mt(18),
        BoxUtility.margin(
          const EdgeInsets.only(top: 18),
        ),
      );
      expect(
        mb(17),
        BoxUtility.margin(
          const EdgeInsets.only(bottom: 17),
        ),
      );
      expect(
        mr(16),
        BoxUtility.margin(
          const EdgeInsets.only(right: 16),
        ),
      );
      expect(
        ml(15),
        BoxUtility.margin(
          const EdgeInsets.only(left: 15),
        ),
      );
      expect(
        mx(14),
        BoxUtility.margin(
          const EdgeInsets.only(left: 14, right: 14),
        ),
      );
      expect(
        my(13),
        BoxUtility.margin(
          const EdgeInsets.only(top: 13, bottom: 13),
        ),
      );
    });

    test('Test Padding Utilities', () async {
      expect(
        p(20),
        BoxUtility.padding(
          const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        ),
      );
      expect(
        pt(18),
        BoxUtility.padding(
          const EdgeInsets.only(top: 18),
        ),
      );
      expect(
        pb(17),
        BoxUtility.padding(
          const EdgeInsets.only(bottom: 17),
        ),
      );
      expect(
        mr(16),
        BoxUtility.padding(
          const EdgeInsets.only(right: 16),
        ),
      );
      expect(
        pl(15),
        BoxUtility.padding(
          const EdgeInsets.only(left: 15),
        ),
      );
      expect(
        px(14),
        BoxUtility.padding(
          const EdgeInsets.only(left: 14, right: 14),
        ),
      );
      expect(
        py(13),
        BoxUtility.padding(
          const EdgeInsets.only(top: 13, bottom: 13),
        ),
      );
    });
  });
}
