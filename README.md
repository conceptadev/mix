<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/leoafarias/mix/main/assets/dark.svg">
  <img alt="Mix logo" src="https://raw.githubusercontent.com/leoafarias/mix/main/assets/light.svg">
</picture>

---

![GitHub stars](https://img.shields.io/github/stars/conceptadev/mix?style=for-the-badge&logo=GitHub&logoColor=black&labelColor=white&color=dddddd)
[![Pub Version](https://img.shields.io/pub/v/mix?label=version&style=for-the-badge)](https://pub.dev/packages/mix/changelog)
![Pub Likes](https://img.shields.io/pub/likes/mix?label=Pub%20Likes&style=for-the-badge)
![Pub Points](https://img.shields.io/pub/points/mix?label=Pub%20Points&style=for-the-badge) [![Github All Contributors](https://img.shields.io/github/all-contributors/leoafarias/mix?style=for-the-badge)](https://github.com/leoafarias/mix/graphs/contributors) [![MIT Licence](https://img.shields.io/github/license/leoafarias/mix?style=for-the-badge&longCache=true)](https://opensource.org/licenses/mit-license.php) [![Awesome Flutter](https://img.shields.io/badge/awesome-flutter-purple?longCache=true&style=for-the-badge)](https://github.com/Solido/awesome-flutter)

Build Flutter design systems expressively and effortlessly. **Mix** offers primitive building blocks to help developers and designers create beautiful UI with confidence.

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

final style = Style(
  height(150),
  width(150),
);

// Use in a Box widget
Box
  style:style,
  child:Child(),
);

```

[Read our docs for more information](https://www.fluttermix.com)

## Contributors

<a href="https://github.com/conceptadev/mix/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=conceptadev/mix" />
</a>
