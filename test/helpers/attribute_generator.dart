// Used mostly for testing

import 'dart:math';

import 'package:flutter/material.dart';

class RandomGenerator {
  const RandomGenerator._();

  static BoxConstraints boxConstraints({
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

    return BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }

  static StrutStyle strutStyle({
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    double? leading,
    bool? forceStrutHeight,
  }) {
    final random = Random();

    return StrutStyle(
      fontFamily: fontFamily ?? 'Roboto',
      fontFamilyFallback: fontFamilyFallback ?? ['Roboto'],
      fontSize: fontSize ?? random.nextDouble() * 20,
      height: height ?? random.nextDouble() * 20,
      leading: leading ?? random.nextDouble() * 20,
      fontWeight: fontWeight ?? FontWeight.values.random(),
      fontStyle: fontStyle ?? FontStyle.values.random(),
      forceStrutHeight: forceStrutHeight ?? random.nextBool(),
    );
  }

  static EdgeInsets edgeInsets({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    final random = Random();

    return EdgeInsets.only(
      left: left ?? random.nextDouble() * 20,
      top: top ?? random.nextDouble() * 20,
      right: right ?? random.nextDouble() * 20,
      bottom: bottom ?? random.nextDouble() * 20,
    );
  }

  static EdgeInsetsDirectional edgeInsetsDirectional({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) {
    final random = Random();

    return EdgeInsetsDirectional.only(
      start: start ?? random.nextDouble() * 20,
      top: top ?? random.nextDouble() * 20,
      end: end ?? random.nextDouble() * 20,
      bottom: bottom ?? random.nextDouble() * 20,
    );
  }

  static Matrix4 matrix4({double? x, double? y, double? z}) {
    final random = Random();

    return Matrix4.translationValues(
      x ?? random.nextDouble() * 20,
      y ?? random.nextDouble() * 20,
      z ?? random.nextDouble() * 20,
    );
  }

  static BorderRadius borderRadius({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BorderRadius.only(
      topLeft: RandomGenerator.radius(topLeft),
      topRight: RandomGenerator.radius(topRight),
      bottomLeft: RandomGenerator.radius(bottomLeft),
      bottomRight: RandomGenerator.radius(bottomRight),
    );
  }

  static BorderRadiusDirectional borderDirectionalRadius({
    double? topStart,
    double? topEnd,
    double? bottomStart,
    double? bottomEnd,
  }) {
    return BorderRadiusDirectional.only(
      topStart: RandomGenerator.radius(topStart),
      topEnd: RandomGenerator.radius(topEnd),
      bottomStart: RandomGenerator.radius(bottomStart),
      bottomEnd: RandomGenerator.radius(bottomEnd),
    );
  }

  static Radius radius([double? radius]) {
    return Radius.circular(radius ?? Random().nextDouble() * 20);
  }

  static Border border({
    BorderSide? left,
    BorderSide? right,
    BorderSide? top,
    BorderSide? bottom,
  }) {
    return Border(
      top: top ?? RandomGenerator.borderSide(),
      right: right ?? RandomGenerator.borderSide(),
      bottom: bottom ?? RandomGenerator.borderSide(),
      left: left ?? RandomGenerator.borderSide(),
    );
  }

  static BorderSide borderSide({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderSide(
      color: color ?? RandomGenerator.color(),
      width: width ?? Random().nextDouble() * 4,
      style: style ?? BorderStyle.values.random(),
    );
  }

  static BorderDirectional borderDirectional({
    BorderSide? top,
    BorderSide? bottom,
    BorderSide? start,
    BorderSide? end,
  }) {
    return BorderDirectional(
      top: top ?? RandomGenerator.borderSide(),
      start: start ?? RandomGenerator.borderSide(),
      end: end ?? RandomGenerator.borderSide(),
      bottom: bottom ?? RandomGenerator.borderSide(),
    );
  }

  static Color color([Color? color]) {
    return color ??
        Color.fromARGB(
          255,
          Random().nextInt(255),
          Random().nextInt(255),
          Random().nextInt(255),
        );
  }

  static Shadow shadow({Color? color, Offset? offset, double? blurRadius}) {
    return Shadow(
      color: color ?? RandomGenerator.color(),
      offset: offset ?? const Offset(0, 0),
      blurRadius: blurRadius ?? Random().nextDouble() * 4,
    );
  }

  static Alignment alignment([Alignment? alignment]) {
    return alignment ??
        Random().randomElement([
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
  }

  static AlignmentDirectional alignmentDirectional([AlignmentDirectional? alignment]) {
    return alignment ??
        Random().randomElement([
          AlignmentDirectional.center,
          AlignmentDirectional.centerStart,
          AlignmentDirectional.centerEnd,
          AlignmentDirectional.topCenter,
          AlignmentDirectional.topStart,
          AlignmentDirectional.topEnd,
          AlignmentDirectional.bottomCenter,
          AlignmentDirectional.bottomStart,
          AlignmentDirectional.bottomEnd,
        ]);
  }

  static BoxDecoration boxDecoration({
    Color? color,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    BoxShape? shape,
    Gradient? gradient,
  }) {
    final boxShadowList = boxShadow ?? [RandomGenerator.boxShadow()];

    return BoxDecoration(
      color: color ?? RandomGenerator.color(),
      border: border ?? RandomGenerator.border(),
      borderRadius: borderRadius ?? RandomGenerator.borderRadius(),
      boxShadow: boxShadowList,
      gradient: gradient ?? RandomGenerator.linearGradient(),
      shape: shape ?? BoxShape.values.random(),
    );
  }

  static Offset offset({double? dx, double? dy}) {
    return Offset(
      dx ?? Random().nextDouble() * 20,
      dy ?? Random().nextDouble() * 20,
    );
  }

  static BoxShadow boxShadow({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return BoxShadow(
      color: color ?? RandomGenerator.color(),
      offset: offset ?? RandomGenerator.offset(),
      blurRadius: blurRadius ?? Random().nextMaxDouble(10),
      spreadRadius: spreadRadius ?? Random().nextMaxDouble(10),
    );
  }

  static LinearGradient linearGradient({
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    List<Color>? colors,
    List<double>? stops,
    TileMode? tileMode,
  }) {
    return LinearGradient(
      begin: begin ?? RandomGenerator.alignment(),
      end: end ?? RandomGenerator.alignment(),
      colors: colors ?? [RandomGenerator.color()],
      stops: stops ?? [Random().nextDouble()],
      tileMode: tileMode ?? TileMode.values.random(),
    );
  }

  TextOverflow textOverflow([TextOverflow? overflow]) {
    return overflow ?? TextOverflow.values.random();
  }

  Axis axis([Axis? axis]) {
    return axis ?? Random().randomElement(Axis.values);
  }

  MainAxisAlignment mainAxisAlignment([MainAxisAlignment? alignment]) {
    return alignment ?? MainAxisAlignment.values.random();
  }

  MainAxisSize mainAxisSize([MainAxisSize? size]) {
    return size ?? MainAxisSize.values.random();
  }

  CrossAxisAlignment crossAxisAlignment([CrossAxisAlignment? alignment]) {
    return alignment ?? CrossAxisAlignment.values.random();
  }

  TextBaseline textBaseline([TextBaseline? baseline]) {
    return baseline ?? TextBaseline.values.random();
  }

  VerticalDirection verticalDirection([VerticalDirection? direction]) {
    return direction ?? VerticalDirection.values.random();
  }

  TextStyle textStyle() {
    final shadows = [
      RandomGenerator.shadow(),
      RandomGenerator.shadow(),
      RandomGenerator.shadow(),
    ];

    return TextStyle(
      color: RandomGenerator.color(),
      backgroundColor: RandomGenerator.color(),
      fontSize: Random().nextDoubleInRange(12, 32),
      fontWeight: FontWeight.values.random(),
      fontStyle: FontStyle.values.random(),
      letterSpacing: Random().nextDoubleInRange(0, 2),
      wordSpacing: Random().nextDoubleInRange(0, 2),
      height: Random().nextDoubleInRange(0, 2),
      locale: const Locale('en', 'US'),
      shadows: shadows,
      decoration: [
        TextDecoration.none,
        TextDecoration.underline,
        TextDecoration.lineThrough,
        TextDecoration.overline,
      ].random(),
      decorationColor: RandomGenerator.color(),
      decorationStyle: TextDecorationStyle.values.random(),
      fontFamily: 'Roboto',
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
