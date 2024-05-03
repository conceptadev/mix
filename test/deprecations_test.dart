import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('Deprecated Mix Extension', () {
    test('withVariants should call withManyVariants', () {
      final style = Style();
      final variants = [const Variant('test')];

      expect(style.withVariants(variants), style.applyVariants(variants));
    });

    test('withVariant should call applyVariant', () {
      final style = Style();
      const variant = Variant('test');

      expect(style.withVariant(variant), style.applyVariant(variant));
    });

    test('combineAll should call Style.combine', () {
      final styles = [Style(), Style()];

      expect(Style().combineAll(styles), Style.combine(styles));
    });

    test('withMaybeVariant should return original style if variant is null',
        () {
      final style = Style();

      expect(style.withMaybeVariant(null), style);
    });

    test('maybeApply should return original style if mix is null', () {
      final style = Style();

      expect(style.maybeApply(null), style);
    });
  });

  group('Deprecated utilities', () {
    test('flex utilities', () {
      const value = MainAxisAlignment.center;

      expect(mainAxis(value), $flex.mainAxisAlignment(value));
      expect(mainAxisAlignment(value), $flex.mainAxisAlignment(value));

      expect(directionAxis(Axis.horizontal), $flex.direction(Axis.horizontal));
      expect(directionAxis(Axis.vertical), $flex.direction(Axis.vertical));

      expect(crossAxis(CrossAxisAlignment.center),
          $flex.crossAxisAlignment(CrossAxisAlignment.center));
      expect(crossAxisAlignment(CrossAxisAlignment.center),
          $flex.crossAxisAlignment(CrossAxisAlignment.center));

      expect(
          mainAxisSize(MainAxisSize.min), $flex.mainAxisSize(MainAxisSize.min));
      expect(
          mainAxisSize(MainAxisSize.max), $flex.mainAxisSize(MainAxisSize.max));

      expect(gap(10.0), $flex.gap(10.0));
    });

    test('box utilities', () {
      expect(h(10), $box.height(10));
      expect(w(10), $box.width(10));
      expect(maxH(10), $box.maxHeight(10));
      expect(maxW(10), $box.maxWidth(10));
      expect(minH(10), $box.minHeight(10));
      expect(minW(10), $box.minWidth(10));
    });

    test('border utilities', () {
      expect(bt(width: 2), $box.border.top(width: 2));
      expect(bb(width: 2), $box.border.bottom(width: 2));
      expect(bl(width: 2), $box.border.left(width: 2));
      expect(br(width: 2), $box.border.right(width: 2));
      expect(bs(width: 2), $box.borderDirectional.start(width: 2));
      expect(be(width: 2), $box.borderDirectional.end(width: 2));
    });

    test('background color utility', () {
      expect(bgColor(Colors.red), $box.color(Colors.red));
    });

    test('text utilities', () {
      const style = TextStyle();
      final paint = Paint();
      expect(textStyle(style), $text.style.as(style));
      expect(
          fontWeight(FontWeight.bold), $text.style.fontWeight(FontWeight.bold));
      expect(letterSpacing(1.0), $text.style.letterSpacing(1.0));
      expect(debugLabel('label'), $text.style.debugLabel('label'));
      expect(textHeight(1.0), $text.style.height(1.0));
      expect(wordSpacing(1.0), $text.style.wordSpacing(1.0));
      expect(
          fontStyle(FontStyle.italic), $text.style.fontStyle(FontStyle.italic));
      expect(fontSize(16.0), $text.style.fontSize(16.0));
      expect(textColor(Colors.red), $text.style.color(Colors.red));
      expect(
          textBgColor(Colors.blue), $text.style.backgroundColor(Colors.blue));
      expect(textForeground(paint), $text.style.foreground(paint));
      expect(textBackground(paint), $text.style.background(paint));
      expect(textShadows([const Shadow(color: Colors.black)]),
          $text.style.shadows([const Shadow(color: Colors.black)]));
      expect(fontFeatures([const FontFeature.oldstyleFigures()]),
          $text.style.fontFeatures([const FontFeature.oldstyleFigures()]));
      expect(textDecoration(TextDecoration.underline),
          $text.style.decoration(TextDecoration.underline));
      expect(textDecorationColor(Colors.red),
          $text.style.decorationColor(Colors.red));
      expect(textDecorationStyle(TextDecorationStyle.dashed),
          $text.style.decorationStyle(TextDecorationStyle.dashed));
      expect(
          textDecorationThickness(2.0), $text.style.decorationThickness(2.0));
      expect(fontFamilyFallback(['Arial']),
          $text.style.fontFamilyFallback(['Arial']));
      expect(textShadow([const Shadow(color: Colors.black)]),
          $text.style.shadows([const Shadow(color: Colors.black)]));

      expect(bold(), $text.style.bold());
      expect(textOverflow(TextOverflow.ellipsis),
          $text.overflow(TextOverflow.ellipsis));
    });

    test('icon utilities', () {
      expect(iconSize(24.0), $icon.size(24.0));
      expect(iconColor(Colors.red), $icon.color(Colors.red));
    });

    test('padding utilities', () {
      expect(p(10), $box.padding(10));
      expect(pt(10), $box.padding.top(10));
      expect(pb(10), $box.padding.bottom(10));
      expect(pr(10), $box.padding.right(10));
      expect(pl(10), $box.padding.left(10));
      expect(ps(10), $box.padding.start(10));
      expect(pe(10), $box.padding.end(10));
      expect(px(10), $box.padding.horizontal(10));
      expect(py(10), $box.padding.vertical(10));
      expect(pi(const EdgeInsets.all(10)),
          $box.padding.as(const EdgeInsets.all(10)));
      expect(paddingInsets(const EdgeInsets.all(10)),
          $box.padding.as(const EdgeInsets.all(10)));
    });

    test('margin utilities', () {
      expect(m(10), $box.margin(10));
      expect(mt(10), $box.margin.top(10));
      expect(mb(10), $box.margin.bottom(10));
      expect(mr(10), $box.margin.right(10));
      expect(ml(10), $box.margin.left(10));
      expect(ms(10), $box.margin.start(10));
      expect(me(10), $box.margin.end(10));
      expect(mx(10), $box.margin.horizontal(10));
      expect(my(10), $box.margin.vertical(10));
      expect(mi(const EdgeInsets.all(10)),
          $box.margin.as(const EdgeInsets.all(10)));
      expect(marginTop(10), $box.margin.top(10));
      expect(marginBottom(10), $box.margin.bottom(10));
      expect(marginLeft(10), $box.margin.left(10));
      expect(marginRight(10), $box.margin.right(10));
      expect(marginStart(10), $box.margin.start(10));
      expect(marginEnd(10), $box.margin.end(10));
      expect(marginHorizontal(10), $box.margin.horizontal(10));
      expect(marginVertical(10), $box.margin.vertical(10));
      expect(marginFrom(const EdgeInsets.all(10)),
          $box.margin.as(const EdgeInsets.all(10)));
      expect(marginX(10), $box.margin.horizontal(10));
      expect(marginY(10), $box.margin.vertical(10));
      expect(marginOnly(left: 10), $box.margin.only(left: 10));
      expect(marginDirectionalOnly(start: 10), $box.margin.only(start: 10));
      expect(marginAll(10), $box.margin.all(10));
    });

    test('border radius utilities', () {
      expect(r(10), $box.borderRadius(10));
      expect(roundedTL(10), $box.borderRadius.topLeft(10));
      expect(roundedTR(10), $box.borderRadius.topRight(10));
      expect(roundedBL(10), $box.borderRadius.bottomLeft(10));
      expect(roundedBR(10), $box.borderRadius.bottomRight(10));
      expect(roundedTS(10), $box.borderRadiusDirectional.topStart(10));
      expect(roundedTE(10), $box.borderRadiusDirectional.topEnd(10));
      expect(roundedBS(10), $box.borderRadiusDirectional.bottomStart(10));
      expect(roundedBE(10), $box.borderRadiusDirectional.bottomEnd(10));
    });

    test('stack utilities', () {
      expect(zAlignment(Alignment.center), $stack.alignment(Alignment.center));
      expect(zFit(StackFit.expand), $stack.fit(StackFit.expand));
      expect(zClip(Clip.antiAlias), $stack.clipBehavior(Clip.antiAlias));
    });

    test('image utilities', () {
      expect(imageColor(Colors.red), $image.color(Colors.red));
      expect(imageColorBlendMode(BlendMode.color),
          $image.blendMode(BlendMode.color));
      expect(imageFit(BoxFit.cover), $image.fit(BoxFit.cover));
      expect(
          imageAlignment(Alignment.center), $image.alignment(Alignment.center));
      expect(imageRepeat(), $image.repeat());
      expect(imageCenterSlice(Rect.zero), $image.centerSlice(Rect.zero));
    });

    test('visibility utilities', () {
      expect(show(), visibility.on());
      expect(hide(), visibility.off());
    });

    test('text direction utility', () {
      expect(textDirection(TextDirection.ltr),
          $text.textDirection(TextDirection.ltr));
    });

    test('text width basis utility', () {
      expect(textWidthBasis(TextWidthBasis.parent),
          $text.textWidthBasis(TextWidthBasis.parent));
    });

    test('soft wrap utility', () {
      expect(softWrap(true), $text.softWrap(true));
    });

    test('text scale factor utility', () {
      expect(textScaleFactor(1.0), $text.textScaleFactor(1.0));
    });

    test('strut style utility', () {
      expect(strutStyle(height: 10), $text.strutStyle(height: 10));
    });

    test('text baseline utility', () {
      expect(textBaseline(TextBaseline.alphabetic),
          $text.style.textBaseline(TextBaseline.alphabetic));
    });

    test('squared utility', () {
      expect(squared(), $box.borderRadius.zero());
    });

    test('vertical direction utility', () {
      expect(verticalDirection(VerticalDirection.down),
          $flex.verticalDirection(VerticalDirection.down));
    });
  });
}
