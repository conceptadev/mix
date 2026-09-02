import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' as core;

import 'spec.dart';

export 'spec.dart' show Equatable, propsDiff, propsEquals, propsHash;

/// Unified base class for widget modifiers.
///
/// Provides a common interface for widget modifications that can be applied
/// to styled elements in the Mix framework. Inherits value equality from
/// `Spec<T> with Equatable` — concrete modifiers only supply [props].
abstract class WidgetModifier<Self extends WidgetModifier<Self>>
    extends Spec<Self>
    implements core.NodeModifier<Widget> {
  const WidgetModifier();

  /// Builds the modified widget by wrapping or transforming [child].
  @override
  Widget build(Widget child);
}
