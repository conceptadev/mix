// Used mostly for testing

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/constraints/constraints_dto.dart';
import 'package:mix/src/attributes/decoration/decoration_dto.dart';
import 'package:mix/src/attributes/spacing/spacing_dto.dart';
import 'package:mix/src/attributes/text_style/text_style_dto.dart';

class AttributeGenerator {
  const AttributeGenerator();

  PaddingAttribute padding({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    final random = Random();

    return PaddingAttribute.only(
      top: top ?? random.nextDouble() * 20,
      bottom: bottom ?? random.nextDouble() * 20,
      left: left ?? random.nextDouble() * 20,
      right: right ?? random.nextDouble() * 20,
    );
  }

  BoxConstraintsDto boxConstraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final random = Random();

    minWidth ??= random.nextDouble() * 200;
    minHeight ??= random.nextDouble() * 200;

    maxHeight ??= minWidth + random.nextDouble() * 200;
    maxWidth ??= minHeight + random.nextDouble() * 200;

    return BoxConstraintsDto(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }

  MarginAttribute margin({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    final random = Random();

    return MarginAttribute.only(
      top: top ?? random.nextDouble() * 20,
      bottom: bottom ?? random.nextDouble() * 20,
      left: left ?? random.nextDouble() * 20,
      right: right ?? random.nextDouble() * 20,
    );
  }

  SpacingDto spacing({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    final random = Random();

    return SpacingDto(
      top: top ?? random.nextDouble() * 20,
      bottom: bottom ?? random.nextDouble() * 20,
      left: left ?? random.nextDouble() * 20,
      right: right ?? random.nextDouble() * 20,
    );
  }

  TransformAttribute transformAttribute({
    double? x,
    double? y,
    double? z,
  }) {
    final random = Random();

    return Matrix4.translationValues(
      x ?? random.nextDouble() * 20,
      y ?? random.nextDouble() * 20,
      z ?? random.nextDouble() * 20,
    ).toAttribute();
  }

  TextOverflow textOverflow([TextOverflow? overflow]) {
    return overflow ??
        Random().randomElement([
          TextOverflow.clip,
          TextOverflow.visible,
        ]);
  }

  Axis axis([Axis? axis]) {
    return axis ??
        Random().randomElement([
          Axis.horizontal,
          Axis.vertical,
        ]);
  }

  MainAxisAlignment mainAxisAlignment([MainAxisAlignment? alignment]) {
    return alignment ??
        Random().randomElement([
          MainAxisAlignment.start,
          MainAxisAlignment.end,
          MainAxisAlignment.center,
          MainAxisAlignment.spaceBetween,
          MainAxisAlignment.spaceAround,
          MainAxisAlignment.spaceEvenly,
        ]);
  }

  MainAxisSize mainAxisSize([MainAxisSize? size]) {
    return size ??
        Random().randomElement([
          MainAxisSize.max,
          MainAxisSize.min,
        ]);
  }

  CrossAxisAlignment crossAxisAlignment([CrossAxisAlignment? alignment]) {
    return alignment ??
        Random().randomElement([
          CrossAxisAlignment.start,
          CrossAxisAlignment.end,
          CrossAxisAlignment.center,
          CrossAxisAlignment.stretch,
          CrossAxisAlignment.baseline,
        ]);
  }

  TextBaseline textBaseline([TextBaseline? baseline]) {
    return baseline ??
        Random().randomElement([
          TextBaseline.alphabetic,
          TextBaseline.ideographic,
        ]);
  }

  VerticalDirection verticalDirection([VerticalDirection? direction]) {
    return direction ??
        Random().randomElement([
          VerticalDirection.down,
          VerticalDirection.up,
        ]);
  }

  BorderRadiusGeometryDto borderRadius({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    final random = Random();

    return BorderRadiusGeometryDto(
      topLeft: Radius.circular(topLeft ?? random.nextDouble() * 20),
      topRight: Radius.circular(topRight ?? random.nextDouble() * 20),
      bottomLeft: Radius.circular(bottomLeft ?? random.nextDouble() * 20),
      bottomRight: Radius.circular(bottomRight ?? random.nextDouble() * 20),
    );
  }

  BorderRadiusGeometryDto borderRadiusDirectional({
    double? topStart,
    double? topEnd,
    double? bottomStart,
    double? bottomEnd,
  }) {
    final random = Random();

    return BorderRadiusGeometryDto(
      topStart: Radius.circular(topStart ?? random.nextDouble() * 20),
      topEnd: Radius.circular(topEnd ?? random.nextDouble() * 20),
      bottomStart: Radius.circular(bottomStart ?? random.nextDouble() * 20),
      bottomEnd: Radius.circular(bottomEnd ?? random.nextDouble() * 20),
    );
  }

  BoxBorderDto border({
    BorderSideDto? left,
    BorderSideDto? right,
    BorderSideDto? top,
    BorderSideDto? bottom,
  }) {
    return BoxBorderDto(
      left: left ?? borderSide(),
      right: right ?? borderSide(),
      top: top ?? borderSide(),
      bottom: bottom ?? borderSide(),
    );
  }

  ColorDto color([Color? color]) {
    return ColorDto(
      color ??
          Color.fromARGB(
            255,
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255),
          ),
    );
  }

  BorderSideDto borderSide({
    ColorDto? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderSideDto(
      color: color ?? this.color(),
      width: width ?? Random().nextDouble() * 4,
      style: style ?? BorderStyle.values.random(),
    );
  }

  ShadowDto shadow({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
  }) {
    return ShadowDto(
      color: color ?? this.color(),
      offset: offset ?? const Offset(0, 0),
      blurRadius: blurRadius ?? Random().nextDouble() * 4,
    );
  }

  AlignmentGeometryAttribute alignment() {
    return Random().randomElement([
      Alignment.center,
      Alignment.centerLeft,
      Alignment.centerRight,
      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.bottomCenter,
      Alignment.bottomLeft,
      Alignment.bottomRight,
    ]).toAttribute();
  }

  BoxDecorationDto boxDecoration({
    ColorDto? color,
    BoxBorderDto? border,
    BorderRadiusGeometryDto? borderRadius,
    List<BoxShadowDto>? boxShadow,
    BoxShape? shape,
  }) {
    return BoxDecorationDto(
      color: color ?? this.color(),
      border: border ?? this.border(),
      borderRadius: borderRadius ?? this.borderRadius(),
      boxShadow: boxShadow ??
          [
            this.boxShadow(),
          ],
      shape: shape ?? BoxShape.values.random(),
    );
  }

  BoxShadowDto boxShadow({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return BoxShadowDto(
      color: color ?? this.color(),
      offset: offset ??
          Offset(
            Random().nextMaxDouble(10),
            Random().nextMaxDouble(10),
          ),
      blurRadius: blurRadius ?? Random().nextMaxDouble(10),
      spreadRadius: spreadRadius ?? Random().nextMaxDouble(10),
    );
  }

  TextStyleDto textStyle() {
    return TextStyleDto.only(
      color: color(),
      backgroundColor: color(),
      decorationColor: color(),
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
        shadow(),
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
