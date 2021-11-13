import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mixer.dart';

import '../helpers/utils.dart';

/// Defines a mix
class Mix<T extends Attribute> {
  const Mix._(this.attributes);

  final List<T> attributes;

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
  Mix<T> add([
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
    final newParams = [...attributes];
    final params = paramsToAttributes<T>(
        p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);

    // Combine attributes into existing params
    newParams.addAll(params);

    return Mix._(newParams);
  }

  Mix<T> addAll(List<T> attributes) {
    final newParams = [...this.attributes];
    newParams.addAll(attributes);
    return Mix._(newParams);
  }

  static Mix<T> fromList<T extends Attribute>(List<T> attributes) {
    return Mix._(attributes);
  }

  /// Returns a new mix by taking either a mix or attributes or both
  static Mix<T> fromMixAndAttributes<T extends Attribute>({
    Mix<T>? mix,
    List<T>? attributes,
  }) {
    if (mix == null && attributes == null) return Mix();
    if (attributes != null && mix != null) return mix.addAll(attributes);
    if (attributes != null) return Mix._(attributes);
    return mix!;
  }

  /// Merges many mixes into one
  static Mix<T> combine<T extends Attribute>([
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
    if (mix1 != null) list.addAll(mix1.attributes);
    if (mix2 != null) list.addAll(mix2.attributes);
    if (mix3 != null) list.addAll(mix3.attributes);
    if (mix4 != null) list.addAll(mix4.attributes);
    if (mix5 != null) list.addAll(mix5.attributes);
    if (mix6 != null) list.addAll(mix6.attributes);
    if (mix7 != null) list.addAll(mix7.attributes);
    if (mix8 != null) list.addAll(mix8.attributes);
    if (mix9 != null) list.addAll(mix9.attributes);
    if (mix10 != null) list.addAll(mix10.attributes);
    if (mix11 != null) list.addAll(mix11.attributes);
    if (mix12 != null) list.addAll(mix12.attributes);

    return Mix<T>._(list);
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

  Mixer build(BuildContext context) {
    return Mixer.build(context, this);
  }
}

extension MixExtension on Mix {
  Box box({
    required Widget child,
    Mix? mix,
  }) {
    final mx = Mix.combine(this, mix);
    return Box(mx, child: child);
  }

  HBox row({
    Mix? mix,
    required List<Widget> children,
  }) {
    final mx = Mix.combine(this, mix);
    return HBox(mx, children: children);
  }

  TextMix text(
    String text, {
    Mix? mix,
    Key? key,
  }) {
    final mx = Mix.combine(this, mix);
    return TextMix(mx, text: text, key: key);
  }

  VBox column({
    Mix? mix,
    required List<Widget> children,
  }) {
    final mx = Mix.combine(this, mix);
    return VBox(mx, children: children);
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
}
