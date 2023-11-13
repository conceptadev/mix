import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('Padding Utils', () {
    test('padding()', () {
      expect(
        padding(10),
        const PaddingAttribute(top: 10, bottom: 10, left: 10, right: 10),
      );
      expect(
        padding(10, 20),
        const PaddingAttribute(top: 10, bottom: 10, left: 20, right: 20),
      );
      expect(
        padding(10, 20, 30),
        const PaddingAttribute(top: 10, bottom: 30, left: 20, right: 20),
      );
      expect(
        padding(10, 20, 30, 40),
        const PaddingAttribute(top: 10, bottom: 30, left: 40, right: 20),
      );
    });

    test('paddingDirectional()', () {
      expect(
        paddingDirectional(10),
        const PaddingDirectionalAttribute(
          start: 10,
          end: 10,
          top: 10,
          bottom: 10,
        ),
        reason: '1',
      );
      expect(
        paddingDirectional(10, 20),
        const PaddingDirectionalAttribute(
          top: 10,
          bottom: 10,
          start: 20,
          end: 20,
        ),
        reason: '2',
      );
      expect(
        paddingDirectional(10, 20, 30),
        const PaddingDirectionalAttribute(
          top: 10,
          bottom: 30,
          start: 20,
          end: 20,
        ),
        reason: '3',
      );
      expect(
        paddingDirectional(10, 20, 30, 40),
        const PaddingDirectionalAttribute(
          top: 10,
          end: 20,
          bottom: 30,
          start: 40,
        ),
        reason: '4',
      );
    });

    // paddingFrom
    test('paddingFrom', () {
      expect(
        paddingFrom(const EdgeInsets.all(10)),
        const PaddingAttribute(top: 10, bottom: 10, left: 10, right: 10),
        reason: '1',
      );

      expect(
        paddingFrom(const EdgeInsets.only(top: 10)),
        const PaddingAttribute(top: 10, bottom: 0, left: 0, right: 0),
        reason: '2',
      );

      expect(
        paddingFrom(const EdgeInsets.only(left: 10)),
        const PaddingAttribute(left: 10, bottom: 0, top: 0, right: 0),
        reason: '3',
      );

      expect(
        paddingFrom(const EdgeInsets.only(right: 10)),
        const PaddingAttribute(right: 10, bottom: 0, top: 0, left: 0),
        reason: '4',
      );

      expect(
        paddingFrom(const EdgeInsets.only(bottom: 10)),
        const PaddingAttribute(bottom: 10, top: 0, left: 0, right: 0),
        reason: '5',
      );

      expect(
        paddingFrom(const EdgeInsets.symmetric(horizontal: 10)),
        const PaddingAttribute(left: 10, right: 10, top: 0, bottom: 0),
        reason: '6',
      );

      expect(
        paddingFrom(const EdgeInsets.symmetric(vertical: 10)),
        const PaddingAttribute(top: 10, bottom: 10, left: 0, right: 0),
        reason: '7',
      );

      expect(
        paddingFrom(const EdgeInsetsDirectional.only(start: 10)),
        const PaddingDirectionalAttribute(start: 10, end: 0, top: 0, bottom: 0),
        reason: '8',
      );

      expect(
        paddingFrom(const EdgeInsetsDirectional.only(end: 10)),
        const PaddingDirectionalAttribute(end: 10, start: 0, top: 0, bottom: 0),
        reason: '9',
      );

      expect(
        paddingFrom(const EdgeInsetsDirectional.only(top: 10)),
        const PaddingDirectionalAttribute(top: 10, bottom: 0, start: 0, end: 0),
        reason: '10',
      );

      expect(
        paddingFrom(const EdgeInsetsDirectional.only(bottom: 10)),
        const PaddingDirectionalAttribute(bottom: 10, top: 0, start: 0, end: 0),
        reason: '11',
      );

      expect(
        paddingFrom(const EdgeInsetsDirectional.only(start: 10, end: 20)),
        const PaddingDirectionalAttribute(
          start: 10,
          end: 20,
          top: 0,
          bottom: 0,
        ),
        reason: '12',
      );

      expect(
        paddingFrom(
            const EdgeInsetsDirectional.only(start: 10, end: 20, top: 30)),
        const PaddingDirectionalAttribute(
          start: 10,
          end: 20,
          top: 30,
          bottom: 0,
        ),
        reason: '13',
      );

      expect(
        paddingFrom(
          const EdgeInsetsDirectional.only(
            start: 10,
            end: 20,
            top: 30,
            bottom: 40,
          ),
        ),
        const PaddingDirectionalAttribute(
          start: 10,
          end: 20,
          top: 30,
          bottom: 40,
        ),
        reason: '14',
      );
    });

    // paddingDirectionalFrom

    test('paddingOnly', () {
      expect(
        paddingOnly(top: 10),
        const PaddingAttribute(top: 10),
      );

      expect(
        paddingOnly(left: 10),
        const PaddingAttribute(left: 10),
      );

      expect(
        paddingOnly(right: 10),
        const PaddingAttribute(right: 10),
      );

      expect(
        paddingOnly(bottom: 10),
        const PaddingAttribute(bottom: 10),
      );
    });

    test('paddingTop', () {
      expect(
        paddingTop(10),
        const PaddingAttribute(top: 10),
      );
    });

    test('paddingBottom', () {
      expect(
        paddingBottom(10),
        const PaddingAttribute(bottom: 10),
      );
    });

    test('paddingLeft', () {
      expect(
        paddingLeft(10),
        const PaddingAttribute(left: 10),
      );
    });

    test('paddingRight', () {
      expect(
        paddingRight(10),
        const PaddingAttribute(right: 10),
      );
    });

    test('paddingStart', () {
      expect(
        paddingStart(10),
        const PaddingDirectionalAttribute(start: 10),
      );
    });

    test('paddingEnd', () {
      expect(
        paddingEnd(10),
        const PaddingDirectionalAttribute(end: 10),
      );
    });

    test('paddingHorizontal', () {
      expect(
        paddingHorizontal(10),
        const PaddingAttribute(left: 10, right: 10),
      );
    });

    test('paddingVertical', () {
      expect(
        paddingVertical(10),
        const PaddingAttribute(top: 10, bottom: 10),
      );
    });

    test('paddingAll', () {
      expect(
        paddingAll(10),
        const PaddingAttribute(top: 10, bottom: 10, left: 10, right: 10),
      );
    });

    test('paddingDirectionalOnly', () {
      expect(
        paddingDirectionalOnly(start: 10),
        const PaddingDirectionalAttribute(start: 10),
      );

      expect(
        paddingDirectionalOnly(end: 10),
        const PaddingDirectionalAttribute(end: 10),
      );

      expect(
        paddingDirectionalOnly(start: 10, end: 20),
        const PaddingDirectionalAttribute(start: 10, end: 20),
      );

      expect(
        paddingDirectionalOnly(start: 10, end: 20, top: 30),
        const PaddingDirectionalAttribute(start: 10, end: 20, top: 30),
      );

      expect(
        paddingDirectionalOnly(start: 10, end: 20, top: 30, bottom: 40),
        const PaddingDirectionalAttribute(
            start: 10, end: 20, top: 30, bottom: 40),
      );
    });
  });

  group('Margin Utils', () {
    test('margin()', () {
      expect(
        margin(10),
        const MarginAttribute(top: 10, bottom: 10, left: 10, right: 10),
      );
      expect(
        margin(10, 20),
        const MarginAttribute(top: 10, bottom: 10, left: 20, right: 20),
      );
      expect(
        margin(10, 20, 30),
        const MarginAttribute(top: 10, bottom: 30, left: 20, right: 20),
      );
      expect(
        margin(10, 20, 30, 40),
        const MarginAttribute(top: 10, bottom: 30, left: 40, right: 20),
      );
    });

    // marginDirectional()
    test('marginDirectional()', () {
      expect(
        marginDirectional(10),
        const MarginDirectionalAttribute(
          start: 10,
          end: 10,
          top: 10,
          bottom: 10,
        ),
        reason: '1',
      );
      expect(
        marginDirectional(10, 20),
        const MarginDirectionalAttribute(
          top: 10,
          bottom: 10,
          start: 20,
          end: 20,
        ),
        reason: '2',
      );
      expect(
        marginDirectional(10, 20, 30),
        const MarginDirectionalAttribute(
          top: 10,
          bottom: 30,
          start: 20,
          end: 20,
        ),
        reason: '3',
      );
      expect(
        marginDirectional(10, 20, 30, 40),
        const MarginDirectionalAttribute(
          top: 10,
          end: 20,
          bottom: 30,
          start: 40,
        ),
        reason: '4',
      );
    });

    test('marginOnly', () {
      expect(
        marginOnly(top: 10),
        const MarginAttribute(top: 10),
      );

      expect(
        marginOnly(left: 10),
        const MarginAttribute(left: 10),
      );

      expect(
        marginOnly(right: 10),
        const MarginAttribute(right: 10),
      );

      expect(
        marginOnly(bottom: 10),
        const MarginAttribute(bottom: 10),
      );
    });

    test('marginTop', () {
      expect(
        marginTop(10),
        const MarginAttribute(top: 10),
      );
    });

    test('marginBottom', () {
      expect(
        marginBottom(10),
        const MarginAttribute(bottom: 10),
      );
    });

    test('marginLeft', () {
      expect(
        marginLeft(10),
        const MarginAttribute(left: 10),
      );
    });

    test('marginRight', () {
      expect(
        marginRight(10),
        const MarginAttribute(right: 10),
      );
    });

    test('marginStart', () {
      expect(
        marginStart(10),
        const MarginDirectionalAttribute(start: 10),
      );
    });

    test('marginEnd', () {
      expect(
        marginEnd(10),
        const MarginDirectionalAttribute(end: 10),
      );
    });

    test('marginHorizontal', () {
      expect(
        marginHorizontal(10),
        const MarginAttribute(left: 10, right: 10),
      );
    });

    test('marginVertical', () {
      expect(
        marginVertical(10),
        const MarginAttribute(top: 10, bottom: 10),
      );
    });

    test('marginAll', () {
      expect(
        marginAll(10),
        const MarginAttribute(top: 10, bottom: 10, left: 10, right: 10),
      );
    });

    test('marginFrom', () {
      expect(
        marginFrom(const EdgeInsets.all(10)),
        const MarginAttribute(top: 10, bottom: 10, left: 10, right: 10),
      );

      expect(
        marginFrom(const EdgeInsets.only(top: 10)),
        const MarginAttribute(top: 10, bottom: 0, left: 0, right: 0),
      );

      expect(
        marginFrom(const EdgeInsets.only(left: 10)),
        const MarginAttribute(left: 10, bottom: 0, top: 0, right: 0),
      );

      expect(
        marginFrom(const EdgeInsets.only(right: 10)),
        const MarginAttribute(right: 10, bottom: 0, top: 0, left: 0),
      );

      expect(
        marginFrom(const EdgeInsets.only(bottom: 10)),
        const MarginAttribute(bottom: 10, top: 0, left: 0, right: 0),
      );

      expect(
        marginFrom(const EdgeInsets.symmetric(horizontal: 10)),
        const MarginAttribute(left: 10, right: 10, top: 0, bottom: 0),
      );

      expect(
        marginFrom(const EdgeInsets.symmetric(vertical: 10)),
        const MarginAttribute(top: 10, bottom: 10, left: 0, right: 0),
      );

      expect(
        marginFrom(const EdgeInsetsDirectional.only(start: 10)),
        const MarginDirectionalAttribute(start: 10, end: 0, top: 0, bottom: 0),
      );

      expect(
        marginFrom(const EdgeInsetsDirectional.only(end: 10)),
        const MarginDirectionalAttribute(end: 10, start: 0, top: 0, bottom: 0),
      );

      expect(
        marginFrom(const EdgeInsetsDirectional.only(top: 10)),
        const MarginDirectionalAttribute(top: 10, bottom: 0, start: 0, end: 0),
      );

      expect(
        marginFrom(const EdgeInsetsDirectional.only(bottom: 10)),
        const MarginDirectionalAttribute(bottom: 10, top: 0, start: 0, end: 0),
      );

      expect(
        marginFrom(const EdgeInsetsDirectional.only(start: 10, end: 20)),
        const MarginDirectionalAttribute(start: 10, end: 20, top: 0, bottom: 0),
      );

      expect(
        marginFrom(
            const EdgeInsetsDirectional.only(start: 10, end: 20, top: 30)),
        const MarginDirectionalAttribute(
            start: 10, end: 20, top: 30, bottom: 0),
      );

      expect(
        marginFrom(const EdgeInsetsDirectional.only(
            start: 10, end: 20, top: 30, bottom: 40)),
        const MarginDirectionalAttribute(
            start: 10, end: 20, top: 30, bottom: 40),
      );
    });

    test('marginDirectionalOnly', () {
      expect(
        marginDirectionalOnly(start: 10),
        const MarginDirectionalAttribute(start: 10),
      );

      expect(
        marginDirectionalOnly(end: 10),
        const MarginDirectionalAttribute(end: 10),
      );

      expect(
        marginDirectionalOnly(start: 10, end: 20),
        const MarginDirectionalAttribute(start: 10, end: 20),
      );

      expect(
        marginDirectionalOnly(start: 10, end: 20, top: 30),
        const MarginDirectionalAttribute(start: 10, end: 20, top: 30),
      );

      expect(
        marginDirectionalOnly(start: 10, end: 20, top: 30, bottom: 40),
        const MarginDirectionalAttribute(
            start: 10, end: 20, top: 30, bottom: 40),
      );
    });
  });
}
