# mix_avoid_empty_style

| Severity | Quick Fix | Options |
|:--------:|:---------:|:-------:|
| Info  |    ❌     |   ❌   |

## Details

Ensure that Style instances are not created directly without parameters. Instead, create a Style instance with parameters or remove it.

### Motivation

Style instances should be created with parameters. If they are created without parameters, it will have no behavior and will be useless.

### ❌ Don't

```dart {5,7}
final style = Style();

// or

Box(
    style: Style()
    child: //...
)
```

### ✅ Do

```dart {2,8}
final style = Style(
    $box.color.red(), // Just add any attribute
);

// or

Box(
    child: //...
)
```