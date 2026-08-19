// The property source types live in package:mix_core, generic over an opaque
// resolution-context type `C`. These aliases bind them to [BuildContext]
// under the original public names.

import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' as core;

/// Represents the origin of a property value.
///
/// A [PropSource] is a sealed class with three concrete implementations:
/// - [ValueSource]: Holds a direct value
/// - [TokenSource]: References a token to be resolved from context
/// - [MixSource]: Contains a Mix value for accumulation merging
typedef PropSource<V> = core.PropSource<BuildContext, V>;

/// A source that holds a direct value.
typedef ValueSource<V> = core.ValueSource<BuildContext, V>;

/// A source that references a token.
///
/// The token will be resolved from `MixScope` during property resolution,
/// allowing theme-aware and context-dependent values.
typedef TokenSource<V> = core.TokenSource<BuildContext, V>;

/// A source that contains a Mix value.
///
/// Mix values support accumulation merging, where multiple Mix values
/// are combined rather than replaced during merge operations.
typedef MixSource<V> = core.MixSource<BuildContext, V>;
