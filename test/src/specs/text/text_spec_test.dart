import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('TextSpec', () {
    const uppercaseDirective = TextDirective(TextModifiers.uppercase);
    const lowercaseDirective = TextDirective(TextModifiers.lowercase);
    test('resolve', () {
      final mix = MixData.create(
        MockBuildContext(),
        StyleMix(
          const StrutStyleAttribute(StrutStyleDto(fontSize: 20.0)),
          TextStyleAttribute(
              TextStyleDto.only(color: const ColorDto(Colors.red))),
          const TextSpecAttribute(
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            textScaleFactor: 1.0,
            maxLines: 2,
            textWidthBasis: TextWidthBasis.longestLine,
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: true,
              applyHeightToLastDescent: true,
            ),
            softWrap: true,
            directives: [uppercaseDirective],
          ),
        ),
      );

      final mixture = TextSpecAttribute.of(mix).resolve(mix);

      expect(mixture.overflow, TextOverflow.ellipsis);
      expect(mixture.strutStyle, const StrutStyle(fontSize: 20.0));
      expect(mixture.textAlign, TextAlign.center);
      expect(mixture.textScaleFactor, 1.0);
      expect(mixture.maxLines, 2);
      expect(mixture.style, const TextStyle(color: Colors.red));
      expect(mixture.textWidthBasis, TextWidthBasis.longestLine);
      expect(
          mixture.textHeightBehavior,
          const TextHeightBehavior(
              applyHeightToFirstAscent: true, applyHeightToLastDescent: true));
      expect(mixture.textDirection, TextDirection.ltr);
      expect(mixture.softWrap, true);
      expect(mixture.directives, [uppercaseDirective]);

      expect(mixture.applyTextDirectives('hello'), 'HELLO');
    });

    test('copyWith', () {
      const spec = TextSpec(
        overflow: TextOverflow.ellipsis,
        strutStyle: StrutStyle(fontSize: 20.0),
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
        maxLines: 2,
        style: TextStyle(color: Colors.red),
        textWidthBasis: TextWidthBasis.longestLine,
        textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: true, applyHeightToLastDescent: true),
        textDirection: TextDirection.ltr,
        softWrap: true,
        directives: [uppercaseDirective],
      );

      final copiedSpec = spec.copyWith(
        overflow: TextOverflow.fade,
        strutStyle: const StrutStyle(fontSize: 30.0),
        textAlign: TextAlign.start,
        textScaleFactor: 2.0,
        maxLines: 3,
        style: const TextStyle(color: Colors.blue),
        textWidthBasis: TextWidthBasis.parent,
        textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false, applyHeightToLastDescent: false),
        textDirection: TextDirection.rtl,
        softWrap: false,
        directives: [lowercaseDirective],
      );

      expect(copiedSpec.overflow, TextOverflow.fade);
      expect(copiedSpec.strutStyle, const StrutStyle(fontSize: 30.0));
      expect(copiedSpec.textAlign, TextAlign.start);
      expect(copiedSpec.textScaleFactor, 2.0);
      expect(copiedSpec.maxLines, 3);
      expect(copiedSpec.style, const TextStyle(color: Colors.blue));
      expect(copiedSpec.textWidthBasis, TextWidthBasis.parent);
      expect(
          copiedSpec.textHeightBehavior,
          const TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false));

      expect(copiedSpec.textDirection, TextDirection.rtl);
      expect(copiedSpec.softWrap, false);
      expect(copiedSpec.directives, [lowercaseDirective]);
    });

    test('lerp', () {
      const spec1 = TextSpec(
        overflow: TextOverflow.ellipsis,
        strutStyle: StrutStyle(fontSize: 20.0),
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
        maxLines: 2,
        style: TextStyle(color: Colors.red),
        textWidthBasis: TextWidthBasis.longestLine,
        textHeightBehavior: TextHeightBehavior(
          applyHeightToFirstAscent: true,
          applyHeightToLastDescent: true,
        ),
        textDirection: TextDirection.ltr,
        softWrap: true,
        directives: [uppercaseDirective],
      );

      const spec2 = TextSpec(
        overflow: TextOverflow.fade,
        strutStyle: StrutStyle(fontSize: 30.0),
        textAlign: TextAlign.start,
        textScaleFactor: 2.0,
        maxLines: 3,
        style: TextStyle(color: Colors.blue),
        textWidthBasis: TextWidthBasis.parent,
        textHeightBehavior: TextHeightBehavior(
          applyHeightToFirstAscent: false,
          applyHeightToLastDescent: false,
        ),
        textDirection: TextDirection.rtl,
        softWrap: false,
        directives: [lowercaseDirective],
      );

      const t = 0.5;

      final lerpedSpec = spec1.lerp(spec2, t);

      expect(lerpedSpec.overflow, TextOverflow.fade);
      expect(lerpedSpec.strutStyle, const StrutStyle(fontSize: 25));
      expect(lerpedSpec.textAlign, TextAlign.start);
      expect(lerpedSpec.textScaleFactor, 1.5);
      expect(lerpedSpec.maxLines, 3);
      expect(
          lerpedSpec.style,
          TextStyle.lerp(const TextStyle(color: Colors.red),
              const TextStyle(color: Colors.blue), t));
      expect(lerpedSpec.textWidthBasis, TextWidthBasis.parent);

      expect(
          lerpedSpec.textHeightBehavior,
          const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ));
      expect(lerpedSpec.textDirection, TextDirection.rtl);
      expect(lerpedSpec.softWrap, false);
      expect(lerpedSpec.directives, [lowercaseDirective]);

      expect(lerpedSpec, isNot(spec1));
    });
  });
}
