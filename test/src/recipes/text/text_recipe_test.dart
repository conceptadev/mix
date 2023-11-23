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
          const TextOverflowAttribute(TextOverflow.ellipsis),
          const StrutStyleAttribute(fontSize: 20.0),
          const TextAlignAttribute(TextAlign.center),
          const TextScaleFactorAttribute(1.0),
          const MaxLinesAttribute(2),
          TextStyleAttribute.only(color: const ColorAttribute(Colors.red)),
          const TextWidthBasisAttribute(TextWidthBasis.longestLine),
          const TextHeightBehaviorAttribute(
              TextHeightBehavior(applyHeightToFirstAscent: true)),
          const TextDirectionAttribute(TextDirection.ltr),
          const SoftWrapAttribute(true),
          TextDirectiveAttribute(uppercaseDirective),
        ),
      );

      final spec = TextRecipe.resolve(mix);

      expect(spec.overflow, TextOverflow.ellipsis);
      expect(spec.strutStyle, const StrutStyle(fontSize: 20.0));
      expect(spec.textAlign, TextAlign.center);
      expect(spec.textScaleFactor, 1.0);
      expect(spec.maxLines, 2);
      expect(spec.style, const TextStyle(color: Colors.red));
      expect(spec.textWidthBasis, TextWidthBasis.longestLine);
      expect(
          spec.textHeightBehavior,
          const TextHeightBehavior(
              applyHeightToFirstAscent: true, applyHeightToLastDescent: true));
      expect(spec.textDirection, TextDirection.ltr);
      expect(spec.softWrap, true);
      expect(spec.directives, [uppercaseDirective]);

      expect(spec.applyTextDirectives('hello'), 'HELLO');
    });

    test('copyWith', () {
      const spec = TextRecipe(
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
      const spec1 = TextRecipe(
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

      const spec2 = TextRecipe(
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
      expect(lerpedSpec.strutStyle, const StrutStyle(fontSize: 30.0));
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
