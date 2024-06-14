# mix_order_attributes_in_style

| Severity | Quick Fix | Options |
|:--------:|:---------:|:-------:|
|   Info   |    ❌     |   ❌    |

## Details

Ensure that the attributes are ordered in groups of the same category in the Style constructor.

### Motivation

It makes it easier to read and understand the Style.

### Don't

```dart
Style (
    $box.color.red(),
    $text.color.blue(),
    $box.height(200),
    $text.style.fontSize(10),
)
```

### Do

```dart
Style (
    $box.color.red(),
    $box.height(200),
    $text.color.blue(),
    $text.style.fontSize(10),
)
```