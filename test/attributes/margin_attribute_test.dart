// necessary libraries

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/exports.dart';

void main() {
  group('MarginAttribute', () {
    test('edgeInsets creates MarginAttribute from EdgeInsets', () {
      const edgeInsets = EdgeInsets.fromLTRB(10, 20, 30, 40);
      final margin = MarginAttribute.from(edgeInsets);

      expect(margin.top, 20.0);
      expect(margin.bottom, 40.0);
      expect(margin.left, 10.0);
      expect(margin.right, 30.0);
      expect(margin.start, null);
      expect(margin.end, null);
    });

    test('edgeInsets creates MarginAttribute from EdgeInsetsDirectional', () {
      const edgeInsetsDirectional =
          EdgeInsetsDirectional.fromSTEB(10, 20, 30, 40);
      final margin = MarginAttribute.from(edgeInsetsDirectional);

      expect(margin.top, 20.0);
      expect(margin.bottom, 40.0);
      expect(margin.start, 10.0);
      expect(margin.end, 30.0);
      expect(margin.left, null);
      expect(margin.right, null);
    });

    test('merge of non-directional attributes', () {
      const margin1 =
          MarginAttribute.only(top: 10, bottom: 20, left: 30, right: 40);
      const margin2 = MarginAttribute.only(top: 100);

      final merged = margin1.merge(margin2);

      expect(merged.top, 100.0);
      expect(merged.bottom, 20.0);
      expect(merged.left, 30.0);
      expect(merged.right, 40.0);
      expect(merged.start, null);
      expect(merged.end, null);
    });

    test('merge of directional attributes', () {
      const margin1 = MarginAttribute.directionalOnly(
          top: 10, bottom: 20, start: 30, end: 40);
      const margin2 = MarginAttribute.directionalOnly(end: 400);

      final merged = margin1.merge(margin2);

      expect(merged.top, 10.0);
      expect(merged.bottom, 20.0);
      expect(merged.start, 30.0);
      expect(merged.end, 400.0);
      expect(merged.left, null);
      expect(merged.right, null);
    });

    test('merge fails with directional and non-directional', () {
      const margin1 =
          MarginAttribute.only(top: 10, bottom: 20, left: 30, right: 40);
      const margin2 = MarginAttribute.directionalOnly(
          top: 100, bottom: 200, start: 300, end: 400);

      expect(() => margin1.merge(margin2), throwsUnsupportedError);
    });

    test('all sets values for top, bottom, left, and right', () {
      const allMargin = MarginAttribute.all(50);

      expect(allMargin.top, 50);
      expect(allMargin.bottom, 50);
      expect(allMargin.left, 50);
      expect(allMargin.right, 50);
      expect(allMargin.start, null);
      expect(allMargin.end, null);
    });

    test('symmetric sets values for top, bottom, left, and right', () {
      const symmetricMargin =
          MarginAttribute.symmetric(vertical: 50, horizontal: 40);

      expect(symmetricMargin.top, 50);
      expect(symmetricMargin.bottom, 50);
      expect(symmetricMargin.left, 40);
      expect(symmetricMargin.right, 40);
      expect(symmetricMargin.start, null);
      expect(symmetricMargin.end, null);
    });

    test('directionalAll sets values for top, bottom, start, and end', () {
      const directionalAllMargin = MarginAttribute.directionalAll(50);

      expect(directionalAllMargin.top, 50);
      expect(directionalAllMargin.bottom, 50);
      expect(directionalAllMargin.start, 50);
      expect(directionalAllMargin.end, 50);
      expect(directionalAllMargin.left, null);
      expect(directionalAllMargin.right, null);
    });

    test('directionalSymmetric sets values for top, bottom, start, and end',
        () {
      const directionalSymmetricMargin =
          MarginAttribute.directionalSymmetric(vertical: 50, horizontal: 40);

      expect(directionalSymmetricMargin.top, 50);
      expect(directionalSymmetricMargin.bottom, 50);
      expect(directionalSymmetricMargin.start, 40);
      expect(directionalSymmetricMargin.end, 40);
      expect(directionalSymmetricMargin.left, null);
      expect(directionalSymmetricMargin.right, null);
    });

    test('only sets specified values', () {
      const onlyMargin = MarginAttribute.only(top: 10, left: 20);

      expect(onlyMargin.top, 10);
      expect(onlyMargin.bottom, null);
      expect(onlyMargin.left, 20);
      expect(onlyMargin.right, null);
      expect(onlyMargin.start, null);
      expect(onlyMargin.end, null);
    });

    test('directionalOnly sets specified values', () {
      const directionalOnlyMargin =
          MarginAttribute.directionalOnly(top: 100, end: 200);

      expect(directionalOnlyMargin.top, 100);
      expect(directionalOnlyMargin.bottom, null);
      expect(directionalOnlyMargin.start, null);
      expect(directionalOnlyMargin.end, 200);
      expect(directionalOnlyMargin.left, null);
      expect(directionalOnlyMargin.right, null);
    });
  });

  group('Margin utilities', () {
    test('margin', () {
      expect(margin(20), const MarginAttribute.all(20));
    });

    test('marginSymmetric', () {
      expect(marginSymmetric(vertical: 20, horizontal: 10),
          const MarginAttribute.symmetric(vertical: 20, horizontal: 10));
    });

    test('marginTop', () {
      expect(marginTop(20), const MarginAttribute.only(top: 20));
    });

    test('marginBottom', () {
      expect(marginBottom(20), const MarginAttribute.only(bottom: 20));
    });

    test('marginLeft', () {
      expect(marginLeft(20), const MarginAttribute.only(left: 20));
    });

    test('marginRight', () {
      expect(marginRight(20), const MarginAttribute.only(right: 20));
    });

    test('marginStart', () {
      expect(marginStart(20), const MarginAttribute.directionalOnly(start: 20));
    });

    test('marginEnd', () {
      expect(marginEnd(20), const MarginAttribute.directionalOnly(end: 20));
    });

    test('marginHorizontal', () {
      expect(marginHorizontal(20),
          const MarginAttribute.symmetric(horizontal: 20));
    });

    test('marginVertical', () {
      expect(marginVertical(20), const MarginAttribute.symmetric(vertical: 20));
    });

    test('marginInsets', () {
      expect(
        marginInsets(const EdgeInsets.all(20)),
        MarginAttribute.from(
          const EdgeInsets.all(20),
        ),
      );
    });
  });
}
