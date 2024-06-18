# mix_avoid_defining_tokens_within_theme_data

| Severity | Quick Fix | Options |
|:--------:|:---------:|:-------:|
|   Info   |    ❌     |   ❌    |

## Details

Ensure that Tokens instances are not created directly inside `MixThemeData` constructors.

### Motivation

When you create tokens within a `MixThemeData`, you're essentially creating a localized scope that may not be easily accessible elsewhere in your application. This can lead to unnecessary token recreation or, worse, duplicated efforts to reuse them.

### Don't

```dart
MixThemeData(
    colors: {
        const ColorToken('a'): Colors.black12,
    }
)
```

### Do

```dart
final primary = ColorToken('a');

MixThemeData(
    colors: {
        primary: Colors.black12,
    }
)
```