import 'package:flutter/material.dart';

import 'mix_provider_data.dart';
import 'style_mix.dart';

typedef MixBuilder = Widget Function(MixData mixData);

/// Provides [MixData] to the widget tree.
class MixProvider extends InheritedWidget {
  /// Stores [MixData] and wraps a [child] widget.
  const MixProvider({required this.data, required super.child, super.key});

  /// Retrieves the nearest [MixData] from the widget tree. Returns null if not found.
  static MixData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MixProvider>()?.data;
  }

  /// Retrieves the nearest [MixData] from the widget tree. Throws if not found.
  static MixData of(BuildContext context) {
    final mixData = maybeOf(context);
    if (mixData == null) {
      throw StateError('MixProvider not found in widget tree. '
          'Ensure that Mix is present in the widget tree and try again.');
    }

    return mixData;
  }

  final MixData? data;

  @override
  bool updateShouldNotify(MixProvider oldWidget) => data != oldWidget.data;

  /// Builds a [MixProvider] widget.
  ///
  /// The [context] and [style] are used to create a [MixData] instance.
  /// The [builder] is a function that takes the created [MixData] and returns a widget.
  ///
  /// If [inherit] is set to true (default is false), the method will attempt to find the nearest
  /// [MixProvider] widget up the tree from the provided [context] and merge its [MixData] with the newly created one.
  /// This allows the new [MixProvider] widget to inherit styles from its ancestors.
  ///
  /// Returns a [MixProvider] widget with the given [MixData] and child widget built by the [builder].
  /// If [inherit] is true and a [MixProvider] widget is found up the tree, the returned [MixProvider] widget's
  /// [MixData] will be a merge of the ancestor's and the newly created one.
  static MixProvider build(
    BuildContext context, {
    required StyleMix style,
    required MixBuilder builder,
    bool inherit = false,
  }) {
    MixData mixData = MixData.create(context, style);
    if (inherit) {
      final contextMixData = MixProvider.maybeOf(context);
      if (contextMixData != null) {
        mixData = contextMixData.merge(mixData);
      }
    }

    // Returns a Mix widget with the given data and child.
    // If `inherit` is true, the data from the nearest Mix widget in the widget tree
    // (if any) is merged with the provided data.
    return MixProvider(data: mixData, child: builder(mixData));
  }
}
