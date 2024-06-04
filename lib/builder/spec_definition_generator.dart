import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';

import 'builder_helpers.dart';
import 'spec_definition.dart';
import 'types.dart';

Builder specDefinitionBuilder(BuilderOptions _) => SpecDefinitionBuilder();

final _emitter = DartEmitter(allocator: Allocator(), orderDirectives: true);
final _dartFormatter = DartFormatter(fixes: StyleFix.all);

class SpecDefinitionBuilder implements Builder {
  final typeChecker = const TypeChecker.fromRuntime(SpecDefinition);

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['_spec.g.dart', '_util.g.dart', '_attribute.g.dart'],
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    final libraryElement = await resolver.libraryFor(buildStep.inputId);

    final annotatedClasses = libraryElement.units
        .expand((unit) => unit.classes)
        .where((classElement) => typeChecker.hasAnnotationOfExact(classElement))
        .toList();

    for (final classElement in annotatedClasses) {
      final annotation = typeChecker.firstAnnotationOfExact(classElement);
      final baseClassName =
          annotation?.getField('name')?.toStringValue() ?? classElement.name;
      final specClassName = '${baseClassName}Spec';

      final outputSpecId = buildStep.inputId.changeExtension('_spec.g.dart');
      final outputUtilId = buildStep.inputId.changeExtension('_util.g.dart');
      final outputAttributeId =
          buildStep.inputId.changeExtension('_attribute.g.dart');

      const animatedField = FieldInfo(
        name: 'animated',
        type: 'AnimatedData',
        isNullable: true,
        isSuper: true,
        documentationComment: '',
      );

      final fields = classElement.fields
          .where((field) => !field.isSynthetic)
          .map(FieldInfo.fromElement)
          .toList()
        ..add(animatedField);
      // ..sort((a, b) => a.name.compareTo(b.name));

      final constructor = classElement.unnamedConstructor;

      validOrThrowIfHasRequiredFields(classElement, fields);
      validOrThrowIfHasRequiredParameters(constructor);

      final specLibrary = Library(
        (b) => b
          ..body.addAll([
            specClassBuilder(specClassName, fields),
            specTweenClassBuilder(specClassName),
          ])
          ..directives.add(
            Directive.import(outputAttributeId.pathSegments.last),
          ),
      );

      final attributeLibrary = Library(
        (b) => b
          ..body.addAll([specAttributeClassBuilder(specClassName, fields)])
          ..directives.add(Directive.import(outputSpecId.pathSegments.last)),
      );

      await buildStep.writeAsString(
        outputSpecId,
        _dartFormatter.format('${specLibrary.accept(_emitter)}'),
      );
      await buildStep.writeAsString(outputUtilId, '');
      await buildStep.writeAsString(
        outputAttributeId,
        _dartFormatter.format('${attributeLibrary.accept(_emitter)}'),
      );
    }
  }
}

Class specClassBuilder(String specClassName, List<FieldInfo> fields) {
  final specRef = MixTypes.spec.symbol!;

  return Class((builder) {
    builder.name = specClassName;
    builder.extend = refer('$specRef<$specClassName>');
    builder.docs.addAll([
      '/// A specification that defines the visual properties of $specClassName.',
      '///',
      '/// To retrieve an instance of [$specClassName], use the [$specClassName.of] method with a',
      '/// [BuildContext], or the [$specClassName.from] method with [MixData]',
    ]);

    builder.fields.addAll(fields.classFields);

    builder.constructors.add(
      Constructor((builder) {
        builder.constant = true;
        builder.optionalParameters.addAll(fields.constructorParams);
        builder.docs.addAll([
          '/// Creates a [$specClassName] with the given fields',
          '///',
          '// All parameters are optional',
        ]);
      }),
    );

    builder.methods.addAll([
      ofStaticMethodBuilder(specClassName),
      fromStaticMethodBuilder(specClassName),
      copyWithMethodBuilder(specClassName, fields),
      lerpMethodBuilder(specClassName, fields),
      propsGetterMethodBuilder(specClassName, fields),
    ]);
  });
}

Class specAttributeClassBuilder(String className, List<FieldInfo> fields) {
  final specAttributeClassName = '${className}Attribute';

  return Class((builder) {
    builder.name = specAttributeClassName;
    builder.extend = refer('SpecAttribute<$className>');
    builder.docs.addAll([
      '/// Represents the attributes of a [$className].',
      '///',
      '/// This class encapsulates properties defining the layout and',
      '/// appearance of a [$className].',
      '///',
      '/// Use this class to configure the attributes of a [$className] and pass it to',
      '/// the [$className] constructor.',
    ]);

    builder.fields.addAll(fields.classDtoFields);
    // Constructor
    builder.constructors.add(
      Constructor((builder) {
        builder.constant = true;
        builder.optionalParameters.addAll(fields.constructorParams);
      }),
    );

    builder.methods.addAll([
      resolveMethodBuilder(className, fields),
      mergeMethodBuilder(specAttributeClassName, fields),
      propsGetterMethodBuilder(specAttributeClassName, fields),
    ]);
  });
}

Method resolveMethodBuilder(String typeToResolve, List<FieldInfo> fields) {
  return Method((builder) {
    builder
      ..name = 'resolve'
      ..annotations.add(refer('override'))
      ..returns = refer(typeToResolve)
      ..requiredParameters.add(Parameter((b) => b
        ..name = 'mix'
        ..type = MixTypes.mixData));
    builder.body = Code('''
      return $typeToResolve(
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

Method mergeMethodBuilder(String className, List<FieldInfo> fields) {
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

Method ofStaticMethodBuilder(String className) {
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

Class specTweenClassBuilder(String className) {
  return Class((builder) {
    builder.docs.addAll([
      '/// A tween that interpolates between two [$className] instances.',
      '///',
      '/// This class can be used in animations to smoothly transition between',
      '/// different $className specifications.',
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

Method fromStaticMethodBuilder(String specClassName) {
  return Method((builder) {
    builder.docs.addAll([
      '/// Retrieves the [$specClassName] from a MixData.',
    ]);
    builder.name = 'from';
    builder.returns = refer(specClassName);
    builder.static = true;
    builder.requiredParameters.add(
      Parameter((builder) {
        builder.name = 'mix';
        builder.type = MixTypes.mixData;
      }),
    );
    builder.body = Code('''
        return mix.attributeOf<${specClassName}Attribute>()?.resolve(mix) ?? const $specClassName();
      ''');
  });
}

Method copyWithMethodBuilder(String className, List<FieldInfo> fields) {
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

Method toStringMethodBuilder(String className, List<FieldInfo> fields) {
  return Method((builder) {
    builder.annotations.add(refer('override'));
    builder.name = 'toString';
    builder.returns = refer('String');
    builder.body = Code('''
          return '$className(${fields.map((field) => '${field.name}: \${field.name}').join(', ')})';
        ''');
  });
}

Method lerpMethodBuilder(String className, List<FieldInfo> fields) {
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

Method propsGetterMethodBuilder(String className, List<FieldInfo> fields) {
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

void validOrThrowIfHasRequiredParameters(ConstructorElement? constructor) {
  final constructorParameters = constructor?.parameters ?? [];
  final hasRequiredParameter =
      constructorParameters.any((parameter) => parameter.isRequiredNamed);
  if (hasRequiredParameter) {
    throw InvalidGenerationSourceError(
      'Spec definition parameters cannot have the `required` keyword.',
      element: constructor,
    );
  }
}

void validOrThrowIfHasRequiredFields(
  ClassElement classElement,
  List<FieldInfo> fields,
) {
  // Check if any field is required (non-nullable)
  final hasRequiredField = fields.any((field) => !field.isNullable);
  if (hasRequiredField) {
    throw InvalidGenerationSourceError(
      'All fields of a Spec definition in the class must be nullable.',
      element: classElement,
    );
  }
}
