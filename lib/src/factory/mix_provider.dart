import 'package:flutter/material.dart';

import 'mix_provider_data.dart';

/// Context data widget for Mix data.
///
/// Inherits from [InheritedWidget] and stores [data], a value that can be
/// accessed by widgets through the static method `of()` or by ensuring it is
/// present with `ensureOf()`.
class MixProvider extends InheritedWidget {
  /// Initializes a new instance of [MixProvider].
  ///
  /// The `data` parameter is the [MixData] object to store. [child]
  /// receives the element tree that will use this context, and [key] can be set
  /// to track changes.
  const MixProvider(
    this.data, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  /// Contains the context data object.
  final MixData? data;

  /// Returns the context data from the widget tree in [context].
  ///
  /// This method returns the first instance of [MixProvider] that it finds
  /// while searching up the widget tree. Returns null if not found.
  static MixData? of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<MixProvider>();

    return widget?.data;
  }

  /// Ensures that [MixProvider] is available on the widget tree starting at
  /// the given [context].
  ///
  /// Throws an exception if [MixProvider] is not found within the given widget
  /// tree containing [context].
  static MixData ensureOf(BuildContext context) {
    final data = of(context);

    if (data == null) {
      throw Exception('MixData not found in widget tree');
    }

    return data;
  }

  @override
  bool updateShouldNotify(MixProvider oldWidget) {
    // Returns true if the `mixProvider` inside the widget has changed since
    // the last time a dependent overridden method was called.
    return data != oldWidget.data;
  }
}
