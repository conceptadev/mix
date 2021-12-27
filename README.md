<p align="center">
  <img width="150" src="https://raw.githubusercontent.com/leoafarias/mix/main/assets/animated.svg">
</p>

---

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-4-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

Build Flutter design systems expressively and effortlessly. **Mix** offers primitive building blocks to help developers and designers create beautiful UI with confidence.

**Important**

```text
Mix is currently being used internally to build design systems in Flutter.
It is still in heavy development. Major APIs are expected to change until the 1.0 release.
```

## Motivation

Flutter favors [composition](https://docs.flutter.dev/resources/architectural-overview#composition) over inheritance when building widgets. This choice keeps Flutter API extremely easy to interact with and powerful.

However, in our experience, both inheritance and composition are essential when defining presentation attributes. [Themes](https://docs.flutter.dev/cookbook/design/themes) are an excellent example of inheritance but are not extended across all visual properties.

When building a design system, it can be challenging to develop and maintain a consistent UI that shares the same design language for widget variations or across different widgets within the design system.

> Maintaining a design system is much harder than building it.

## Goals

Provide simple API to compose design and layout attributes for widgets. That can easily be extended, overridden, and combined; we call this a **Mix**.

- Visual attributes should be defined outside of a BuildContext by a composable API shared across the design system.
- Style consistently with a global context
- Allow to respond to changing requirements quickly
- Create adaptive designs and layouts with ease

## Principles

- **Abstract Flutter API, and not modify its behavior.**
- Development efficiency is gained by the ease of use, consistency, and reusability, not coding speed.
- Composability should be a priority. Mixes, Attributes, Widgets, etc.
- Designer friendly (use simple standard semantics when possible).

## Usage

### Simple Mix

```dart
import 'package:mix/mix.dart';

final squareMix = Mix(
  height(150),
  width(150),
);

// Use in a Box widget
Box
  mix:squareMix,
  child:Child(),
);

// You can also use the following:
// This way has some downsides. More info soon...
squareMix.box(child:Child());
```

### Composability

#### Extend Mixes

```dart
final cardMix = squareMix.mix(
  padding(20),
  rounded(20),
  bgColor(Colors.white),
);
```

#### Override Mixes

```dart
final redCardMix = cardMix.mix(
  bgColor(Colors.red),
);
```

#### Combine Mixes

```dart
final elevationMix = Mix(
    elevation(2),
);

Box(
    mix: Mix.combine(cardMix, elevationMix),
    child: Text('Card With Shadow'),
);
```

#### Conditional Mixes

```dart
// If you wan't to change the Mix depending on a condition
final conditonalMix = Mix.chooser(
  condition: isSelected,
  trueMix: dynamicMix,
  falseMix: redCardMix,
);
```

#### Variants

If you want the card to change color when in dark mode you can use variants.

```dart
final cardWithDarkMode = cardMix.mix(
  dark(
    bgColor(Colors.black),
  ),
);

/// Now, when the app is on dark mode the card color will change to `black`.
Box(
    mix: cardWithDarkMode,
    child: Text('Dynamic Card'),
);

```

You can also leverage media query context values

```dart
// Adaptive gutter for your flex widgets using media query
final flexMix = Mix(
  mainAxis.center,
  gap(10),
  medium(gap(15)),
  large(gap(40)),
);
```

#### Attribute Modifiers

Allows to modify the output of a value that is passed in an attribute. Text formatting is a great example of this where you want certain types of text to format as titleCase, sentenceCase, capitalize, lowercase.

Using attribute modifiers you can apply this on the Mix level and not worry about working with individual inputs.

```dart
// Whenever the h1 mix is used it will always format as a titleCase. The content "This is the headline" will become "This Is The Headline" when used within a TextMix widget.
final h1 = Mix(
  titleCase(),
  fontSize(48),
);
```

## APIs

Documentation is currently in progress. For now you can find some of the available utilities.

## Concepts

Here are some high-level concepts to understand how Mix works and to allow for you to get started.

### Attributes

These are the features or characteristics of certain widgets. Most attributes map out to layout, visual widgets, or widget styling itself. Attributes are primitives which get translated into their Flutter API.

### Dynamic Attributes

Attributes can be dynamic, which means they only are applied in case a condition is met. This allows for the creation of Atributes that can be used depending on the widget's `BuildContext`.

### Utilities

These are classes whose primary purpose is providing a better API for Attributes.

Not required for building Mixes; however, make a cleaner API possible and overall better development experience.

### Mixes

Combination or `mix` of Attributes. Mixes are passed to Widgets and translated into the widget's properties.

Mixes can be reused across multiple widgets and also combine, extended, and overridden.

### Mixer Widgets

These are the building block for your design system. You can easily build new widgets that take advantage of Mixes; however, there are some primitives provided.

#### Box

Similar to a `Container` with some slight adjustments for a better development experience.

#### Flexbox

The equivalent of the Flex widgets (Flex, Row, Column). Allow for the use of flex Attributes, and wrap them in a `Box` to use box attributes for composability.

#### TextMix

The equivalent of the Text widget. Allows you to use Mix attributes to style and build custom text widgets.

#### IconMix

The equivlent to the Icon widget. Allows to use Mix attributes to style and build custom icon widgets.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
