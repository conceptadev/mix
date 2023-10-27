// Used mostly for testing

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/container.attribute.dart';
import 'package:mix/src/attributes/text_style.attribute.dart';
import 'package:mix/src/factory/style_mix.dart';

class RandomGenerator {
  const RandomGenerator._();
  static TextAttributes textAttributes() {
    return TextAttributes.from(
      textAlign: TextAlign.values.random(),
      softWrap: Random().nextBool(),
      overflow: TextOverflow.values.random(),
      textWidthBasis: TextWidthBasis.values.random(),
      textHeightBehavior: const TextHeightBehavior(),
      directives: [
        const UppercaseDirective(),
        const LowercaseDirective(),
        const CapitalizeDirective(),
        const SentenceCaseDirective(),
      ],
    );
  }

  static StyleMix mix() {
    return StyleMix(
      textAttributes(),
      textAttributes(),
      boxAttributes(),
      boxAttributes(),
    );
  }

  static ContainerAttributes boxAttributes({
    bool someNullable = true,
  }) {
    final margin = edgeInsetsDto();

    final padding = edgeInsetsDto();

    final alignment = Random().randomElement([
      Alignment.center,
      Alignment.centerLeft,
      Alignment.centerRight,
      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.bottomCenter,
      Alignment.bottomLeft,
      Alignment.bottomRight,
    ]);

    final height = Random().nextMaxDouble(500);

    final width = Random().nextMaxDouble(500);

    final color = colorDto();

    final border = borderDto();

    final borderRadius = borderRadiusDto();

    final boxShadow = [
      boxShadowDto(),
      boxShadowDto(),
      boxShadowDto(),
      boxShadowDto(),
    ];

    const maxHeight = 500.0;

    final minHeight = Random().nextMaxDouble(maxHeight);

    const maxWidth = 500.0;

    final minWidth = Random().nextMaxDouble(maxWidth);

    final shape = Random().randomElement(BoxShape.values);

    final boxAttributes = ContainerAttributes(
      margin: margin,
      padding: padding,
      alignment: alignment,
      height: height,
      width: width,
      color: colorScheme.background,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      maxHeight: maxHeight,
      minHeight: minHeight,
      maxWidth: maxWidth,
      minWidth: minWidth,
      shape: shape,
    );

    if (someNullable) {
      return StyledContainerAttributes(
        margin: Random().nextBool() ? margin : null,
        padding: Random().nextBool() ? padding : null,
        alignment: Random().nextBool() ? alignment : null,
        height: Random().nextBool() ? height : null,
        width: Random().nextBool() ? width : null,
        color: Random().nextBool() ? color : null,
        border: Random().nextBool() ? border : null,
        borderRadius: Random().nextBool() ? borderRadius : null,
        boxShadow: Random().nextBool() ? boxShadow : null,
        maxHeight: Random().nextBool() ? maxHeight : null,
        minHeight: Random().nextBool() ? minHeight : null,
        maxWidth: Random().nextBool() ? maxWidth : null,
        minWidth: Random().nextBool() ? minWidth : null,
        shape: Random().nextBool() ? shape : null,
      );
    }

    return boxAttributes;
  }

  static List<StyledContainerAttributes> boxAttributesList({
    int length = 10,
    bool someNullable = true,
  }) {
    return List.generate(
        length, (_) => boxAttributes(someNullable: someNullable));
  }

  static SpaceGeometryDto edgeInsetsDto() {
    final random = Random();

    return SpaceGeometryDto.only(
      top: random.nextDouble() * 100,
      bottom: random.nextDouble() * 100,
      left: random.nextDouble() * 100,
      right: random.nextDouble() * 100,
    );
  }

  static BorderRadiusDto borderRadiusDto() {
    final random = Random();

    return BorderRadiusDto.only(
      topLeft: RadiusDto.circular(random.nextDouble() * 20),
      topRight: RadiusDto.circular(random.nextDouble() * 20),
      bottomLeft: RadiusDto.circular(random.nextDouble() * 20),
      bottomRight: RadiusDto.circular(random.nextDouble() * 20),
    );
  }

  static BorderDto borderDto() {
    final side = borderSideDto();

    return BorderDto.only(
      top: side,
      right: side,
      bottom: side,
      left: side,
    );
  }

  static ColorDto colorDto() {
    return ColorDto(
      Color.fromARGB(
        255,
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
      ),
    );
  }

  static BorderSideDto borderSideDto() {
    return BorderSideDto(
      color: colorDto(),
      width: Random().nextDouble() * 4,
      style: BorderStyle.values.random(),
    );
  }

  static ShadowRef shadowDto() {
    return ShadowRef(
      color: colorDto(),
      offset: Offset(
        Random().nextMaxDouble(10),
        Random().nextMaxDouble(10),
      ),
      blurRadius: Random().nextMaxDouble(10),
    );
  }

  static BoxShadowRef boxShadowDto() {
    // Use shadow as a starting point
    final shadow = shadowDto();

    return BoxShadowRef(
      color: shadow.color,
      offset: shadow.offset,
      blurRadius: shadow.blurRadius,
      spreadRadius: Random().nextMaxDouble(10),
    );
  }

  static TextStyleAttribute textStyleDto() {
    return TextStyleAttribute(
      color: colorDto(),
      backgroundColor: colorDto(),
      decorationColor: colorDto(),
      decorationStyle: TextDecorationStyle.values.random(),
      fontFamily: 'Roboto',
      fontSize: Random().nextDoubleInRange(12, 32),
      fontStyle: FontStyle.values.random(),
      fontWeight: FontWeight.values.random(),
      letterSpacing: Random().nextDoubleInRange(0, 2),
      wordSpacing: Random().nextDoubleInRange(0, 2),
      height: Random().nextDoubleInRange(0, 2),
      locale: const Locale('en', 'US'),
      shadows: [
        shadowDto(),
        shadowDto(),
        shadowDto(),
        shadowDto(),
      ],
      decoration: [
        TextDecoration.none,
        TextDecoration.underline,
        TextDecoration.lineThrough,
        TextDecoration.overline,
      ].random(),
    );
  }
}

extension RandomExt on Random {
  T randomElement<T>(List<T> list) {
    if (list.isEmpty) throw StateError('List is empty');

    return list[nextInt(list.length)];
  }

  T? randomElementOrNull<T>(List<T> list) {
    return list.isEmpty ? null : randomElement(list);
  }

  T randomElementOr<T>(List<T> list, T or) {
    return list.isEmpty ? or : randomElement(list);
  }

  double nextDoubleInRange(double min, double max) {
    return min + nextDouble() * (max - min);
  }

  int nextIntInRange(int min, int max) {
    return min + nextInt(max - min);
  }

  // Returns a double within the max value range.
  double nextMaxDouble(double max) {
    return nextDoubleInRange(0, max);
  }
}

extension ListRandomExt<T> on List<T> {
  T random() {
    return Random().randomElement(this);
  }
}
