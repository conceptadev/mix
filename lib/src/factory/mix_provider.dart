// ignore_for_file: prefer-widget-private-members

import 'package:flutter/material.dart';

import 'mix_provider_data.dart';
import 'style_mix.dart';

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
    return context.dependOnInheritedWidgetOfExactType<Mix>()?.data;
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

  static Mix build(
    BuildContext context, {
    required StyleMix style,
    required MixBuilder builder,
    bool inherit = false,
  }) {
    MixData mixData = MixData.create(context, style);
    if (inherit) {
      final contextMixData = Mix.maybeOf(context);
      if (contextMixData != null) {
        mixData = contextMixData.merge(mixData);
      }
    }

    return Mix(data: mixData, child: builder(mixData));
  }
}
