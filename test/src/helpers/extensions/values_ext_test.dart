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

    test('TextAlign toAttribute', () {
      const align = TextAlign.center;
      final attribute = align.toAttribute();
      expect(attribute.value, TextAlign.center);
    });

    test('Gradient toAttribute', () {
      const gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.red, Colors.blue],
      );

      final attribute = gradient.toAttribute();

      expect(attribute.value, gradient);
    });

    test('AlignmentGeometry toAttribute', () {
      const alignment = Alignment.center;
      final attribute = alignment.toAttribute();
      expect(attribute.resolve(EmptyMixData), Alignment.center);
    });

    test('ShapeDecoration toAttribute', () {
      final shapeDecoration = ShapeDecoration(
        shape: Border.all(),
        gradient: const RadialGradient(colors: [Colors.red, Colors.blue]),
        shadows: const [BoxShadow(blurRadius: 5.0)],
      );

      final attribute = shapeDecoration.toAttribute();

      expect(attribute.shape, Border.all());
      expect(attribute.gradient?.value,
          const RadialGradient(colors: [Colors.red, Colors.blue]));
      expect(attribute.boxShadow?.map((e) => e.resolve(EmptyMixData)),
          [const BoxShadow(blurRadius: 5.0)]);
    });

    test('Alignment toAttribute', () {
      const alignment = Alignment(0.5, 0.5);
      final attribute = alignment.toAttribute();
      expect(attribute.x, 0.5);
      expect(attribute.y, 0.5);
    });

    test('AlignmentDirectional toAttribute', () {
      const alignmentDirectional = AlignmentDirectional(0.5, 0.5);
      final attribute = alignmentDirectional.toAttribute();
      expect(attribute.start, 0.5);
      expect(attribute.y, 0.5);
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

    test('MainAxisAlignment toAttribute', () {
      const mainAxisAlignment = MainAxisAlignment.center;
      final attribute = mainAxisAlignment.toAttribute();
      expect(attribute.value, MainAxisAlignment.center);
    });

    test('CrossAxisAlignment toAttribute', () {
      const crossAxisAlignment = CrossAxisAlignment.center;
      final attribute = crossAxisAlignment.toAttribute();
      expect(attribute.value, CrossAxisAlignment.center);
    });

    test('MainAxisSize toAttribute', () {
      const mainAxisSize = MainAxisSize.max;
      final attribute = mainAxisSize.toAttribute();
      expect(attribute.value, MainAxisSize.max);
    });

    test('TextOverflow toAttribute', () {
      const textOverflow = TextOverflow.ellipsis;
      final attribute = textOverflow.toAttribute();
      expect(attribute.value, TextOverflow.ellipsis);
    });

    test('VerticalDirection toAttribute', () {
      const verticalDirection = VerticalDirection.up;
      final attribute = verticalDirection.toAttribute();
      expect(attribute.value, VerticalDirection.up);
    });

    test('Clip toAttribute', () {
      const clip = Clip.hardEdge;
      final attribute = clip.toAttribute();
      expect(attribute.value, Clip.hardEdge);
    });

    test('TextWidthBasis toAttribute', () {
      const textWidthBasis = TextWidthBasis.longestLine;
      final attribute = textWidthBasis.toAttribute();
      expect(attribute.value, TextWidthBasis.longestLine);
    });

    test('TextHeightBehavior toAttribute', () {
      const textHeightBehavior =
          TextHeightBehavior(applyHeightToFirstAscent: true);
      final attribute = textHeightBehavior.toAttribute();
      expect(attribute.value,
          const TextHeightBehavior(applyHeightToFirstAscent: true));
    });

    test('TextDirection toAttribute', () {
      const textDirection = TextDirection.ltr;
      final attribute = textDirection.toAttribute();
      expect(attribute.value, TextDirection.ltr);
    });

    test('ImageRepeat toAttribute', () {
      const imageRepeat = ImageRepeat.repeat;
      final attribute = imageRepeat.toAttribute();
      expect(attribute.value, ImageRepeat.repeat);
    });

    test('Axis toAttribute', () {
      const axis = Axis.horizontal;
      final attribute = axis.toAttribute();
      expect(attribute.value, Axis.horizontal);
    });

    test('BlendMode toAttribute', () {
      const blendMode = BlendMode.srcOver;
      final attribute = blendMode.toAttribute();
      expect(attribute.value, BlendMode.srcOver);
    });

    test('BoxFit toAttribute', () {
      const boxFit = BoxFit.cover;
      final attribute = boxFit.toAttribute();
      expect(attribute.value, BoxFit.cover);
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
      expect(attribute.gradient?.value,
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

    test('TextBaseline toAttribute', () {
      const textBaseline = TextBaseline.alphabetic;
      final attribute = textBaseline.toAttribute();
      expect(attribute.value, TextBaseline.alphabetic);
    });

    test('Matrix4 toAttribute', () {
      final matrix4 = Matrix4.identity();
      final attribute = matrix4.toAttribute();
      expect(attribute.value, Matrix4.identity());
    });

    test('BorderSide toAttribute', () {
      const borderSide = BorderSide(
        color: Colors.blue,
        width: 2.0,
        style: BorderStyle.solid,
      );
      final attribute = borderSide.toAttribute();
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
      final attribute = shadow.toAttribute();
      expect(attribute.blurRadius, 10.0);
      expect(attribute.color?.resolve(EmptyMixData), Colors.black);
    });

    test('BoxShadow toAttribute', () {
      const boxShadow = BoxShadow(blurRadius: 5.0, color: Colors.grey);
      final attribute = boxShadow.toAttribute();
      expect(attribute.blurRadius, 5.0);
      expect(attribute.color?.resolve(EmptyMixData), Colors.grey);
    });

    test('TextStyle toAttribute', () {
      const textStyle = TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      );
      final attribute = textStyle.toAttribute();
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
