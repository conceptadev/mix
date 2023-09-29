import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group("Test Mix Utilities", () {
    test('Test Margin Utilities', () {
      expect(
        margin(20),
        ContainerStyleUtilities().marginInsets(
          const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        ),
      );
      expect(
        marginTop(18),
        ContainerStyleUtilities().marginInsets(
          const EdgeInsets.only(top: 18),
        ),
      );
      expect(
        marginBottom(17),
        ContainerStyleUtilities().marginInsets(
          const EdgeInsets.only(bottom: 17),
        ),
      );
      expect(
        marginRight(16),
        ContainerStyleUtilities().marginInsets(
          const EdgeInsets.only(right: 16),
        ),
      );
      expect(
        marginLeft(15),
        ContainerStyleUtilities().marginInsets(
          const EdgeInsets.only(left: 15),
        ),
      );
      expect(
        marginHorizontal(14),
        ContainerStyleUtilities().marginInsets(
          const EdgeInsets.only(left: 14, right: 14),
        ),
      );
      expect(
        marginVertical(13),
        ContainerStyleUtilities().marginInsets(
          const EdgeInsets.only(top: 13, bottom: 13),
        ),
      );
    });

    test('Test Padding Utilities', () {
      expect(
        padding(20),
        ContainerStyleUtilities().paddingInsets(
          const EdgeInsets.all(20),
        ),
        reason: "Padding not applied to all",
      );
      expect(
        paddingTop(18),
        ContainerStyleUtilities().paddingInsets(
          const EdgeInsets.only(top: 18),
        ),
        reason: "Padding not applied to top",
      );
      expect(
        paddingBottom(17),
        ContainerStyleUtilities().paddingInsets(
          const EdgeInsets.only(bottom: 17),
        ),
        reason: "Padding not applied to bottom",
      );
      expect(
        paddingRight(16),
        ContainerStyleUtilities().paddingInsets(
          const EdgeInsets.only(right: 16),
        ),
        reason: "Padding not applied to right",
      );
      expect(
        paddingLeft(15),
        ContainerStyleUtilities().paddingInsets(
          const EdgeInsets.only(left: 15),
        ),
        reason: "Padding not applied to left",
      );
      expect(
        paddingHorizontal(14),
        ContainerStyleUtilities().paddingInsets(
          const EdgeInsets.only(left: 14, right: 14),
        ),
        reason: "Padding not applied to horizontally",
      );
      expect(
        paddingVertical(13),
        ContainerStyleUtilities().paddingInsets(
          const EdgeInsets.only(top: 13, bottom: 13),
        ),
        reason: "Padding not applied to vertically",
      );
    });
  });
}
