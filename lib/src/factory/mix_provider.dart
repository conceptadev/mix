// ignore_for_file: prefer-widget-private-members

import 'package:flutter/material.dart';

import '../attributes/variant_attribute.dart';
import '../theme/mix_theme.dart';
import 'exports.dart';

typedef MixBuilder = Widget Function(MixData mixData);

/// Context data widget for Mix data.
///
/// Inherits from [InheritedWidget] and stores [data], a value that can be
/// accessed by widgets through the static method `of()` or by ensuring it is
/// present with `ensureOf()`.
class Mix extends InheritedWidget {
  /// Initializes a new instance of [Mix].
  ///
  /// The `data` parameter is the [MixData] object to store. [child]
  /// receives the element tree that will use this context, and [key] can be set
  /// to track changes.
  const Mix({required this.data, required super.child, super.key});

  /// Returns the context data from the widget tree in [context].
  ///
  /// This method returns the first instance of [Mix] that it finds
  /// while searching up the widget tree. Returns null if not found.
  static MixData? maybeOf(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<Mix>();

    return widget?.data;
  }

  /// Ensures that [Mix] is available on the widget tree starting at
  /// the given [context].
  ///
  /// Throws an exception if [Mix] is not found within the given widget
  /// tree containing [context].
  static MixData of(BuildContext context) {
    final mixData = maybeOf(context);

    if (mixData == null) {
      throw Exception('MixProvider not found in widget tree');
    }

    return mixData;
  }

  /// Contains the context data object.
  final MixData? data;

  @override
  bool updateShouldNotify(Mix oldWidget) {
    // Returns true if the `mixProvider` inside the widget has changed since
    // the last time a dependent overridden method was called.
    return data != oldWidget.data;
  }

  static build(BuildContext context, StyleMix style, MixBuilder builder) {
    final values = applyContextVariants(style.values, context);

    final data = MixData(
      resolver: BuildContextResolver(context),
      styles: values.styles,
    );

    return Mix(data: data, child: builder(data));
  }
}

MixValues applyContextVariants(MixValues values, BuildContext context) {
  MixValues mergedValues = MixValues.empty.copyWith(
    styles: values.styles,
    variants: values.variants,
  );

  final unusedContextVariants = <ContextVariantAttribute>[];

  final contextVariants = values.variants.contextVariants;

  for (ContextVariantAttribute variant in contextVariants) {
    final shouldApply = variant.shouldApply(context);
    if (shouldApply) {
      mergedValues = mergedValues.merge(variant.value);
    } else {
      unusedContextVariants.add(variant);
    }
  }

  final unusedValues = MixValues.create(unusedContextVariants);

  // ignore: avoid-unnecessary-reassignment
  mergedValues = mergedValues.merge(unusedValues);

  return contextVariants.length == unusedContextVariants.length
      ? mergedValues
      // ignore: avoid-recursive-calls
      : applyContextVariants(mergedValues, context);
}
