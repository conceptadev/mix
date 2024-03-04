// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class FlexibleDecoratorSpec extends DecoratorSpec<FlexibleDecoratorSpec> {
  final int? flex;
  final FlexFit? fit;
  const FlexibleDecoratorSpec({this.flex, this.fit});

  @override
  FlexibleDecoratorSpec lerp(FlexibleDecoratorSpec? other, double t) {
    return FlexibleDecoratorSpec(
      flex: lerpInt(flex, other?.flex, t),
      fit: lerpSnap(fit, other?.fit, t),
    );
  }

  @override
  FlexibleDecoratorSpec copyWith({int? flex, FlexFit? fit}) {
    return FlexibleDecoratorSpec(flex: flex ?? this.flex, fit: fit ?? this.fit);
  }

  @override
  get props => [flex, fit];

  @override
  Widget build(Widget child) {
    return Flexible(
      flex: flex ?? 1,
      fit: fit ?? FlexFit.loose,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with the [Flexible] widget.
///
/// The [Flexible] widget is used to create a flexible space in a [Row], [Column], or [Flex] widget.
class FlexibleDecoratorAttribute extends DecoratorAttribute<
    FlexibleDecoratorAttribute, FlexibleDecoratorSpec> {
  final int? flex;
  final FlexFit? fit;
  const FlexibleDecoratorAttribute({this.flex, this.fit});

  @override
  FlexibleDecoratorAttribute merge(FlexibleDecoratorAttribute? other) {
    return FlexibleDecoratorAttribute(
      flex: other?.flex ?? flex,
      fit: other?.fit ?? fit,
    );
  }

  @override
  FlexibleDecoratorSpec resolve(MixData mix) {
    return FlexibleDecoratorSpec(flex: flex, fit: fit);
  }

  @override
  get props => [flex, fit];
}

class FlexibleDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, FlexibleDecoratorAttribute> {
  const FlexibleDecoratorUtility(super.builder);
  FlexFitUtility<T> get fit => FlexFitUtility((fit) => call(fit: fit));
  IntUtility<T> get flex => IntUtility((flex) => call(flex: flex));
  T tight() => builder(const FlexibleDecoratorAttribute(fit: FlexFit.tight));
  T loose() => builder(const FlexibleDecoratorAttribute(fit: FlexFit.loose));
  T expanded() => tight();

  T call({int? flex, FlexFit? fit}) {
    return builder(FlexibleDecoratorAttribute(flex: flex, fit: fit));
  }
}
