# mix_max_number_of_attributes_per_style

| Severity | Quick Fix | Options |
|:--------:|:---------:|:-------:|
|   Warning   |    ❌     |   ❌    |

## Details

Limit the number of attributes per style. The default value is 10.

### Motivation

This rule aims to encourage developers to keep their styles concise and focused on a few key aspects.

### Don't

```dart
final style = Style (
    $attribute1(),
    $attribute2(),
    $attribute3(),
    $attribute4(),
    $attribute5(),
    $attribute6(),
    $attribute7(),
    $attribute8(),
    $attribute9(),
    $attribute10(),
    $attribute11(),
);
```

### Do

```dart
final auxStyle = Style(
    $attribute1(),
    $attribute2(),
    $attribute3(),
    $attribute4(),
    $attribute5(),
);

final mainStyle = Style(
    auxStyle(),
    $attribute6(),
    $attribute7(),
    $attribute8(),
    $attribute9(),
    $attribute10(),
    $attribute11(),
);
```

## Custom Parameters
    
```yaml filename="analysis_options.dart"
custom_lint:
  rules:
    - mix_max_number_of_attributes_per_style:
      max_number: 11
```

### Parameters

#### max_number (int)

The maximum number of attributes allowed per style. The default value is 10.
