# mix_avoid_empty_variants

| Severity | Quick Fix | Options |
|:--------:|:---------:|:-------:|
| Info     |    ❌     |   ❌    |

## Details

Avoid creating empty variants directly inside `Style`. Empty variants are essentially useless and can make the code harder to read and understand.

### Motivation

It can lead to unnecessary complexity and confusion. This can make it harder for other developers to understand your code and maintain it in the future.

### Don't

```dart
final a = Variant('a');

final wrong_case = Style(
  a(),
);
```

### Do

```dart
final correct_case = Style(
  a(
    $box.color.amber(),
  ),
);
```