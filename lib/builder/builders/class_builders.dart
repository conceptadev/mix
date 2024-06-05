import 'package:code_builder/code_builder.dart';

import '../builder_helpers.dart';
import '../types.dart';

class ClassGeneratorUtil {
  final List<FieldInfo> fields;
  final String className;
  final DartEmitter _emitter;
  const ClassGeneratorUtil({
    required this.className,
    required this.fields,
    required DartEmitter emitter,
  }) : _emitter = emitter;

  Method methodResolveBuilder(String resolveToType) {
    return Method((builder) {
      builder
        ..name = 'resolve'
        ..annotations.add(refer('override'))
        ..returns = refer(resolveToType)
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'mix'
          ..type = MixTypes.mixData));
      builder.body = Code('''
      return $resolveToType(
        ${fields.map((field) {
        final fieldName = field.name;
        if (field.hasDto) {
          return '$fieldName: $fieldName?.resolve(mix)';
        }

        return '$fieldName: $fieldName';
      }).join(', ')},
      );
    ''');
    });
  }

  Method methodMergeBuilder() {
    return Method((b) {
      b.annotations.add(refer('override'));
      b.name = 'merge';
      b.returns = refer(className);
      b.requiredParameters.add(Parameter((b) {
        b.name = 'other';
        b.type = refer('$className?');
      }));
      b.body = Code('''
        if (other == null) return this;

        return $className(
          ${fields.map((field) {
        final fieldName = field.name;
        if (field.hasDto) {
          return '$fieldName: $fieldName?.merge(other.$fieldName) ?? other.$fieldName';
        }

        return '$fieldName: other.$fieldName ?? $fieldName';
      }).join(', ')},);
      ''');
    });
  }

  Method staticMethodOfBuilder() {
    return Method((builder) {
      builder.docs.addAll([
        '/// Retrieves the [$className] from the nearest [Mix] ancestor.',
        '///',
        '/// If no ancestor is found, returns [$className].',
      ]);
      builder.name = 'of';
      builder.returns = refer(className);
      builder.static = true;
      builder.requiredParameters.add(Parameter((b) {
        b.name = 'context';
        b.type = refer('BuildContext');
      }));
      builder.body = Code('''
      final mix = Mix.of(context);

      return $className.from(mix);
    ''');
    });
  }

  Class classSpecTweenBuilder() {
    return Class((builder) {
      builder.docs.addAll([
        '/// A tween that interpolates between two [$className] instances.',
        '///',
        '/// This class can be used in animations to smoothly transition between',
        '/// different [$className] specifications.',
      ]);
      builder.name = '${className}Tween';
      builder.extend = refer('Tween<$className?>');

      final constructorParams = [
        Parameter((b) {
          b.name = 'super.begin';
          b.named = true;
        }),
        Parameter((b) {
          b.name = 'super.end';
          b.named = true;
        }),
      ];

      // Constructor
      builder.constructors.add(
        Constructor((builder) {
          builder.optionalParameters.addAll(constructorParams);
        }),
      );

      // lerp method
      builder.methods.add(Method((b) {
        b.name = 'lerp';
        b.annotations.add(refer('override'));
        b.returns = refer(className);
        b.requiredParameters.add(Parameter((b) {
          b.name = 't';
          b.type = refer('double');
        }));
        b.body = Code('''
              if (begin == null && end == null) return const $className();
              if (begin == null) return end!;
              
              return begin!.lerp(end!, t);
            ''');
      }));
    });
  }

  Method staticMethodFromBuilder() {
    return Method((builder) {
      builder.docs.addAll(['/// Retrieves the [$className] from a MixData.']);
      builder.name = 'from';
      builder.returns = refer(className);
      builder.static = true;
      builder.requiredParameters.add(
        Parameter((builder) {
          builder.name = 'mix';
          builder.type = MixTypes.mixData;
        }),
      );
      builder.body = Code('''
        return mix.attributeOf<${className}Attribute>()?.resolve(mix) ?? const $className();
      ''');
    });
  }

  Method methodCopyWithBuilder() {
    return Method((builder) {
      builder.docs.addAll([
        '/// Creates a copy of this [$className] but with the given fields',
        '/// replaced with the new values.',
      ]);
      builder.annotations.add(refer('override'));
      builder.name = 'copyWith';
      builder.returns = refer(className);
      builder.optionalParameters.addAll(fields.methodParams);
      builder.body = Code('''
        return $className(
          ${fields.map((field) => '${field.name}: ${field.name} ?? this.${field.name}').join(', ')},
        );
      ''');
    });
  }

  Method methodToStringBuilder() {
    return Method((builder) {
      builder.annotations.add(refer('override'));
      builder.name = 'toString';
      builder.returns = refer('String');
      builder.body = Code('''
          return '$className(${fields.map((field) => '${field.name}: \${field.name}').join(', ')})';
        ''');
    });
  }

  Method methodLerpBuilder() {
    final lerpStatements = fields.map((f) {
      return '${f.name}: ${f.lerpExpression.accept(_emitter)}';
    }).join(', ');

    return Method((builder) {
      builder.annotations.add(refer('override'));
      builder.name = 'lerp';
      builder.returns = refer(className);
      builder.requiredParameters.add(Parameter((builder) {
        builder.name = 'other';
        builder.type = refer('$className?');
      }));
      builder.requiredParameters.add(Parameter((builder) {
        builder.name = 't';
        builder.type = refer('double');
      }));
      builder.body = Code('''
    if (other == null) return this;

    return $className(
      $lerpStatements,
    );
  ''');
    });
  }

  Method getterPropsBuilder() {
    return Method((builder) {
      builder.docs.addAll([
        '/// The list of properties that constitute the state of this [$className].',
        '///',
        '/// This property is used by the [==] operator and the [hashCode] getter to',
        '/// compare two [$className] instances for equality.',
      ]);
      builder.annotations.add(refer('override'));
      builder.name = 'props';
      builder.type = MethodType.getter;
      builder.returns = refer('List<Object?>');
      builder.body = Code('''
    return [
      ${fields.map((field) => field.name).join(', ')},
    ];
  ''');
    });
  }

  Method methodEqualityOperatorBuilder() {
    final equalityChecks = fields.map((field) {
      final fieldType = field.type;

      if (fieldType.startsWith('List<')) {
        final listEqualsRef = FlutterTypes.foundation.listEquals([
          refer(field.name),
          refer('other.${field.name}'),
        ]);

        return listEqualsRef.accept(_emitter);

        // return 'listEquals(other.${field.name}, ${field.name})';
      } else if (fieldType.startsWith('Map<')) {
        final mapEqualsRef = FlutterTypes.foundation.mapEquals([
          refer(field.name),
          refer('other.${field.name}'),
        ]);

        return mapEqualsRef.accept(_emitter);
        // return 'mapEquals(other.${field.name}, ${field.name})';
      } else if (fieldType.startsWith('Set<')) {
        final setEqualsRef = FlutterTypes.foundation.setEquals([
          refer(field.name),
          refer('other.${field.name}'),
        ]);

        return setEqualsRef.accept(_emitter);
        // return 'setEquals(other.${field.name}, ${field.name})';
      }

      return 'other.${field.name} == ${field.name}';
    }).join(' && ');

    return Method((b) => b
      ..name = 'operator =='
      ..annotations.add(refer('override'))
      ..returns = refer('bool')
      ..requiredParameters.add(Parameter((b) => b
        ..name = 'other'
        ..type = refer('Object')))
      ..body = Code('''
          if (identical(this, other)) return true;

          return other is $className && $equalityChecks;
        '''));
  }

  Method getterHashcodeBuilder() {
    return Method((b) => b
      ..name = 'hashCode'
      ..annotations.add(refer('override'))
      ..returns = refer('int')
      ..type = MethodType.getter
      ..body = Code('''
          return ${fields.map((field) => '${field.name}.hashCode').join(' ^ ')};
        '''));
  }
}
