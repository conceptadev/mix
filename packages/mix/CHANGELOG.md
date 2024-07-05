## 2.0.0

 - Bump "mix" to `2.0.0`.

## 1.2.0

 - **FIX**: Exception when there is no children on flex (#345).
 - **FIX**: Added remaining params to callable specs and modifiers (#332).
 - **FIX**: Gap resolve SpaceToken in flex attribute (#327).
 - **FIX**: mix - Improved merge behavior between ShapeDecoration and BoxDecoration (#316).
 - **FEAT**: pressable supports keyboard events (#346).

## 1.1.3

- Improved merge behavior between ShapeDecoration and BoxDecoration
- Fixed space token resolve on gap in flex attribute
- Added remaining params to callable specs and modifiers

## 1.1.2

- Chore: Changed the class modifier of the Spec class for code generation.

## 1.1.1

- Fixed some specs not respecting nested animated.
- Added call build method to specs.

## 1.1.0

- Mix now uses mix_generator for Spec and Dto generation.
- Added missing utilities for IconSpec and ImageSpec.
- Added missing ShapeBorders.
- Improved ShapeBorderDto merge behavior.
- Bumped minimum Dart SDK to 3.0.6.
- Added animated utility to Spec.

## 1.0.0

- Revamped Mix API for improved functionality and developer experience.
- Enhanced performance and system responsiveness.
- Broadened test coverage for greater reliability.
- Extensive bug fixes for increased stability.
- Too many things to list; view our docs for more info.

Visit our documentation site for more information [https://fluttermix.com](https://fluttermix.com)

## 0.0.7

- Performance improvements.
- Bug fixes [#59](https://github.com/leoafarias/mix/issues/59) by @bdlukaa.
- InheritedAttribute - Custom Mix attributes [#94](https://github.com/leoafarias/mix/pull/94) by @pbissonho.

## 0.0.6

- Refactored MixTheme & Context Tokens.
- ZBox Widget by @.
- Headless Widgets (Experimental).
- Lots of bug fixes and performance improvements.

## 0.0.5

- Adjustments on Mix helper for applying variants and attributes.

## 0.0.4

- Optimization improvements.
- Added clip decorator.
- Fixed some bugs.

## 0.0.3

- Global Mix for reusability of design tokens and mixes across DS.
- `withMix` utility to add nested mixes and combine them.
- Attribute modifiers, create attributes that modify a widget value.

## 0.0.2

- Added screen size dynamic attribute.
- Added device orientation dynamic attribute.

## 0.0.1

- Initial release.