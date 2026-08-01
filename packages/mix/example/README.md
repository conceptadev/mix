# Mix examples

This app consumes only Mix's public `package:mix/mix.dart` library. Its
WrapBox gallery demonstrates a constrained tag cloud, narrow and wide widths,
horizontal and vertical flow, and LTR and RTL directionality.

Run it from this directory:

```sh
flutter run
```

The primary example uses WrapBoxStyler's flattened fluent methods:

```dart
final style = WrapBoxStyler()
    .paddingAll(16)
    .spacing(8)
    .runSpacing(10)
    .wrapAlignment(WrapAlignment.center);
```

For advanced composition, `.flow(WrapStyler(...))` replaces or merges the
nested Wrap style directly. The name is `flow` because `.wrap()` is the Mix
widget-modifier API. On WrapBoxStyler, `.alignment()` and `.clipBehavior()`
belong to the outer Box; `.wrapAlignment()` and `.wrapClipBehavior()` belong
to Flutter's inner Wrap.

The widget tests include smoke coverage and deterministic narrow/wide golden
images:

```sh
flutter test
```
