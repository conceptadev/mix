import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import 'spec_definition.dart';

class SpecDefinitionGenerator extends GeneratorForAnnotation<SpecDefinition> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
          'SpecDefinition can only be applied to classes.',
          element: element);
    }

    final className = element.name;
    final fields = element.fields.where((field) => !field.isSynthetic).toList();

    final classBuilder = Class((b) {
      b.name = className;
      for (final field in fields) {
        b.fields.add(Field((b) => b
          ..name = field.name
          ..type = refer(field.type.getDisplayString(withNullability: true))
          ..modifier = FieldModifier.final$));
      }

      b.constructors.add(Constructor((b) => b
        ..constant = true
        ..requiredParameters.addAll(fields.map((field) => Parameter((b) => b
          ..name = field.name
          ..named = true
          ..toThis = true)))));

      b.methods.add(Method((b) => b
        ..name = 'copyWith'
        ..returns = refer(className)
        ..optionalParameters.addAll(fields.map((field) => Parameter((b) => b
          ..name = field.name
          ..named = true
          ..type = refer(field.type.getDisplayString(withNullability: true)))))
        ..body = Code('''
            return $className(
              ${fields.map((field) => '${field.name}: ${field.name} ?? this.${field.name}').join(', ')}
            );
          ''')));

      b.methods.add(Method((b) => b
        ..name = 'toMap'
        ..returns = refer('Map<String, dynamic>')
        ..body = Code('''
            return {
              ${fields.map((field) => "'${field.name}': ${field.name}").join(', ')}
            };
          ''')));

      b.methods.add(Method((b) => b
        ..name = 'toString'
        ..annotations.add(refer('override'))
        ..returns = refer('String')
        ..body = Code('''
            return '$className(${fields.map((field) => '${field.name}: \$${field.name}').join(', ')})';
          ''')));

      b.methods.add(Method((b) => b
        ..name = 'operator =='
        ..annotations.add(refer('override'))
        ..returns = refer('bool')
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'other'
          ..type = refer('Object')))
        ..body = Code('''
            if (identical(this, other)) return true;

            return other is $className ${fields.map((field) => '&& other.${field.name} == ${field.name}').join()};
          ''')));

      b.methods.add(Method((b) => b
        ..name = 'hashCode'
        ..annotations.add(refer('override'))
        ..returns = refer('int')
        ..type = MethodType.getter
        ..body = Code('''
            return ${fields.map((field) => '${field.name}.hashCode').join(' ^ ')};
          ''')));
    });

    final emitter = DartEmitter();

    return classBuilder.accept(emitter).toString();
  }
}

Builder specDefinitionBuilder(BuilderOptions options) =>
    SharedPartBuilder([SpecDefinitionGenerator()], 'spec_definition');
