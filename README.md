## <img src="https://raw.githubusercontent.com/leoafarias/mix/main/assets/logo.png" alt="Mix" width="350"/><br>

An expressive way to effortlessly build design systems in Flutter.

Mix offers primitive building blocks to help developers and designers create beautiful and consistent UI.

```bash
# Important
Mix is currently being used internally to build design systems in Flutter. However, it is still in the experimental development stages. Major APIs are expected to change until the 1.0 release.
```

## Motivation & Goals

- Creating consistent custom (non-material) UI in Flutter is difficult
- Maintaining a design system is much harder than building it.
- Visual attributes should be defined outside of a widget by a composable API shared across the design system.
- Style consistently with a global theme
- Respond to changing requirements quickly
- Create adaptive layouts with ease
- Material Theme compatible

## Principles

- Development efficiency is gained by the ease of use, consistency, and reusability, not coding speed.
- Abstract Flutter API, and not modify its behavior.
- Composability should be a priority. Mixes, Attributes, Widgets, etc.
- Designer friendly (use simple standard semantics when possible)

## Examples

### Simple Mix

```dart
final squareMix = Mix(h(150), w(150));

Box(
    squareMix,
    child: Text('Square'),
);

// You can also use the following:
// This way has some downsides. More info soon...
squareMix.box(child:Text('Square'));
```

### Composability

#### Extend Mixes

```dart
final cardMix = squareMix.mix(p(20), rounded(20), bgColor(Colors.white));
```

#### Override Mixes

```dart
final redCardMix = cardMix.mix(bgColor(Colors.red));
```

#### Combine Mixes

```dart
final elevationMix = Mix(
    shadowColor(Colors.black12),
    shadowBlur(4),
    shadowOffset(0, 2),
);

Box(
    Mix.combine(cardMix, elevationMix),
    child: Text('Card With Shadow'),
);
```

#### Conditional Mixes

```dart
// If you wan't to change the Mix depending on a condition
final conditonalMix = Mix.chooser(isSelected, dynamicMix, redCardMix);
```

#### Dynamic Mixes

If you want the card to change color when in dark mode you can use a dynamic attribute.

```dart
final dynamicMix = cardMix.mix(dark(bgColor(Colors.black)));

/// Now, when the app is on dark mode the card color will change to `black`.
Box(
    dynamicMix,
    child: Text('Dynamic Card'),
);

```

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

##### ColumnMix

The equivalent of the `Column` widget. Allows you to use Mix attributes to style and build custom text widgets. It is an abstraction of `Flexbox`, so it will also accept `Box` attributes.

##### RowMix

The equivalent of the `Row` widget. Allows you to use Mix attributes to style and build custom text widgets. It is an abstraction of `Flexbox`, so it will also accept `Box` attributes.

#### TextMix

The equivalent of the Text widget. Allows you to use Mix attributes to style and build custom text widgets.

#### IconMix

The equivlent to the Icon widget. Allows to use Mix attributes to style and build custom icon widgets.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
