/// Platform-agnostic styling engine primitives for Mix.
///
/// Pure Dart — no Flutter or `dart:ui` dependency. The resolution context is
/// an opaque type parameter `C`: package:mix binds `C = BuildContext`, while
/// terminal or web (Jaspr) styling packages bind their own context types.
library;

export 'src/breakpoint.dart';
export 'src/converter_registry.dart';
export 'src/deep_collection_equality.dart';
export 'src/directive.dart';
export 'src/equatable.dart';
export 'src/mix_element.dart';
export 'src/modifier.dart';
export 'src/ops.dart';
export 'src/prop.dart';
export 'src/prop_source.dart';
export 'src/spec.dart';
export 'src/style.dart';
export 'src/token.dart';
export 'src/token_store.dart';
export 'src/variant.dart';
