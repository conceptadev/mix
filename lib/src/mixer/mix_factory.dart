import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/helpers/helper.utils.dart';
import 'package:mix/src/helpers/utils.dart';
import 'package:mix/src/mixer/mixer.dart';

/// Defines a mix
class Mix<T extends Attribute> {
  const Mix._(List<T> attributes) : _attributes = attributes;

  final List<T> _attributes;

  List<T> get attributes {
    return spreadNestedAttributes(_attributes);
  }

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
    final params = <T>[];
    if (p1 != null) params.add(p1);
    if (p2 != null) params.add(p2);
    if (p3 != null) params.add(p3);
    if (p4 != null) params.add(p4);
    if (p5 != null) params.add(p5);
    if (p6 != null) params.add(p6);
    if (p7 != null) params.add(p7);
    if (p8 != null) params.add(p8);
    if (p9 != null) params.add(p9);
    if (p10 != null) params.add(p10);
    if (p11 != null) params.add(p11);
    if (p12 != null) params.add(p12);

    return Mix._(params);
  }

  /// Adds more properties to a mix
  PositionalParamFn<T, Mix<T>> get add {
    return WrapFunction(addAll).withPositionalToList;
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
  static Mix<T> combineAll<T extends Attribute>(List<Mix<T>> mixes) {
    final attributes = mixes.expand((element) => element.attributes).toList();
    return Mix._(attributes);
  }

  /// Merges many mixes into one
  static Mix<T> combine<T extends Attribute>([
    Mix<T>? mix1,
    Mix<T>? mix2,
    Mix<T>? mix3,
    Mix<T>? mix4,
    Mix<T>? mix5,
    Mix<T>? mix6,
  ]) {
    final list = <T>[];
    if (mix1 != null) list.addAll(mix1.attributes);
    if (mix2 != null) list.addAll(mix2.attributes);
    if (mix3 != null) list.addAll(mix3.attributes);
    if (mix4 != null) list.addAll(mix4.attributes);
    if (mix5 != null) list.addAll(mix5.attributes);
    if (mix6 != null) list.addAll(mix6.attributes);

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
  Mix mix(Mix mix) {
    return Mix.combineAll([this, mix]);
  }

  Mix maybeMix(Mix? mix) {
    if (mix == null) return this;
    return Mix.combineAll([this, mix]);
  }

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
