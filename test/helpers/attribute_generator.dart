// Used mostly for testing

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class AttributeGenerator {
  const AttributeGenerator();

  PaddingAttribute padding({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    final random = Random();

    return PaddingAttribute(
      top: top ?? random.nextDouble() * 20,
      bottom: bottom ?? random.nextDouble() * 20,
      left: left ?? random.nextDouble() * 20,
      right: right ?? random.nextDouble() * 20,
    );
  }

  BoxConstraintsAttribute boxConstraints({
    double? width,
    double? height,
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

    return BoxConstraintsAttribute(
      width: width,
      height: height,
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

    return MarginAttribute(
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

  ClipBehaviorAttribute clipBehaviorAttribute([Clip? clip]) {
    return clip?.toAttribute() ??
        Random().randomElement([
          Clip.none,
          Clip.antiAlias,
          Clip.antiAliasWithSaveLayer,
          Clip.hardEdge,
        ]).toAttribute();
  }

  TextOverflow textOverflow([TextOverflow? overflow]) {
    return overflow ??
        Random().randomElement([
          TextOverflow.clip,
          TextOverflow.visible,
        ]);
  }

  TextDirection textDirection([TextDirection? direction]) {
    return direction ??
        Random().randomElement([
          TextDirection.ltr,
          TextDirection.rtl,
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

  BorderRadiusAttribute borderRadius({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    final random = Random();

    return BorderRadiusAttribute(
      topLeft: Radius.circular(topLeft ?? random.nextDouble() * 20),
      topRight: Radius.circular(topRight ?? random.nextDouble() * 20),
      bottomLeft: Radius.circular(bottomLeft ?? random.nextDouble() * 20),
      bottomRight: Radius.circular(bottomRight ?? random.nextDouble() * 20),
    );
  }

  BorderRadiusDirectionalAttribute borderRadiusDirectional({
    double? topStart,
    double? topEnd,
    double? bottomStart,
    double? bottomEnd,
  }) {
    final random = Random();

    return BorderRadiusDirectionalAttribute(
      topStart: Radius.circular(topStart ?? random.nextDouble() * 20),
      topEnd: Radius.circular(topEnd ?? random.nextDouble() * 20),
      bottomStart: Radius.circular(bottomStart ?? random.nextDouble() * 20),
      bottomEnd: Radius.circular(bottomEnd ?? random.nextDouble() * 20),
    );
  }

  BorderAttribute border({
    BorderSideAttribute? left,
    BorderSideAttribute? right,
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
  }) {
    return BorderAttribute(
      left: left ?? borderSide(),
      right: right ?? borderSide(),
      top: top ?? borderSide(),
      bottom: bottom ?? borderSide(),
    );
  }

  ColorAttribute color([Color? color]) {
    return ColorAttribute(
      color ??
          Color.fromARGB(
            255,
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255),
          ),
    );
  }

  BorderSideAttribute borderSide({
    ColorAttribute? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderSideAttribute(
      color: color ?? this.color(),
      width: width ?? Random().nextDouble() * 4,
      style: style ?? BorderStyle.values.random(),
    );
  }

  ShadowAttribute shadow({
    ColorAttribute? color,
    Offset? offset,
    double? blurRadius,
  }) {
    return ShadowAttribute(
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

  BoxDecorationAttribute boxDecoration({
    ColorAttribute? color,
    BorderAttribute? border,
    BorderRadiusAttribute? borderRadius,
    List<BoxShadowAttribute>? boxShadow,
    BoxShape? shape,
  }) {
    return BoxDecorationAttribute(
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

  BoxShadowAttribute boxShadow({
    ColorAttribute? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return BoxShadowAttribute(
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

  TextStyleAttribute textStyle() {
    return TextStyleAttribute.only(
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
