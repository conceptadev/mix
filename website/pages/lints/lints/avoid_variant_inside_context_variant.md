# mix_avoid_variant_inside_context_variant

| Severity | Quick Fix | Options |
|:--------:|:---------:|:-------:|
|   Error   |    ❌     |   ❌    |

## Details

Ensure that `Variant`s are not applied inside the `ContextVariant`s' scope but rather combined using the & operator.

### Motivation

`ContextVariant` and the standard `Variant` are applied at different moments during the `Style` lifecycle. Because of this, we strongly recommend that you don't create a `Variant` inside the `ContextVariant`'s scope. Instead, you can combine the `Variant`s using the `&` and `|` operators.

### ❌ Don't

```dart {5,7}
final variantTest = Variant('test');

Style (
    $box.color.red(),
    $on.hover(
        $box.color.green(),
        variantTest(
            $box.color.blue(),
        )
    ),
)
```

### ✅ Do

```dart {8}
final variantTest = Variant('test');

Style (
    $box.color.red(),
    $on.hover(
        $box.color.green(),
    ),
    ($on.hover & variantTest)(
        $box.color.blue(),
    ),
)
```