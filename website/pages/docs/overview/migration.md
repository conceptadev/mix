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

### StyledWidgets updates

#### The new PressableBox

To provide a more consistent way to use the gesture APIs, we developed a new widget that merges the functionalities of Box and `Pressable`. Thus, the new `PressableBox` can receive a style like a Box and also accept interactions and its variants, similar to a `Pressable`. For more information, see the [PressableBox guide](https://www.fluttermix.com/docs/widgets/pressable-box).
Keep in mind that the ideia is to reserve the old `Pressable` to more advanced cases.

### Behavior changes

#### Decorators

Decorators cannot be inherited by any children. The reason is that abstract class `Attribute` has gained a new property, `isInheritable`, witch can be set to false if you want your custom attributes to be non-inheritable, such as Decorators.

#### Operators `and` (`&`) and `or` (`|`) 

The operators have been redesigned to allow for concatenation and grouping, enabling the creation of conditions like, `(primary | secondary) & onHover`. For details, refer to the [variants guide](https://www.fluttermix.com/docs/guides/variants#combining-operators)

#### StyledWidgets and Decorators

A bunch of `StyledWidgets` are now allow to receive decorators' attributes, including `StyledIcon`, `StyledFlex` and `StyledIcon`. Additionally, when a decorator is not applied to a Style, a `RenderWidgetDecorators` will not be present in the widget tree. This simplification makes the widget easier to debug.

#### Theming

The `MixTheme` feature has been improved and now offer better API. It can applied to main attributes using the method `.of`, as shown in the following code:
```dart 
const primaryColor = ColorToken('primary');
final theme = MixThemeData(
    colors: {
        primaryColor: Colors.blue,
    },
);

// ... body method ...
MixTheme(
    data: theme, 
    Box(
        key: key,
        style: Style(
            box.color.of(primaryColor),
        ),
    )
)
```