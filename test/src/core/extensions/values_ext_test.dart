import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Extensions', () {
    test('StrutStyle toAttribute', () {
      const strutStyle = StrutStyle(
        fontFamily: 'Roboto',
        fontFamilyFallback: ['Arial', 'Helvetica'],
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        height: 1.2,
        leading: 5.0,
        forceStrutHeight: true,
      );

      final attribute = strutStyle.toAttribute();

      expect(attribute.fontFamily, 'Roboto');
      expect(attribute.fontFamilyFallback, ['Arial', 'Helvetica']);
      expect(attribute.fontSize, 14.0);
      expect(attribute.fontWeight, FontWeight.bold);
      expect(attribute.fontStyle, FontStyle.italic);
      expect(attribute.height, 1.2);
      expect(attribute.leading, 5.0);
      expect(attribute.forceStrutHeight, true);
    });

    test('StrutStyle merge', () {
      const strutStyle1 = StrutStyle(
        fontFamily: 'Roboto',
        fontSize: 14.0,
      );

      const strutStyle2 = StrutStyle(
        fontFamilyFallback: ['Arial', 'Helvetica'],
        fontWeight: FontWeight.bold,
        forceStrutHeight: true,
      );

      final mergedStyle = strutStyle1.merge(strutStyle2);

      expect(mergedStyle.fontFamily, 'Roboto');
      expect(mergedStyle.fontFamilyFallback, ['Arial', 'Helvetica']);
      expect(mergedStyle.fontSize, 14.0);
      expect(mergedStyle.fontWeight, FontWeight.bold);
      expect(mergedStyle.forceStrutHeight, true);
    });

    test('AlignmentGeometry toAttribute', () {
      const alignment = Alignment.center;
      final attribute = alignment.toAttribute();
      expect(attribute.value, Alignment.center);
    });

    test('ShapeDecoration toAttribute', () {
      final shapeDecoration = ShapeDecoration(
        shape: Border.all(),
        gradient: const RadialGradient(colors: [Colors.red, Colors.blue]),
        shadows: const [BoxShadow(blurRadius: 5.0)],
      );

      final attribute = shapeDecoration.toAttribute();

      expect(attribute.shape, Border.all());
      expect(attribute.gradient?.resolve(EmptyMixData),
          const RadialGradient(colors: [Colors.red, Colors.blue]));
      expect(attribute.boxShadow?.map((e) => e.resolve(EmptyMixData)),
          [const BoxShadow(blurRadius: 5.0)]);
    });

    test('Alignment toAttribute', () {
      const alignment = Alignment(0.5, 0.5);
      final attribute = alignment.toAttribute();
      final result = attribute.value as Alignment;
      expect(result.x, 0.5);
      expect(result.y, 0.5);
    });

    test('AlignmentDirectional toAttribute', () {
      const alignmentDirectional = AlignmentDirectional(0.5, 0.5);
      final attribute = alignmentDirectional.toAttribute();
      final result = attribute.value as AlignmentDirectional;
      expect(result.start, 0.5);
      expect(result.y, 0.5);
    });

    test('BoxConstraints toAttribute', () {
      const boxConstraints = BoxConstraints(
        minWidth: 100.0,
        maxWidth: 200.0,
        minHeight: 150.0,
        maxHeight: 250.0,
      );
      final attribute = boxConstraints.toAttribute();
      expect(attribute.minWidth, 100.0);
      expect(attribute.maxWidth, 200.0);
      expect(attribute.minHeight, 150.0);
      expect(attribute.maxHeight, 250.0);
    });

    test('Axis toAttribute', () {
      const axis = Axis.horizontal;
      final attribute = axis.toAttribute();
      expect(attribute.value, Axis.horizontal);
    });

    test('BoxDecoration toAttribute', () {
      final boxDecoration = BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.0),
        gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
        boxShadow: const [BoxShadow(blurRadius: 5.0)],
      );

      final attribute = boxDecoration.toAttribute();

      expect(attribute.color?.value, Colors.blue);
      expect(attribute.border?.resolve(EmptyMixData), Border.all());
      expect(attribute.borderRadius?.resolve(EmptyMixData),
          BorderRadius.circular(10.0));
      expect(attribute.gradient?.resolve(EmptyMixData),
          const LinearGradient(colors: [Colors.red, Colors.blue]));
      expect(
          attribute.boxShadow?.map(
            (e) => e.resolve(EmptyMixData),
          ),
          [const BoxShadow(blurRadius: 5.0)]);
    });

    test('BorderRadiusGeometry toAttribute', () {
      const borderRadius = BorderRadius.all(Radius.circular(10.0));
      final attribute = borderRadius.toAttribute();
      expect(attribute.resolve(EmptyMixData), borderRadius);
    });

    test('BorderRadiusDirectional toAttribute', () {
      const borderRadiusDirectional =
          BorderRadiusDirectional.all(Radius.circular(10.0));
      final attribute = borderRadiusDirectional.toAttribute();
      expect(attribute.resolve(EmptyMixData), borderRadiusDirectional);
    });

    test('BorderRadius toAttribute', () {
      const borderRadius = BorderRadius.all(Radius.circular(10.0));
      final attribute = borderRadius.toAttribute();
      expect(attribute.resolve(EmptyMixData), borderRadius);
    });

    test('Matrix4 toAttribute', () {
      final matrix4 = Matrix4.identity();
      final attribute = matrix4.toAttribute();
      expect(attribute.value, Matrix4.identity());
    });

    test('BorderSide toDto', () {
      const borderSide = BorderSide(
        color: Colors.blue,
        width: 2.0,
        style: BorderStyle.solid,
      );
      final attribute = borderSide.toDto();
      expect(attribute.color?.resolve(EmptyMixData), Colors.blue);
      expect(attribute.width, 2.0);
      expect(attribute.style, BorderStyle.solid);
    });

    test('BoxBorder toAttribute', () {
      final boxBorder = Border.all(
          style: BorderStyle.solid, width: 1.0, color: const Color(0xff000000));
      final attribute = boxBorder.toAttribute();
      expect(
          attribute.top?.resolve(EmptyMixData),
          const BorderSide(
              style: BorderStyle.solid, width: 1.0, color: Color(0xff000000)));
      expect(
          attribute.bottom?.resolve(EmptyMixData),
          const BorderSide(
              style: BorderStyle.solid, width: 1.0, color: Color(0xff000000)));
      expect(
          attribute.left?.resolve(EmptyMixData),
          const BorderSide(
              style: BorderStyle.solid, width: 1.0, color: Color(0xff000000)));
      expect(
          attribute.right?.resolve(EmptyMixData),
          const BorderSide(
              style: BorderStyle.solid, width: 1.0, color: Color(0xff000000)));
    });

    test('Shadow toAttribute', () {
      const shadow = BoxShadow(blurRadius: 10.0, color: Colors.black);
      final attribute = shadow.toDto();
      expect(attribute.blurRadius, 10.0);
      expect(attribute.color?.resolve(EmptyMixData), Colors.black);
    });

    test('BoxShadow toAttribute', () {
      const boxShadow = BoxShadow(blurRadius: 5.0, color: Colors.grey);
      final attribute = boxShadow.toDto();
      expect(attribute.blurRadius, 5.0);
      expect(attribute.color?.resolve(EmptyMixData), Colors.grey);
    });

    test('TextStyle toDto', () {
      const textStyle = TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      );
      final attribute = textStyle.toDto();
      expect(attribute.color?.resolve(EmptyMixData), Colors.black);
      expect(attribute.fontSize, 16.0);
      expect(attribute.fontWeight, FontWeight.bold);
    });

    test('Border toAttribute', () {
      const border = Border(
          top: BorderSide(color: Colors.red),
          bottom: BorderSide(color: Colors.blue));
      final attribute = border.toAttribute();
      expect(attribute.top?.resolve(EmptyMixData),
          const BorderSide(color: Colors.red));
      expect(attribute.bottom?.resolve(EmptyMixData),
          const BorderSide(color: Colors.blue));
    });

    test('BorderDirectional toAttribute', () {
      const borderDirectional = BorderDirectional(
          top: BorderSide(color: Colors.red),
          bottom: BorderSide(color: Colors.blue));
      final attribute = borderDirectional.toAttribute();
      expect(attribute.top?.resolve(EmptyMixData),
          const BorderSide(color: Colors.red));
      expect(attribute.bottom?.resolve(EmptyMixData),
          const BorderSide(color: Colors.blue));
    });
  });
}
