// ignore_for_file: deprecated_member_use_from_same_package

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

  group('Deprecated Mix Extension', () {
    test('apply should call Style.combine', () {
      final style = Style();
      final otherStyle = Style();

      expect(style.apply(otherStyle), Style.combine([style, otherStyle]));
    });

    test('withManyVariants should call applyVariants', () {
      final style = Style();
      final variants = [const Variant('test1'), const Variant('test2')];

      expect(style.withManyVariants(variants), style.applyVariants(variants));
    });
  });

  group('Deprecated utilities', () {
    test('TextMix should pass style and other properties to StyledText', () {
      final mix = Style();
      const locale = Locale('en', 'US');

      final textMix = TextMix(
        'Hello',
        mix: mix,
        inherit: false,
        locale: locale,
      );

      expect(textMix.style, mix);
      expect(textMix.inherit, false);
      expect(textMix.locale, locale);
    });

    test('IconMix should pass style and other properties to StyledIcon', () {
      final mix = Style();
      const icon = Icons.add;
      const textDirection = TextDirection.ltr;

      final iconMix = IconMix(
        icon,
        mix: mix,
        inherit: false,
        textDirection: textDirection,
      );

      expect(iconMix.style, mix);
      expect(iconMix.inherit, false);
      expect(iconMix.textDirection, textDirection);
    });

    test('ClipDecoratorUtility should provide access to clip utilities', () {
      const clipDecorator = ClipDecoratorUtility();

      expect(clipDecorator.path, isA<ClipPathUtility>());
      expect(clipDecorator.oval, isA<ClipOvalUtility>());
      expect(clipDecorator.rect, isA<ClipRectUtility>());
      expect(clipDecorator.rrect, isA<ClipRRectUtility>());
      expect(clipDecorator.triangle, isA<ClipTriangleUtility>());
    });
  });

  test('padding utilities', () {
    expect(paddingTop(10), $box.padding.top(10));
    expect(paddingBottom(10), $box.padding.bottom(10));
    expect(paddingLeft(10), $box.padding.left(10));
    expect(paddingRight(10), $box.padding.right(10));
    expect(paddingStart(10), $box.padding.start(10));
    expect(paddingEnd(10), $box.padding.end(10));
    expect(paddingHorizontal(10), $box.padding.horizontal(10));
    expect(paddingVertical(10), $box.padding.vertical(10));
    expect(paddingFrom(const EdgeInsets.all(10)),
        $box.padding.as(const EdgeInsets.all(10)));
    expect(paddingX(10), $box.padding.horizontal(10));
    expect(paddingY(10), $box.padding.vertical(10));
    expect(paddingOnly(left: 10), $box.padding.only(left: 10));
    expect(paddingDirectionalOnly(start: 10), $box.padding.only(start: 10));
    expect(paddingAll(10), $box.padding.all(10));
  });

  test('border utilities', () {
    expect(borderTop(width: 2), $box.border.top(width: 2));
    expect(borderBottom(width: 2), $box.border.bottom(width: 2));
    expect(borderLeft(width: 2), $box.border.left(width: 2));
    expect(borderRight(width: 2), $box.border.right(width: 2));
    expect(borderStart(width: 2), $box.borderDirectional.start(width: 2));
    expect(borderEnd(width: 2), $box.borderDirectional.end(width: 2));
    expect(borderHorizontal(width: 2), $box.border.horizontal(width: 2));
    expect(borderVertical(width: 2), $box.border.vertical(width: 2));
    expect(borderAll(width: 2), $box.border.all(width: 2));
  });

  test('screen size utilities', () {
    expect(xsmall(), $on.xsmall());
    expect(small(), $on.small());
    expect(medium(), $on.medium());
    expect(large(), $on.large());
  });

  test('theme utilities', () {
    expect(dark(), $on.dark());
    expect(light(), $on.light());
  });

  test('interaction utilities', () {
    expect(hover(), $on.hover());
    expect(focus(), $on.focus());
    expect(onFocus(), $on.focus());
    expect(onPressed(), $on.press());
    expect(onLongPressed(), $on.longPress());
    expect(onHover(), $on.hover());
    expect(onEnabled(), $on.enabled());
    expect(onDisabled(), $on.disabled());
    expect(onfocus(), $on.focus());
    expect(onMouseHover, $on.hover.event);
    expect(press(), $on.press());
    expect(onPress(), $on.press());
  });

  test('orientation utilities', () {
    expect(portrait(), $on.portrait());
    expect(landscape(), $on.landscape());
    expect(onPortrait(), $on.portrait());
    expect(onLandscape(), $on.landscape());
  });

  test('state utilities', () {
    expect(disabled(), $on.disabled());
    expect(enabled(), $on.enabled());
    expect(onEnabled(), $on.enabled());
    expect(onDisabled(), $on.disabled());
  });

  test('direction utilities', () {
    expect(onRTL(), $on.rtl());
    expect(onLTR(), $on.ltr());
  });

  test('not utility', () {
    expect(not, $on.not);
  });

  test('text directive utilities', () {
    expect(directives, $text.directive);
    expect(directive, $text.directive);
  });

  test('locale utility', () {
    expect(locale(const Locale('en', 'US')),
        $text.style.locale(const Locale('en', 'US')));
  });

  test('max lines utility', () {
    expect(maxLines(3), $text.maxLines(3));
  });

  test('text align utility', () {
    expect(textAlign(TextAlign.center), $text.textAlign(TextAlign.center));
  });

  test('text shadow utility', () {
    expect(
        shadow(color: Colors.black), $text.style.shadow(color: Colors.black));
  });

  test('flex direction utility', () {
    expect(flexDirection(Axis.horizontal), $flex.direction(Axis.horizontal));
  });

  test('flex utility', () {
    expect(flex, $flex);
  });

  test('border utility', () {
    expect(border(width: 2), $box.border(width: 2));
  });

  test('border directional utility', () {
    expect(borderDirectional.only(start: const BorderSideDto(width: 2)),
        $box.borderDirectional.only(start: const BorderSideDto(width: 2)));
  });

  test('border radius utility', () {
    expect(borderRadius(10), $box.borderRadius(10));
  });

  test('border radius directional utility', () {
    expect(borderRadiusDirectional.only(topStart: const Radius.circular(4)),
        $box.borderRadiusDirectional.only(topStart: const Radius.circular(4)));
  });

  test('background color utility', () {
    expect(backgroundColor(Colors.red), $box.color(Colors.red));
  });

  test('width utility', () {
    expect(width(100), $box.width(100));
  });

  test('height utility', () {
    expect(height(100), $box.height(100));
  });

  test('min height utility', () {
    expect(minHeight(100), $box.minHeight(100));
  });

  test('max height utility', () {
    expect(maxHeight(100), $box.maxHeight(100));
  });

  test('min width utility', () {
    expect(minWidth(100), $box.minWidth(100));
  });

  test('max width utility', () {
    expect(maxWidth(100), $box.maxWidth(100));
  });

  test('padding utility', () {
    expect(padding(10), $box.padding(10));
  });

  test('margin utility', () {
    expect(margin(10), $box.margin(10));
  });

  test('alignment utility', () {
    expect(alignment(Alignment.center), $box.alignment(Alignment.center));
  });

  test('clip behavior utility', () {
    expect(clipBehavior(Clip.antiAlias), $box.clipBehavior(Clip.antiAlias));
  });

  test('elevation utility', () {
    expect(elevation(4), $box.elevation(4));
  });

  test('radial gradient utility', () {
    expect(radialGradient(colors: [Colors.red, Colors.blue]),
        $box.radialGradient(colors: [Colors.red, Colors.blue]));
  });

  test('linear gradient utility', () {
    expect(linearGradient(colors: [Colors.red, Colors.blue]),
        $box.linearGradient(colors: [Colors.red, Colors.blue]));
  });

  test('box utility', () {
    expect(box, $box);
  });

  test('intrinsic width utility', () {
    expect(intrinsicWidth(), $with.intrinsicWidth());
  });

  test('intrinsic height utility', () {
    expect(intrinsicHeight(), $with.intrinsicHeight());
  });

  test('scale utility', () {
    expect(scale(2), $with.scale(2));
  });

  test('opacity utility', () {
    expect(opacity(0.5), $with.opacity(0.5));
  });

  test('rotate utility', () {
    expect(rotate(45), $with.rotate(45));
  });

  test('clip path utility', () {
    expect(clipPath(clipper: const _CustomClipper()),
        $with.clipPath(clipper: const _CustomClipper()));
  });

  test('clip rrect utility', () {
    expect(clipRRect(borderRadius: BorderRadius.circular(10)),
        $with.clipRRect(borderRadius: BorderRadius.circular(10)));
  });

  test('clip oval utility', () {
    expect(clipOval(), $with.clipOval());
  });

  test('clip rect utility', () {
    expect(clipRect(clipper: const _CustomRectClipper()),
        $with.clipRect(clipper: const _CustomRectClipper()));
  });

  test('clip triangle utility', () {
    expect(clipTriangle(), $with.clipTriangle());
  });

  test('radius token utility', () {
    expect($radius, $token.radius);
  });

  test('space token utility', () {
    expect($space, $token.space);
  });

  test('color token utility', () {
    expect($color, $token.color);
  });

  test('breakpoint token utility', () {
    expect($breakpoint, $token.breakpoint);
  });

  test('text style token utility', () {
    expect($textStyle, $token.textStyle);
  });

  test('aspect ratio utility', () {
    expect(aspectRatio(1.5), $with.aspectRatio(1.5));
  });

  test('flexible utility', () {
    expect(flexible(flex: 1), $with.flexible(flex: 1));
  });

  test('transform utility', () {
    expect(transform(Matrix4.rotationZ(0.1)),
        $with.transform(Matrix4.rotationZ(0.1)));
  });

  test('align utility', () {
    expect(align(alignment: Alignment.center),
        $with.align(alignment: Alignment.center));
  });

  test('fractionally sized box utility', () {
    expect(fractionallySizedBox(widthFactor: 0.5),
        $with.fractionallySizedBox(widthFactor: 0.5));
  });

  test('sized box utility', () {
    expect(sizedBox(width: 100, height: 100),
        $with.sizedBox(width: 100, height: 100));
  });
}

class _CustomClipper extends CustomClipper<Path> {
  const _CustomClipper();

  @override
  Path getClip(Size size) {
    return Path();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _CustomRectClipper extends CustomClipper<Rect> {
  const _CustomRectClipper();

  @override
  Rect getClip(Size size) {
    return Rect.zero;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
