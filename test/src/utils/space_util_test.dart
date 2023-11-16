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

    // padding.from
    test('padding.from', () {
      expect(
        padding.from(const EdgeInsets.all(10)),
        const PaddingAttribute(top: 10, bottom: 10, left: 10, right: 10),
        reason: '1',
      );

      expect(
        padding.from(const EdgeInsets.only(top: 10)),
        const PaddingAttribute(top: 10, bottom: 0, left: 0, right: 0),
        reason: '2',
      );

      expect(
        padding.from(const EdgeInsets.only(left: 10)),
        const PaddingAttribute(left: 10, bottom: 0, top: 0, right: 0),
        reason: '3',
      );

      expect(
        padding.from(const EdgeInsets.only(right: 10)),
        const PaddingAttribute(right: 10, bottom: 0, top: 0, left: 0),
        reason: '4',
      );

      expect(
        padding.from(const EdgeInsets.only(bottom: 10)),
        const PaddingAttribute(bottom: 10, top: 0, left: 0, right: 0),
        reason: '5',
      );

      expect(
        padding.from(const EdgeInsets.symmetric(horizontal: 10)),
        const PaddingAttribute(left: 10, right: 10, top: 0, bottom: 0),
        reason: '6',
      );

      expect(
        padding.from(const EdgeInsets.symmetric(vertical: 10)),
        const PaddingAttribute(top: 10, bottom: 10, left: 0, right: 0),
        reason: '7',
      );

      expect(
        paddingDirectional.as(const EdgeInsetsDirectional.only(start: 10)),
        const PaddingDirectionalAttribute(start: 10, end: 0, top: 0, bottom: 0),
        reason: '8',
      );

      expect(
        paddingDirectional.as(const EdgeInsetsDirectional.only(end: 10)),
        const PaddingDirectionalAttribute(end: 10, start: 0, top: 0, bottom: 0),
        reason: '9',
      );

      expect(
        paddingDirectional.as(const EdgeInsetsDirectional.only(top: 10)),
        const PaddingDirectionalAttribute(top: 10, bottom: 0, start: 0, end: 0),
        reason: '10',
      );

      expect(
        paddingDirectional.as(const EdgeInsetsDirectional.only(bottom: 10)),
        const PaddingDirectionalAttribute(bottom: 10, top: 0, start: 0, end: 0),
        reason: '11',
      );

      expect(
        paddingDirectional
            .as(const EdgeInsetsDirectional.only(start: 10, end: 20)),
        const PaddingDirectionalAttribute(
          start: 10,
          end: 20,
          top: 0,
          bottom: 0,
        ),
        reason: '12',
      );

      expect(
        paddingDirectional
            .as(const EdgeInsetsDirectional.only(start: 10, end: 20, top: 30)),
        const PaddingDirectionalAttribute(
          start: 10,
          end: 20,
          top: 30,
          bottom: 0,
        ),
        reason: '13',
      );

      expect(
        paddingDirectional.as(
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

    test('padding.only', () {
      expect(
        padding.only(top: 10),
        const PaddingAttribute(top: 10),
      );

      expect(
        padding.only(left: 10),
        const PaddingAttribute(left: 10),
      );

      expect(
        padding.only(right: 10),
        const PaddingAttribute(right: 10),
      );

      expect(
        padding.only(bottom: 10),
        const PaddingAttribute(bottom: 10),
      );
    });

    test('padding.top', () {
      expect(
        padding.top(10),
        const PaddingAttribute(top: 10),
      );
    });

    test('padding.bottom', () {
      expect(
        padding.bottom(10),
        const PaddingAttribute(bottom: 10),
      );
    });

    test('padding.left', () {
      expect(
        padding.left(10),
        const PaddingAttribute(left: 10),
      );
    });

    test('padding.right', () {
      expect(
        padding.right(10),
        const PaddingAttribute(right: 10),
      );
    });

    test('paddingDirectional.start', () {
      expect(
        paddingDirectional.start(10),
        const PaddingDirectionalAttribute(start: 10),
      );
    });

    test('paddingDirectional.end', () {
      expect(
        paddingDirectional.end(10),
        const PaddingDirectionalAttribute(end: 10),
      );
    });

    test('padding.horizontal', () {
      expect(
        padding.horizontal(10),
        const PaddingAttribute(left: 10, right: 10),
      );
    });

    test('padding.vertical', () {
      expect(
        padding.vertical(10),
        const PaddingAttribute(top: 10, bottom: 10),
      );
    });

    test('padding.all', () {
      expect(
        padding.all(10),
        const PaddingAttribute(top: 10, bottom: 10, left: 10, right: 10),
      );
    });

    test('paddingDirectional.only', () {
      expect(
        paddingDirectional.only(start: 10),
        const PaddingDirectionalAttribute(start: 10),
      );

      expect(
        paddingDirectional.only(end: 10),
        const PaddingDirectionalAttribute(end: 10),
      );

      expect(
        paddingDirectional.only(start: 10, end: 20),
        const PaddingDirectionalAttribute(start: 10, end: 20),
      );

      expect(
        paddingDirectional.only(start: 10, end: 20, top: 30),
        const PaddingDirectionalAttribute(start: 10, end: 20, top: 30),
      );

      expect(
        paddingDirectional.only(start: 10, end: 20, top: 30, bottom: 40),
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

    test('margin.only', () {
      expect(
        margin.only(top: 10),
        const MarginAttribute(top: 10),
      );

      expect(
        margin.only(left: 10),
        const MarginAttribute(left: 10),
      );

      expect(
        margin.only(right: 10),
        const MarginAttribute(right: 10),
      );

      expect(
        margin.only(bottom: 10),
        const MarginAttribute(bottom: 10),
      );
    });

    test('margin.top', () {
      expect(
        margin.top(10),
        const MarginAttribute(top: 10),
      );
    });

    test('margin.bottom', () {
      expect(
        margin.bottom(10),
        const MarginAttribute(bottom: 10),
      );
    });

    test('margin.left', () {
      expect(
        margin.left(10),
        const MarginAttribute(left: 10),
      );
    });

    test('margin.right', () {
      expect(
        margin.right(10),
        const MarginAttribute(right: 10),
      );
    });

    test('marginDirectional.start', () {
      expect(
        marginDirectional.start(10),
        const MarginDirectionalAttribute(start: 10),
      );
    });

    test('marginDirectional.end', () {
      expect(
        marginDirectional.end(10),
        const MarginDirectionalAttribute(end: 10),
      );
    });

    test('margin.horizontal', () {
      expect(
        margin.horizontal(10),
        const MarginAttribute(left: 10, right: 10),
      );
    });

    test('margin.vertical', () {
      expect(
        margin.vertical(10),
        const MarginAttribute(top: 10, bottom: 10),
      );
    });

    test('margin.all', () {
      expect(
        margin.all(10),
        const MarginAttribute(top: 10, bottom: 10, left: 10, right: 10),
      );
    });

    test('margin.from', () {
      expect(
        margin.from(const EdgeInsets.all(10)),
        const MarginAttribute(top: 10, bottom: 10, left: 10, right: 10),
      );

      expect(
        margin.from(const EdgeInsets.only(top: 10)),
        const MarginAttribute(top: 10, bottom: 0, left: 0, right: 0),
      );

      expect(
        margin.from(const EdgeInsets.only(left: 10)),
        const MarginAttribute(left: 10, bottom: 0, top: 0, right: 0),
      );

      expect(
        margin.from(const EdgeInsets.only(right: 10)),
        const MarginAttribute(right: 10, bottom: 0, top: 0, left: 0),
      );

      expect(
        margin.from(const EdgeInsets.only(bottom: 10)),
        const MarginAttribute(bottom: 10, top: 0, left: 0, right: 0),
      );

      expect(
        margin.from(const EdgeInsets.symmetric(horizontal: 10)),
        const MarginAttribute(left: 10, right: 10, top: 0, bottom: 0),
      );

      expect(
        margin.from(const EdgeInsets.symmetric(vertical: 10)),
        const MarginAttribute(top: 10, bottom: 10, left: 0, right: 0),
      );

      expect(
        marginDirectional.as(const EdgeInsetsDirectional.only(start: 10)),
        const MarginDirectionalAttribute(start: 10, end: 0, top: 0, bottom: 0),
      );

      expect(
        marginDirectional.as(const EdgeInsetsDirectional.only(end: 10)),
        const MarginDirectionalAttribute(end: 10, start: 0, top: 0, bottom: 0),
      );

      expect(
        marginDirectional.as(const EdgeInsetsDirectional.only(top: 10)),
        const MarginDirectionalAttribute(top: 10, bottom: 0, start: 0, end: 0),
      );

      expect(
        marginDirectional.as(const EdgeInsetsDirectional.only(bottom: 10)),
        const MarginDirectionalAttribute(bottom: 10, top: 0, start: 0, end: 0),
      );

      expect(
        marginDirectional
            .as(const EdgeInsetsDirectional.only(start: 10, end: 20)),
        const MarginDirectionalAttribute(start: 10, end: 20, top: 0, bottom: 0),
      );

      expect(
        marginDirectional
            .as(const EdgeInsetsDirectional.only(start: 10, end: 20, top: 30)),
        const MarginDirectionalAttribute(
            start: 10, end: 20, top: 30, bottom: 0),
      );

      expect(
        marginDirectional.as(const EdgeInsetsDirectional.only(
            start: 10, end: 20, top: 30, bottom: 40)),
        const MarginDirectionalAttribute(
            start: 10, end: 20, top: 30, bottom: 40),
      );
    });

    test('marginDirectional.only', () {
      expect(
        marginDirectional.only(start: 10),
        const MarginDirectionalAttribute(start: 10),
      );

      expect(
        marginDirectional.only(end: 10),
        const MarginDirectionalAttribute(end: 10),
      );

      expect(
        marginDirectional.only(start: 10, end: 20),
        const MarginDirectionalAttribute(start: 10, end: 20),
      );

      expect(
        marginDirectional.only(start: 10, end: 20, top: 30),
        const MarginDirectionalAttribute(start: 10, end: 20, top: 30),
      );

      expect(
        marginDirectional.only(start: 10, end: 20, top: 30, bottom: 40),
        const MarginDirectionalAttribute(
            start: 10, end: 20, top: 30, bottom: 40),
      );
    });
  });
}
