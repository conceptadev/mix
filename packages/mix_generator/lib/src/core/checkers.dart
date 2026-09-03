import 'package:source_gen/source_gen.dart';

/// `MixableField` annotation from `package:mix_annotations`.
const mixableFieldAnnotationChecker = TypeChecker.fromUrl(
  'package:mix_annotations/src/annotations.dart#MixableField',
);

/// `MixableSpec` annotation from `package:mix_annotations`.
const mixableSpecAnnotationChecker = TypeChecker.fromUrl(
  'package:mix_annotations/src/annotations.dart#MixableSpec',
);

/// `Style<S>` abstract class from `package:mix`.
const styleChecker = TypeChecker.fromUrl(
  'package:mix/src/core/style.dart#Style',
);

/// `StyleSpec<S>` from `package:mix`.
const styleSpecChecker = TypeChecker.fromUrl(
  'package:mix/src/core/style_spec.dart#StyleSpec',
);

/// `Mix<T>` abstract class from `package:mix`.
// Mix is declared in mix_core and aliased by mix; TypeChecker.fromUrl matches
// the DECLARING library. Note `core.Mix<C, T>` has TWO type arguments: the
// context type first, the value type last.
const mixChecker = TypeChecker.fromUrl(
  'package:mix_core/src/mix_element.dart#Mix',
);

/// `Mixable<T>` abstract class from `package:mix`.
// Mixable is declared in mix_core and re-exported by mix; TypeChecker.fromUrl
// matches the DECLARING library, so this URL points at mix_core.
const mixableChecker = TypeChecker.fromUrl(
  'package:mix_core/src/mix_element.dart#Mixable',
);

/// `DefaultValue<T>` mixin from `package:mix`.
// DefaultValue is declared in mix_core and re-exported by mix; TypeChecker
// matches the DECLARING library.
const defaultValueChecker = TypeChecker.fromUrl(
  'package:mix_core/src/mix_element.dart#DefaultValue',
);

/// `Prop<T>` from `package:mix`.
const propChecker = TypeChecker.fromUrl('package:mix/src/core/prop.dart#Prop');

/// `WidgetModifier<T>` from `package:mix`.
const widgetModifierChecker = TypeChecker.fromUrl(
  'package:mix/src/core/widget_modifier.dart#WidgetModifier',
);

/// Flutter's `Widget` base class.
///
/// The URL is the canonical location in `package:flutter`; the `@MixWidget`
/// generator uses it to validate that a styler's `call()` returns a `Widget`
/// subtype.
const widgetChecker = TypeChecker.fromUrl(
  'package:flutter/src/widgets/framework.dart#Widget',
);

/// Flutter's `Key` class at its canonical `package:flutter/src/foundation`
/// location.
///
/// The `@MixWidget` generator uses it to recognize `Key? key` named parameters
/// on a styler's `call()` so they get forwarded via `super.key` instead of
/// surfacing as a generated constructor parameter.
const keyChecker = TypeChecker.fromUrl(
  'package:flutter/src/foundation/key.dart#Key',
);
