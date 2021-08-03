import 'package:flutter/material.dart';

import '../attributes/base_attribute.dart';
import '../helpers/helpers.dart';
import '../widgets/primitives/box.dart';
import '../widgets/primitives/flex_box.dart';
import '../widgets/primitives/icon.dart';
import '../widgets/primitives/text.dart';

/// Defines a mix
class Mix {
  const Mix._(this.params);
  // Exposed for performance testing
  const Mix.builder(this.params);

  final List<Attribute> params;

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
        attributeParamToList(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);
    return Mix._(params);
  }

  Box box({
    required Widget child,
    Mix? mix,
  }) {
    final mx = Mix.combine(this, mix);
    return Box(mx, child: child);
  }

  RowBox row({
    required List<Widget> children,
    Mix? mix,
  }) {
    final mx = Mix.combine(this, mix);
    return RowBox(mx, children: children);
  }

  TextMix text(
    String text, {
    Mix? mix,
    Key? key,
  }) {
    final mx = Mix.combine(this, mix);
    return TextMix(mx, text: text, key: key);
  }

  ColumnBox column({
    Mix? mix,
    required List<Widget> children,
  }) {
    final mx = Mix.combine(this, mix);
    return ColumnBox(mx, children: children);
  }

  IconMix icon(
    IconData icon, {
    Mix? mix,
    String? semanticLabel,
  }) {
    final mx = Mix.combine(this, mix);
    return IconMix(
      mx,
      icon: icon,
      semanticLabel: semanticLabel,
    );
  }

  /// Adds more attributes to the existing mix
  Mix mix([
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
    final newParams = [...params];
    // Combine attributes into existing params
    newParams.addAll(
      attributeParamToList(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12),
    );

    return Mix._(newParams);
  }

  /// Merges 2 or 3 shape definitions
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
    if (mix1 != null) list.addAll(mix1.params);
    if (mix2 != null) list.addAll(mix2.params);
    if (mix3 != null) list.addAll(mix3.params);
    if (mix4 != null) list.addAll(mix4.params);
    if (mix5 != null) list.addAll(mix5.params);
    if (mix6 != null) list.addAll(mix6.params);
    if (mix7 != null) list.addAll(mix7.params);
    if (mix8 != null) list.addAll(mix8.params);
    if (mix9 != null) list.addAll(mix9.params);
    if (mix10 != null) list.addAll(mix10.params);
    if (mix11 != null) list.addAll(mix11.params);
    if (mix12 != null) list.addAll(mix12.params);

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
}
