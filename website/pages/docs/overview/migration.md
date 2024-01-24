# Migration Guide

## 0.0.7 to 1.0.0

In our pursuit of API usability and efficiency, we introduced several deprecations in the latest Mix Package versions. When encountering issues not covered by deprecation notices, please [open an issue or send a PR to our deprecation file](https://github.com/conceptadev/mix/blob/main/lib/src/deprecations.dart).

### Deprecations

The major updates are:

#### `Mix` Class Renaming

The `Mix` class is now `Style`. Several methods in the renamed class, including `withVariants`, `withManyVariants` among others, are deprecated to boost performance and reduce potential confusion.

#### Widget Updates

`TextMix` and `IconMix` widgets are deprecated. Use `StyledText` and `StyledIcon` respectively.

#### Short Aliases

To enhance readability, short aliases and shorthand property/method names are replaced with fully named counterparts.

#### Decorators

Decorators' order was previously determined by their addition sequence. Now, we enforce specific ordering but also allow customizable orders. This might cause behavior changes in rare cases. For details, refer to the [decorators guide](https://fluttermix.com/docs/guides/decorators).
