import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// Defines a mix
/// {@category Mix Object}
class Mix<T extends Attribute> {
  final List<T> attributes;

  /// These are the `Variants` that will be passed to `MixContext` in order to be applied for this mix
  final List<Variant<T>> variantToApply;

  const Mix._(
    this.attributes, {
    this.variantToApply = const [],
  });

  /// Instantiate a mix with _Attribute_ parameters
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

  /// Instantiate a mix from a _List_ of _Attribute_ instances (cannot be null)
  const Mix.fromList(
    this.attributes, {
    this.variantToApply = const [],
  });

  /// Instantiate a mix from a _List_ of _Attribute_ instances
  /// (_attributes_ argument can be null)
  factory Mix.fromMaybeList(List<T?> attributes) {
    final validAttributes = attributes.whereType<T>();
    return Mix.fromList(validAttributes.toList());
  }

  Mix<T> clone() {
    return copyWith();
  }

  get isEmpty {
    return attributes.isEmpty && variantToApply.isEmpty;
  }

  Mix<T> copyWith({
    List<T> attributes = const [],
    List<Variant<T>> variantToApply = const [],
  }) {
    return Mix._(
      [...this.attributes, ...attributes],
      variantToApply: [...this.variantToApply, ...variantToApply],
    );
  }

  /// Returns a new mix instance from this instance with the
  /// _Variant_ instance added
  Mix<T> withVariant(Variant<T> variant) {
    return copyWith(
      attributes: attributes,
      variantToApply: [variant],
    );
  }

  /// Same as _withVariant_, but the argument is nullable
  Mix<T> withMaybeVariant(Variant<T>? variant) {
    if (variant == null) return this;
    return withVariant(variant);
  }

  /// Same as _withVariant_, but can accept a _List_ of _Variant_ instances
  Mix<T> withVariants(List<Variant<T>> variants) {
    return copyWith(
      attributes: attributes,
      variantToApply: variants,
    );
  }

  Mix<T> withMaybeVariants(List<Variant<T>>? variants) {
    if (variants == null || variants.isEmpty) return this;
    return withVariants(variants);
  }

  /// Same as _combine_, but accepts a _List_ of _Mix_ instances
  static Mix<T> combineAll<T extends Attribute>(List<Mix<T>> mixes) {
    final attributes = mixes.expand((element) => element.attributes).toList();
    final variantToApply =
        mixes.expand((element) => element.variantToApply).toList();

    return Mix._(
      attributes,
      variantToApply: variantToApply,
    );
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
    final attributes = <T>[];
    final variants = <Variant<T>>[];
    if (mix1 != null) {
      attributes.addAll(mix1.attributes);
      variants.addAll(mix1.variantToApply);
    }

    if (mix2 != null) {
      attributes.addAll(mix2.attributes);
      variants.addAll(mix2.variantToApply);
    }

    if (mix3 != null) {
      attributes.addAll(mix3.attributes);
      variants.addAll(mix3.variantToApply);
    }

    if (mix4 != null) {
      attributes.addAll(mix4.attributes);
      variants.addAll(mix4.variantToApply);
    }

    if (mix5 != null) {
      attributes.addAll(mix5.attributes);
      variants.addAll(mix5.variantToApply);
    }

    if (mix6 != null) {
      attributes.addAll(mix6.attributes);
      variants.addAll(mix6.variantToApply);
    }

    return Mix._(attributes, variantToApply: variants);
  }

  /// Chooses mix based on condition
  static Mix<T> chooser<T extends Attribute>({
    required bool condition,
    required Mix<T> ifTrue,
    required Mix<T> ifFalse,
  }) {
    if (condition) {
      return ifTrue;
    } else {
      return ifFalse;
    }
  }

  static Mix<T> variantSwitcher<T extends Attribute>(
    Mix<T> mix,
    Map<bool, Variant<T>> cases,
  ) {
    final keys = cases.keys.toList();
    final values = cases.values.toList();

    List<Variant<T>> variants = [];

    for (var i = 0; i < keys.length; i++) {
      if (keys[i]) {
        variants.add(values[i]);
      }
    }

    return mix.withVariants(variants);
  }

  /// Used for const constructor widgets
  /// @nodoc
  static const Mix constant = Mix._([]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mix<T> &&
        listEquals(other.attributes, attributes) &&
        listEquals(other.variantToApply, variantToApply);
  }

  @override
  int get hashCode => attributes.hashCode ^ variantToApply.hashCode;
}

/// @nodoc
extension MixExtension<T extends Attribute> on Mix<T> {
  /// Adds an Attribute to a Mix
  WrapFunction<T, Mix<T>> get mix {
    return WrapFunction(addAttributes);
  }

  /// Adds a list of attributes to a Mix
  Mix<T> addAttributes(List<T> attributes) {
    return copyWith(attributes: attributes);
  }

  /// Combines argument mix with this mix.
  Mix<T> apply(Mix<T> mix) {
    return Mix.combineAll([this, mix]);
  }

  /// Like apply, but the argument mix is nullable
  Mix<T> applyMaybe(Mix<T>? mix) {
    if (mix == null) return this;
    return apply(mix);
  }

  /// @nodoc
  Box box({
    Mix? overrideMix,
    required Widget child,
  }) {
    final mx = Mix.combine(this, overrideMix);
    return Box(mix: mx, child: child);
  }

  /// @nodoc
  HBox hbox({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    final mix = Mix.combine(this, overrideMix);
    return HBox(mix: mix, children: children);
  }

  /// @nodoc
  HBox row({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    return hbox(
      overrideMix: overrideMix,
      children: children,
    );
  }

  /// @nodoc
  TextMix text(
    String text, {
    Mix? overrideMix,
  }) {
    final mix = Mix.combine(this, overrideMix);
    return TextMix(text, mix: mix);
  }

  /// @nodoc
  VBox vbox({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    final mix = Mix.combine(this, overrideMix);
    return VBox(mix: mix, children: children);
  }

  /// @nodoc
  VBox column({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    return vbox(
      children: children,
      overrideMix: overrideMix,
    );
  }

  /// @nodoc
  IconMix icon(
    IconData icon, {
    Mix? overrideMix,
  }) {
    final mx = Mix.combine(this, overrideMix);
    return IconMix(
      icon,
      mix: mx,
    );
  }
}
