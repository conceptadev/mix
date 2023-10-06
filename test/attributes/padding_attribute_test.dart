// necessary libraries

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/exports.dart';

void main() {
  group('PaddingAttribute', () {
    test('edgeInsets creates PaddingAttribute from EdgeInsets', () {
      const edgeInsets = EdgeInsets.fromLTRB(10, 20, 30, 40);
      final margin = PaddingAttribute.edgeInsets(edgeInsets);

      expect(margin.top, 20.0);
      expect(margin.bottom, 40.0);
      expect(margin.left, 10.0);
      expect(margin.right, 30.0);
      expect(margin.start, null);
      expect(margin.end, null);
    });

    test('edgeInsets creates PaddingAttribute from EdgeInsetsDirectional', () {
      const edgeInsetsDirectional =
          EdgeInsetsDirectional.fromSTEB(10, 20, 30, 40);
      final margin = PaddingAttribute.edgeInsets(edgeInsetsDirectional);

      expect(margin.top, 20.0);
      expect(margin.bottom, 40.0);
      expect(margin.start, 10.0);
      expect(margin.end, 30.0);
      expect(margin.left, null);
      expect(margin.right, null);
    });

    test('merge of non-directional attributes', () {
      const margin1 =
          PaddingAttribute.only(top: 10, bottom: 20, left: 30, right: 40);
      const margin2 = PaddingAttribute.only(top: 100);

      final merged = margin1.merge(margin2);

      expect(merged.top, 100.0);
      expect(merged.bottom, 20.0);
      expect(merged.left, 30.0);
      expect(merged.right, 40.0);
      expect(merged.start, null);
      expect(merged.end, null);
    });

    test('merge of directional attributes', () {
      const margin1 = PaddingAttribute.directionalOnly(
          top: 10, bottom: 20, start: 30, end: 40);
      const margin2 = PaddingAttribute.directionalOnly(end: 400);

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
          PaddingAttribute.only(top: 10, bottom: 20, left: 30, right: 40);
      const margin2 = PaddingAttribute.directionalOnly(
          top: 100, bottom: 200, start: 300, end: 400);

      expect(() => margin1.merge(margin2), throwsUnsupportedError);
    });

    test('all sets values for top, bottom, left, and right', () {
      const allMargin = PaddingAttribute.all(50);

      expect(allMargin.top, 50);
      expect(allMargin.bottom, 50);
      expect(allMargin.left, 50);
      expect(allMargin.right, 50);
      expect(allMargin.start, null);
      expect(allMargin.end, null);
    });

    test('symmetric sets values for top, bottom, left, and right', () {
      const symmetricMargin =
          PaddingAttribute.symmetric(vertical: 50, horizontal: 40);

      expect(symmetricMargin.top, 50);
      expect(symmetricMargin.bottom, 50);
      expect(symmetricMargin.left, 40);
      expect(symmetricMargin.right, 40);
      expect(symmetricMargin.start, null);
      expect(symmetricMargin.end, null);
    });

    test('directionalAll sets values for top, bottom, start, and end', () {
      const directionalAllMargin = PaddingAttribute.directionalAll(50);

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
          PaddingAttribute.directionalSymmetric(vertical: 50, horizontal: 40);

      expect(directionalSymmetricMargin.top, 50);
      expect(directionalSymmetricMargin.bottom, 50);
      expect(directionalSymmetricMargin.start, 40);
      expect(directionalSymmetricMargin.end, 40);
      expect(directionalSymmetricMargin.left, null);
      expect(directionalSymmetricMargin.right, null);
    });

    test('only sets specified values', () {
      const onlyMargin = PaddingAttribute.only(top: 10, left: 20);

      expect(onlyMargin.top, 10);
      expect(onlyMargin.bottom, null);
      expect(onlyMargin.left, 20);
      expect(onlyMargin.right, null);
      expect(onlyMargin.start, null);
      expect(onlyMargin.end, null);
    });

    test('directionalOnly sets specified values', () {
      const directionalOnlyMargin =
          PaddingAttribute.directionalOnly(top: 100, end: 200);

      expect(directionalOnlyMargin.top, 100);
      expect(directionalOnlyMargin.bottom, null);
      expect(directionalOnlyMargin.start, null);
      expect(directionalOnlyMargin.end, 200);
      expect(directionalOnlyMargin.left, null);
      expect(directionalOnlyMargin.right, null);
    });
  });

  group('Padding utilities', () {
    test('padding', () {
      expect(padding(20), const PaddingAttribute.all(20));
    });

    test('paddingSymmetric', () {
      expect(paddingSymmetric(vertical: 20, horizontal: 10),
          const PaddingAttribute.symmetric(vertical: 20, horizontal: 10));
    });

    test('paddingTop', () {
      expect(paddingTop(20), const PaddingAttribute.only(top: 20));
    });

    test('paddingBottom', () {
      expect(paddingBottom(20), const PaddingAttribute.only(bottom: 20));
    });

    test('paddingLeft', () {
      expect(paddingLeft(20), const PaddingAttribute.only(left: 20));
    });

    test('paddingRight', () {
      expect(paddingRight(20), const PaddingAttribute.only(right: 20));
    });

    test('paddingStart', () {
      expect(
          paddingStart(20), const PaddingAttribute.directionalOnly(start: 20));
    });

    test('paddingEnd', () {
      expect(paddingEnd(20), const PaddingAttribute.directionalOnly(end: 20));
    });

    test('paddingHorizontal', () {
      expect(paddingHorizontal(20),
          const PaddingAttribute.symmetric(horizontal: 20));
    });

    test('paddingVertical', () {
      expect(
          paddingVertical(20), const PaddingAttribute.symmetric(vertical: 20));
    });

    test('paddingInsets', () {
      expect(
        paddingInsets(const EdgeInsets.all(20)),
        PaddingAttribute.edgeInsets(
          const EdgeInsets.all(20),
        ),
      );
    });
  });
}
