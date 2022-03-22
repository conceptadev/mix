<p align="center">
  <img width="150" src="https://raw.githubusercontent.com/leoafarias/mix/main/assets/animated.svg">
</p>

---

![GitHub stars](https://img.shields.io/github/stars/leoafarias/mix?style=social)
[![Pub Version](https://img.shields.io/pub/v/mix?label=version&style=flat-square)](https://pub.dev/packages/mix/changelog)
[![Likes](https://badges.bar/mix/likes)](https://pub.dev/packages/mix/score)
[![Pub points](https://badges.bar/mix/pub%20points)](https://pub.dev/packages/mix/score) [![Github All Contributors](https://img.shields.io/github/all-contributors/leoafarias/mix?style=flat-square)](https://github.com/leoafarias/mix/graphs/contributors) [![MIT Licence](https://img.shields.io/github/license/leoafarias/mix?style=flat-square&longCache=true)](https://opensource.org/licenses/mit-license.php) [![Awesome Flutter](https://img.shields.io/badge/awesome-flutter-purple?longCache=true&style=flat-square)](https://github.com/Solido/awesome-flutter)

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

```

[Read our docs for more information](https://www.fluttermix.com)

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/leoafarias"><img src="https://avatars.githubusercontent.com/u/435833?v=4?s=50" width="50px;" alt=""/><br /><sub><b>Leo Farias</b></sub></a><br /><a href="#ideas-leoafarias" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/leoafarias/mix/commits?author=leoafarias" title="Code">💻</a> <a href="https://github.com/leoafarias/mix/commits?author=leoafarias" title="Documentation">📖</a></td>
    <td align="center"><a href="https://discord.gg/VhDsNvhbhc"><img src="https://avatars.githubusercontent.com/u/45696119?v=4?s=50" width="50px;" alt=""/><br /><sub><b>Bruno D'Luka</b></sub></a><br /><a href="https://github.com/leoafarias/mix/commits?author=bdlukaa" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/rickbsgu"><img src="https://avatars.githubusercontent.com/u/161474?v=4?s=50" width="50px;" alt=""/><br /><sub><b>Rick Berger</b></sub></a><br /><a href="https://github.com/leoafarias/mix/commits?author=rickbsgu" title="Documentation">📖</a></td>
    <td align="center"><a href="https://github.com/sbis04"><img src="https://avatars.githubusercontent.com/u/43280874?v=4?s=50" width="50px;" alt=""/><br /><sub><b>Souvik Biswas</b></sub></a><br /><a href="#content-sbis04" title="Content">🖋</a> <a href="#tutorial-sbis04" title="Tutorials">✅</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

<a href="https://vercel.com/?utm_source=fluttermix&utm_campaign=oss" target="_blank">
  <p align="center">
    <img width="210" src="https://raw.githubusercontent.com/leoafarias/mix/main/assets/powered-by-vercel.svg">
  </p>
</a>
