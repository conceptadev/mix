// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class SizedBoxDecoratorSpec extends DecoratorSpec<SizedBoxDecoratorSpec> {
  final double? width;
  final double? height;

  const SizedBoxDecoratorSpec({this.width, this.height});

  @override
  SizedBoxDecoratorSpec lerp(SizedBoxDecoratorSpec? other, double t) {
    return SizedBoxDecoratorSpec(
      width: lerpDouble(width, other?.width, t),
      height: lerpDouble(height, other?.height, t),
    );
  }

  @override
  SizedBoxDecoratorSpec copyWith({double? width, double? height}) {
    return SizedBoxDecoratorSpec(
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  get props => [width, height];

  @override
  Widget build(Widget child) {
    return SizedBox(width: width, height: height, child: child);
  }
}

class SizedBoxDecoratorAttribute extends DecoratorAttribute<
    SizedBoxDecoratorAttribute, SizedBoxDecoratorSpec> {
  final double? width;
  final double? height;

  const SizedBoxDecoratorAttribute({this.width, this.height});

  @override
  SizedBoxDecoratorSpec resolve(MixData mix) {
    return SizedBoxDecoratorSpec(width: width, height: height);
  }

  @override
  SizedBoxDecoratorAttribute merge(SizedBoxDecoratorAttribute? other) {
    return SizedBoxDecoratorAttribute(
      width: other?.width ?? width,
      height: other?.height ?? height,
    );
  }

  @override
  get props => [width, height];
}

class SizedBoxDecoratorUtility<T extends Attribute>
    extends MixUtility<T, SizedBoxDecoratorAttribute> {
  const SizedBoxDecoratorUtility(super.builder);

  T call({double? width, double? height}) {
    return builder(SizedBoxDecoratorAttribute(width: width, height: height));
  }
}
