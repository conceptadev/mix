import 'package:flutter/material.dart';

import 'mix_context_data.dart';

/// Context data widget for Mix data.
///
/// Inherits from [InheritedWidget] and stores [mixContext], a value that can be
/// accessed by widgets through the static method `of()` or by ensuring it is
/// present with `ensureOf()`.
class MixContext extends InheritedWidget {
  /// Initializes a new instance of [MixContext].
  ///
  /// The `mixContext` parameter is the [MixData] object to store. [child]
  /// receives the element tree that will use this context, and [key] can be set
  /// to track changes.
  const MixContext(
    this.mixContext, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  /// Contains the context data object.
  final MixData? mixContext;

  /// Returns the context data from the widget tree in [context].
  ///
  /// This method returns the first instance of [MixContext] that it finds
  /// while searching up the widget tree. Returns null if not found.
  static MixData? of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<MixContext>();

    return widget?.mixContext;
  }

  /// Ensures that [MixContext] is available on the widget tree starting at
  /// the given [context].
  ///
  /// Throws an exception if [MixContext] is not found within the given widget
  /// tree containing [context].
  static MixData ensureOf(BuildContext context) {
    final data = of(context);

    if (data == null) {
      throw Exception('MixContext not found in widget tree');
    }

    return data;
  }

  @override
  bool updateShouldNotify(MixContext oldWidget) {
    // Returns true if the `mixContext` inside the widget has changed since
    // the last time a dependent overridden method was called.
    return mixContext != oldWidget.mixContext;
  }
}
