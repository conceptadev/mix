import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/helpers/helper.utils.dart';
import 'package:mix/src/widgets/box.widget.dart';
import 'package:mix/src/widgets/flex.widget.dart';
import 'package:mix/src/widgets/icon.widget.dart';
import 'package:mix/src/widgets/pressable.widget.dart';
import 'package:mix/src/widgets/text.widget.dart';

/// Defines a mix
class Mix<T extends Attribute> {
  final List<T> attributes;

  const Mix._([this.attributes = const []]);

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

  const Mix.fromList(this.attributes);

  factory Mix.fromMaybeList(List<T?> attributes) {
    final validAttributes = attributes.whereType<T>();
    return Mix._(validAttributes.toList());
  }

  Mix<T> clone() {
    return Mix._([...attributes]);
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

  /// Used for const constructor widgets
  static const Mix constant = Mix._();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mix<T> && listEquals(other.attributes, attributes);
  }

  @override
  int get hashCode => attributes.hashCode;
}

extension MixExtension<T extends Attribute> on Mix<T> {
  /// Adds more properties to a mix

  WrapFunction<T, Mix<T>> get mix {
    return WrapFunction(addList);
  }

  @deprecated
  WrapFunction<T, Mix<T>> get add {
    return mix;
  }

  Mix<T> addList(List<T> attributes) {
    return Mix._([...this.attributes, ...attributes]);
  }

  Mix<T> apply(Mix<T> mix) {
    return Mix.combineAll([this, mix]);
  }

  Mix<T> applyMaybe(Mix<T>? mix) {
    if (mix == null) return this;
    return Mix.combineAll([this, mix]);
  }

  Box box({
    Mix? overrideMix,
    required Widget child,
  }) {
    final mx = Mix.combine(this, overrideMix);
    return Box(mix: mx, child: child);
  }

  HBox hbox({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    final mix = Mix.combine(this, overrideMix);
    return HBox(mix: mix, children: children);
  }

  Pressable _pressable({
    required Widget child,
    Mix? overrideMix,
    void Function()? onPressed,
    void Function()? onLongPressed,
  }) {
    final mx = Mix.combine(this, overrideMix);
    return Pressable(
      mix: mx,
      child: child,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
    );
  }

  PressableWidgetFn get pressable {
    return _pressable;
  }

  HBox row({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    return hbox(
      overrideMix: overrideMix,
      children: children,
    );
  }

  TextMix text(
    String text, {
    Mix? overrideMix,
  }) {
    final mix = Mix.combine(this, overrideMix);
    return TextMix(text, mix: mix);
  }

  VBox vbox({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    final mix = Mix.combine(this, overrideMix);
    return VBox(mix: mix, children: children);
  }

  VBox column({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    return vbox(
      children: children,
      overrideMix: overrideMix,
    );
  }

  IconMix icon(
    IconData icon, {
    Mix? overrideMix,
  }) {
    final mx = Mix.combine(this, overrideMix);
    return IconMix(
      mix: mx,
      icon: icon,
    );
  }
}

typedef PressableWidgetFn = Pressable Function({
  required Widget child,
  Mix? overrideMix,
  void Function()? onPressed,
  void Function()? onLongPressed,
});
