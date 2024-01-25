<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/leoafarias/mix/main/assets/dark.svg">
  <img alt="Mix logo" src="https://raw.githubusercontent.com/leoafarias/mix/main/assets/light.svg">
</picture>

---

![GitHub stars](https://img.shields.io/github/stars/conceptadev/mix?style=for-the-badge&logo=GitHub&logoColor=black&labelColor=white&color=dddddd)
[![Pub Version](https://img.shields.io/pub/v/mix?label=version&style=for-the-badge)](https://pub.dev/packages/mix/changelog)
![Pub Likes](https://img.shields.io/pub/likes/mix?label=Pub%20Likes&style=for-the-badge)
![Pub Points](https://img.shields.io/pub/points/mix?label=Pub%20Points&style=for-the-badge) [![Github All Contributors](https://img.shields.io/github/all-contributors/leoafarias/mix?style=for-the-badge)](https://github.com/leoafarias/mix/graphs/contributors) [![MIT Licence](https://img.shields.io/github/license/leoafarias/mix?style=for-the-badge&longCache=true)](https://opensource.org/licenses/mit-license.php) [![Awesome Flutter](https://img.shields.io/badge/awesome-flutter-purple?longCache=true&style=for-the-badge)](https://github.com/Solido/awesome-flutter)

![og](https://github.com/conceptadev/mix/assets/435833/4a88bae6-706a-424d-ab24-079eda6db92f)

## Read about our 1.0 Beta release [here](https://github.com/conceptadev/mix/releases/tag/v1.0.0-beta.1)

Mix offers a novel approach to styling in Flutter, targeting the specific challenges developers encounter with traditional methods. It emphasizes the separation of presentation from logic, akin to the division of HTML and CSS in web development, ensuring maintainable and readable code.

- **Comprehensive Styling**: By extending beyond Flutter's theme system, Mix for composability across broader range of visual properties. This comprehensive approach guarantees consistent styling across all widgets, including custom ones.

- **Streamlined Code Structure**: Mix reduces the need for inline styling and resolves the complexity associated with subclassing and widget composition. Its advanced features facilitate a clean, organized, and efficient codebase.

## Why Mix?

- **Separation of Concerns**: Mix distinctly separates styling from widget logic. This not only enhances code clarity but also makes the UI design process more intuitive and efficient.

- **Flexible and Modular Styling**: Through its compositional approach, Mix allows for the creation of complex styles from simple, reusable elements. This promotes modularity and flexibility, making UI development faster and more scalable.

- **Enhanced Custom Widget Support**: Addressing the limitations of ThemeData, Mix ensures that custom widgets receive the same level of styling support as standard Flutter widgets, maintaining a unified aesthetic throughout the application.

**Mix offers primitive building blocks to help developers create beautiful and consistent UI.**

## Goals

Provide simple API to compose design and layout attributes for widgets. That can easily be extended, overridden, and combined; we call this a **Mix**.

- Visual attributes should be defined outside of a BuildContext by a composable API shared across the design system.
- Style consistently with a global context
- Allow to respond to changing requirements quickly
- Create adaptive designs and layouts with ease

## Principles

- **Abstract Flutter API, and not modify its behavior.**
- Development efficiency is gained by the ease of use, consistency, and reusability, not coding speed.
- Composability should be a priority. Styles, Attributes, Variants, etc.
- Designer friendly (use simple standard semantics when possible).

## Key Features

### Powerful Style Semantics

Mix's compositional approach allows for the creation of complex styles from simple, reusable elements. This promotes modularity and flexibility, making UI development faster and more scalable.

### First-Class Variant Support

As a first-class feature, Variants in Mix enable the design of flexible and composable widget styling. They can be applied both conditionally and responsively for dynamic UI adaptation.

### Design Tokens & Theming

Inspired by constraint-based design principles projects like [Theme UI](https://theme-ui.com/), and [Styled System](https://github.com/styled-system/styled-system), Mix's theming system allows for definition of style properties that can be used across any widget. This ensures consistent styling across the entire application.

### Utility-First

Mix style attributes consist of simple and reusable functions, allowing for complete control over the styling API while also facilitating easy customization and extension of its API

### Developer experience

Mix is designed to optimize developer experience, offering an intuitive, efficient, and flexible framework for Flutter UI design, significantly enhancing productivity and creativity.

[Read our docs for more information](https://www.fluttermix.com)

## Contributors

<a href="https://github.com/conceptadev/mix/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=conceptadev/mix" />
</a>
