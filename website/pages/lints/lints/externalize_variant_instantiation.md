# mix_externalize_variant_instantiation

| Severity | Quick Fix | Options |
|:--------:|:---------:|:-------:|
|   Info   |    ❌     |   ❌    |

## Details

Ensure that `Variant` instances are not created directly inside `Style` constructors. Instead, instantiate `Variant`s outside and pass them as parameters.

### Motivation

`Variant`s should be shared across the application. If they are created inside a `Style`, it means that they are local to the `Style`, and it will be harder to reuse them.

### ❌ Don't

```dart {2}
Style(
    const Variant('example')(
        $text.textAlign.center(),
        $box.height(200),
        $box.width(200),
    ),
)
```

### ✅ Do

```dart {1,4}
final example = Variant('example');

Style(
    example(
        $text.textAlign.center(),
        $box.height(200),
        $box.width(200),
    ),
)
```