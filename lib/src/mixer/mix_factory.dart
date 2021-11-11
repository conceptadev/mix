import 'package:flutter/material.dart';
import 'package:mix/src/mixer/recipe_factory.dart';

import '../attributes/attribute.dart';
import '../helpers/utils.dart';

/// Defines a mix
class Mix<T extends Attribute> {
  const Mix._(this.props);

  final List<T> props;

  /// Define mix with parameters
  factory Mix([
    T? p1,
    T? p2,
    T? p3,
    T? p4,
    T? p5,
    T? p6,
    T? p7,
    T? p8,
    T? p9,
    T? p10,
    T? p11,
    T? p12,
  ]) {
    final params =
        paramsToAttributes(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);
    return Mix._(params);
  }

  /// Adds more properties to a mix
  Mix add([
    T? p1,
    T? p2,
    T? p3,
    T? p4,
    T? p5,
    T? p6,
    T? p7,
    T? p8,
    T? p9,
    T? p10,
    T? p11,
    T? p12,
  ]) {
    final newParams = [...props];
    // Combine attributes into existing params
    newParams.addAll(
      paramsToAttributes<T>(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12),
    );

    return Mix._(newParams);
  }

  /// Merges many mixes into one
  static Mix combine<T extends Attribute>([
    Mix<T>? mix1,
    Mix<T>? mix2,
    Mix<T>? mix3,
    Mix<T>? mix4,
    Mix<T>? mix5,
    Mix<T>? mix6,
    Mix<T>? mix7,
    Mix<T>? mix8,
    Mix<T>? mix9,
    Mix<T>? mix10,
    Mix<T>? mix11,
    Mix<T>? mix12,
  ]) {
    final list = <T>[];
    if (mix1 != null) list.addAll(mix1.props);
    if (mix2 != null) list.addAll(mix2.props);
    if (mix3 != null) list.addAll(mix3.props);
    if (mix4 != null) list.addAll(mix4.props);
    if (mix5 != null) list.addAll(mix5.props);
    if (mix6 != null) list.addAll(mix6.props);
    if (mix7 != null) list.addAll(mix7.props);
    if (mix8 != null) list.addAll(mix8.props);
    if (mix9 != null) list.addAll(mix9.props);
    if (mix10 != null) list.addAll(mix10.props);
    if (mix11 != null) list.addAll(mix11.props);
    if (mix12 != null) list.addAll(mix12.props);

    return Mix._(list);
  }

  /// Chooses mix based on condition
  static Mix chooser<T extends Attribute>({
    required bool condition,
    required Mix<T> trueMix,
    required Mix<T> falseMix,
  }) {
    if (condition) {
      return trueMix;
    } else {
      return falseMix;
    }
  }

  Recipe build(BuildContext context) {
    return Recipe.build(context, this);
  }
}
