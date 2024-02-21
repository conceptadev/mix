// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class FlexibleWidgetSpec extends DecoratorSpec<FlexibleWidgetSpec> {
  final int? flex;
  final FlexFit? fit;
  const FlexibleWidgetSpec({this.flex, this.fit});

  @override
  FlexibleWidgetSpec lerp(FlexibleWidgetSpec? other, double t) {
    return FlexibleWidgetSpec(
      flex: lerpInt(flex, other?.flex, t),
      fit: lerpSnap(fit, other?.fit, t),
    );
  }

  @override
  FlexibleWidgetSpec copyWith({int? flex, FlexFit? fit}) {
    return FlexibleWidgetSpec(flex: flex ?? this.flex, fit: fit ?? this.fit);
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
class FlexibleWidgetDecorator
    extends WidgetDecorator<FlexibleWidgetDecorator, FlexibleWidgetSpec> {
  final int? flex;
  final FlexFit? fit;
  const FlexibleWidgetDecorator({this.flex, this.fit});

  @override
  FlexibleWidgetDecorator merge(FlexibleWidgetDecorator? other) {
    return FlexibleWidgetDecorator(
      flex: other?.flex ?? flex,
      fit: other?.fit ?? fit,
    );
  }

  @override
  FlexibleWidgetSpec resolve(MixData mix) {
    return FlexibleWidgetSpec(flex: flex, fit: fit);
  }

  @override
  get props => [flex, fit];
}

class FlexibleDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, FlexibleWidgetDecorator> {
  const FlexibleDecoratorUtility(super.builder);
  FlexFitUtility<T> get fit => FlexFitUtility((fit) => call(fit: fit));
  IntUtility<T> get flex => IntUtility((flex) => call(flex: flex));
  T tight() => builder(const FlexibleWidgetDecorator(fit: FlexFit.tight));
  T loose() => builder(const FlexibleWidgetDecorator(fit: FlexFit.loose));
  T expanded() => tight();

  T call({int? flex, FlexFit? fit}) {
    return builder(FlexibleWidgetDecorator(flex: flex, fit: fit));
  }
}
