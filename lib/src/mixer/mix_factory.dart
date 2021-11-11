import 'package:flutter/material.dart';
import 'package:mix/src/mixer/recipe_factory.dart';

import '../attributes/attribute.dart';
import '../helpers/utils.dart';

/// Defines a mix
class Mix {
  const Mix._(this.props);

  final List<Attribute> props;

  /// Define mix with parameters
  factory Mix([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
    Attribute? p7,
    Attribute? p8,
    Attribute? p9,
    Attribute? p10,
    Attribute? p11,
    Attribute? p12,
  ]) {
    final params =
        paramsToAttributes(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);
    return Mix._(params);
  }

  /// Adds more properties to a mix
  Mix add([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
    Attribute? p7,
    Attribute? p8,
    Attribute? p9,
    Attribute? p10,
    Attribute? p11,
    Attribute? p12,
  ]) {
    final newParams = [...props];
    // Combine attributes into existing params
    newParams.addAll(
      paramsToAttributes(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12),
    );

    return Mix._(newParams);
  }

  /// Merges many mixes into one
  static Mix combine([
    Mix? mix1,
    Mix? mix2,
    Mix? mix3,
    Mix? mix4,
    Mix? mix5,
    Mix? mix6,
    Mix? mix7,
    Mix? mix8,
    Mix? mix9,
    Mix? mix10,
    Mix? mix11,
    Mix? mix12,
  ]) {
    final list = <Attribute>[];
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
  static Mix chooser({
    required bool condition,
    required Mix trueMix,
    required Mix falseMix,
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
