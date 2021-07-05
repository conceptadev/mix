## <img src="https://raw.githubusercontent.com/leoafarias/mix/main/assets/logo.png" alt="Mix" width="350"/><br>

An expressive way to build design systems effortlessly in Flutter.

Mix offers primitive building blocks to help developers and designers create beautiful, and consistent UI.

## Motivation & Goals

- Creating consistent custom (non-material) UI in Flutter is difficult
- Maintaining a design system is much harder than building it.
- Visual attributes should be defined outside of a widget by a Fully composable API, to be shared across the design system.

- Style consistently with a global theme
- Respond to changing requirements quickly
- Create adaptive layouts with ease
- Material Theme compatible

## Principles

- Development efficiency is gained by easy of use, consistency and reusability, not coding speed.
- Abstract Flutter API, and not modify its behavior.
- Composability should be a priority. Mixes, Attributes, Widgets and etc.
- Designer friendly (use simple common semantics when possible)

## Concepts

Here are some high level concepts to understand how Mix works and to allow for you to get started.

### Attributes

These are features, or characteristics of certain widgets. Most attributes map out to layout, visual widgets, or widget styling itself. Attributes are primtives which get translated into their Flutter API.

### Dynamic Attributes

Attributes can be dynamic, which means they only are applied in case a condition is met. This allows for the creation of Atributes that can be used depending on the widget's `BuildContext`.

### Utilities

These are classes that its main purpose is providing a better API for Attributes.

Utilities are not required for building Mixes, however make a cleaner API possible and overall better development experience.

### Mixes

Combination or `mix` of Attributes. Mixes are what is passed to Widgets to be translated into the widgets properties.

Mixes can be reused across multiple widgets, and also combine, extended and overidden.

- Creating a Mix
- Extend & override a Mix
- Combine Mixes
- Conditional Mixes

#### Creating a Mix

```dart
// Create a Mix
final cardMx = Mix(p(20), rounded(10)));

// Extend a Mix
final darkMx = cardMix.mix(bgColor(Colors.black));

// Override a Mix
final selectedMx = darkMx.mix(p(40), bgColor(Colors.green));

// Combine Mixes
final squareMx = Mix(h(100), w(100));

final squareCardMx = Mix.combine(cardMx, squareMx);

// Conditional Mixes
// If you wan't to change the Mix depending on a condition
final conditonalMix = Mix.chooser(isSelected, selectedMx, cardMx);
```

### Mixer Widgets

These are the building block for your design system. You can easily build new widgets that take advantage of Mixes, however there are some primitives provided.

#### Box

This behaves similar to a `Container` with some small adjustments for better development experience.

#### Flexbox

The equivalent of the Flex widgets (Flex, Row, Column). Allow for the use of flex Attributes, while also them in a Box if box attributes are used.
