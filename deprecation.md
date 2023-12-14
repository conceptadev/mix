
# API Changes

## Composability

To compose mixes we used `Mix()`, however this is confusing when dealing with resolved Mixes from context, `Mix` also is not the resolved mix and was not clear when dealing with mix Builder, and resolved mix data, therefore we have renamed the internal to `MixFactory` which is a better definition of what is doing. However we have created an alias for `Style`, and have deprecated `Mix`. The recommendation, will be to use `Style` and this will the preferred way on the documentations, and internal references.

Keep in mind that you can create type aliases, in order to  best fit your teams workflows and definitions.

## Mix Context

There has been some considerable changes on the inter workings of Mix Context, to support better semantics an performance improvements.

- MixContext is now MixData

This does not impact the current behavior of Mix, but if you were building internal widgets or using the Builder most like this will be changed.

## Material Theme Tokens have been changed also

## Inherit Mix has been removed

Inheritance of Mix was turned on by default for Text and Icon widgets. However best practice now is to be explicit on which Mix to pass down, by passing the Mix itself. All inheritance has now been turn off to facilitate debugging and troubleshooting. Also we do plan better tooling for migration, and automation that makes a more explicit inheritance a much more favorable approach.

```dart

final boxStyle = Style(backgroundColor(Colors.red));
final textStyle = Style(text.style(color: Colors.white));

return Box(
    style: boxStyle,
    child: StyledText('Content', style: textStyle,),
);

```

## Simplified utilities

In order to simplify the API and make documentation easier for onboarding, we decided to support a simpler utilities, that align better with the expectation from the Flutter ecosystem.

### Removed of short utilities

No longer shorter versions of utilities will be supported, example:

- `p(10)` will be supported, instead we will support `padding(10)`.

### Removed utilities APIs

There were APIs that did redundant functionality. For example `border` and `textStyle`

A border around all sides could be defined the following way:

```dart
borderWidth(1)
borderColor(Colors.red)
borderStyle(BorderStyle.solid)
```

However we now prefer the current supported way which is:

```dart
border(width:1, color:Colors.red, style:BorderStyle.solid)
```

Many text style utilities have also been deprecated in favor of the `textStyle` utility.

```dart
textColor(Colors.white)
```

Will now become:

```dart
textSyle(textColor:Colors.white)
```
