# mix_generator

A package that provides code generation for Spec and Dto classes in the Mix package. It simplifies the creation of Spec and Dto classes by automatically generating the necessary code based on annotated classes.

## Installation

To use Mix Generator, add the following dependencies to your `pubspec.yaml` file:

```bash
flutter pub add mix
flutter pub add mix_annotations
flutter pub add:dev mix_generator
```

pubspec.yaml

```yaml
dependencies:
  mix: ^0.0.0
  mix_annotations: ^0.0.0

dev_dependencies:
  build_runner: ^0.0.0
  mix_generator: ^0.0.0
```

## Usage

### MixableSpec

The `@MixableSpec()` annotation generates code for a mixable class. Here's an example:

```dart
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'my_spec.g.dart';

@MixableSpec()
final class MySpec extends Spec<MySpec> with _$MySpec {
  final String? name;
  final int? age;

  const MySpec({this.name, this.age});
}
```

### MixableDto

The `@MixableDto()` annotation generates code for a mixable Dto. Here's an example:

#### Options

- `mergeLists` - Defaults to true, merges lists in place.
- `generateUtility` - Defaults to true, generates a utility class.
- `generateValueExtension` - Defaults to true, generates a value extension to convert `Value` to Dto with a `toDto()` extension.

```dart
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'value_dto.g.dart';

@MixableDto()
final class ValueDto<Value> extends Dto<Value> with _$MyDto {
  final String? name;
  final int? age;

  const ValueDto({this.name, this.age});
}
```

### MixableProperty

The `@MixableProperty()` annotation specifies a mixable property for code generation. Here's an example:

```dart
import 'package:mix_generator/mix_generator.dart';

@MixableProperty(
  dto: MixableFieldDto(type: BoxConstraintsDto),
  utilities: [
    MixableUtility(
      properties: [
        (path: 'minWidth', alias: 'minWidth'),
        (path: 'maxWidth', alias: 'maxWidth'),
      ],
    ),
  ],
)
final BoxConstraints? constraints;
```

### MixableUtility

The `@MixableUtility()` annotation specifies a mixable utility for code generation. Here's an example:

```dart
import 'package:mix_generator/mix_generator.dart';

@MixableProperty(
  utilities: MixableUtility(
    type: BoxDecoration,
    properties: [
      (path: 'color', alias: 'color'),
      (path: 'border', alias: 'border'),
      (path: 'borderRadius', alias: 'borderRadius'),
    ],
  ),
)
final Decoration? decoration;
```

### Code Generation

To generate the code for your mixable classes and Dtos, run the following command:

```bash
flutter pub run build_runner build
```