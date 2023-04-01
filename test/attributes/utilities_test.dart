import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group("Test Mix Utilities", () {
    test('Test Margin Utilities', () async {
      expect(
        m(20),
        BoxUtilities().marginInsets(
          const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        ),
      );
      expect(
        mt(18),
        BoxUtilities().marginInsets(
          const EdgeInsets.only(top: 18),
        ),
      );
      expect(
        mb(17),
        BoxUtilities().marginInsets(
          const EdgeInsets.only(bottom: 17),
        ),
      );
      expect(
        mr(16),
        BoxUtilities().marginInsets(
          const EdgeInsets.only(right: 16),
        ),
      );
      expect(
        ml(15),
        BoxUtilities().marginInsets(
          const EdgeInsets.only(left: 15),
        ),
      );
      expect(
        mx(14),
        BoxUtilities().marginInsets(
          const EdgeInsets.only(left: 14, right: 14),
        ),
      );
      expect(
        my(13),
        BoxUtilities().marginInsets(
          const EdgeInsets.only(top: 13, bottom: 13),
        ),
      );
    });

    test('Test Padding Utilities', () async {
      expect(
        p(20),
        BoxUtilities().paddingInsets(
          const EdgeInsets.all(20),
        ),
        reason: "Padding not applied to all",
      );
      expect(
        pt(18),
        BoxUtilities().paddingInsets(
          const EdgeInsets.only(top: 18),
        ),
        reason: "Padding not applied to top",
      );
      expect(
        pb(17),
        BoxUtilities().paddingInsets(
          const EdgeInsets.only(bottom: 17),
        ),
        reason: "Padding not applied to bottom",
      );
      expect(
        pr(16),
        BoxUtilities().paddingInsets(
          const EdgeInsets.only(right: 16),
        ),
        reason: "Padding not applied to right",
      );
      expect(
        pl(15),
        BoxUtilities().paddingInsets(
          const EdgeInsets.only(left: 15),
        ),
        reason: "Padding not applied to left",
      );
      expect(
        px(14),
        BoxUtilities().paddingInsets(
          const EdgeInsets.only(left: 14, right: 14),
        ),
        reason: "Padding not applied to horizontally",
      );
      expect(
        py(13),
        BoxUtilities().paddingInsets(
          const EdgeInsets.only(top: 13, bottom: 13),
        ),
        reason: "Padding not applied to vertically",
      );
    });
  });
}
