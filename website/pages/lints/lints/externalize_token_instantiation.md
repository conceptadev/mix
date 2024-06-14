# mix_externalize_token_instantiation

| Severity | Quick Fix | Options |
|:--------:|:---------:|:-------:|
|   Info   |    ❌     |   ❌    |

## Details

Ensure that Tokens instances are not created directly inside Style constructors. Instead, instantiate Tokens outside and pass it as a parameter.

### Motivation

Tokens should be shared across the application. If they are created inside a `Style`, it means that they are local to the `Style`, and it will be harder to reuse them.

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