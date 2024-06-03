// import 'package:analyzer/dart/element/element.dart';
// import 'package:build/build.dart';
// import 'package:code_builder/code_builder.dart';
// import 'package:source_gen/source_gen.dart';

// import 'spec_definition.dart';

// Builder specDefinitionBuilder(BuilderOptions options) => SharedPartBuilder(
//       [SpecDefinitionGenerator()],
//       'spec_definition',
//     );

// class SpecDefinitionGenerator extends GeneratorForAnnotation<SpecDefinition> {
//   @override
//   generateForAnnotatedElement(
//       Element element, ConstantReader annotation, BuildStep buildStep) {
//     if (element is! ClassElement) {
//       throw InvalidGenerationSourceError(
//           'SpecDefinition can only be applied to classes.',
//           element: element);
//     }

//     final className = element.name;
//     final mixinName = '${className}Mixin';
//     final fields = element.fields.where((field) => !field.isSynthetic).toList();

//     final mixinBuilder = Mixin((b) {
//       b.name = mixinName;

//       b.methods.addAll([
//         _generateCopyWithMethod(className, fields),
//         _generateToStringMethod(className, fields),
//         _generateEqualityOperator(className, fields),
//         _generateHashCodeGetter(className, fields),
//         _generateLerpMethod(className, fields),
//       ]);
//     });

//     final emitter = DartEmitter();

//     const foundationImport = "import 'package:flutter/foundation.dart';";

//     return '''
//       $foundationImport

//       ${mixinBuilder.accept(emitter)}
//     ''';
//   }
// }

// Method _generateCopyWithMethod(String className, List<FieldElement> fields) {
//   return Method((b) => b
//     ..name = 'copyWith'
//     ..returns = refer(className)
//     ..optionalParameters.addAll(fields.map((field) => Parameter((b) => b
//       ..name = field.name
//       ..named = true
//       ..type = refer(field.type.getDisplayString(withNullability: true)))))
//     ..body = Code('''
//           final self = this as $className;

//           return $className(
//             ${fields.map((field) => '${field.name}: ${field.name} ?? ${field.selfName}').join(', ')}
//           );
//         '''));
// }

// Method _generateToStringMethod(String className, List<FieldElement> fields) {
//   return Method((b) => b
//     ..name = 'toString'
//     ..annotations.add(refer('override'))
//     ..returns = refer('String')
//     ..body = Code('''
//           final self = this as $className;

//           return '$className(${fields.map((field) => '${field.name}: \${${field.selfName}}').join(', ')})';
//         '''));
// }

// Method _generateLerpMethod(String className, List<FieldElement> fields) {
//   final lerpStatements = fields.map((field) {
//     final fieldName = field.name;
//     final fieldType = field.type.getDisplayString(withNullability: true);

//     String lerpExpression;
//     if (fieldType == 'double') {
//       lerpExpression = 'lerpDouble(${field.selfName}, other.$fieldName, t)';
//     } else if (fieldType == 'int') {
//       lerpExpression = 'lerpInt(${field.selfName}, other.$fieldName, t)';
//     } else if (fieldType.startsWith('EdgeInsetsGeometry')) {
//       lerpExpression =
//           'EdgeInsetsGeometry.lerp(${field.selfName}, other.$fieldName, t)';
//     } else if (fieldType.startsWith('BoxConstraints')) {
//       lerpExpression =
//           'BoxConstraints.lerp(${field.selfName}, other.$fieldName, t)';
//     } else if (fieldType.startsWith('Decoration')) {
//       lerpExpression =
//           'Decoration.lerp(${field.selfName}, other.$fieldName, t)';
//     } else if (fieldType.startsWith('AlignmentGeometry')) {
//       lerpExpression =
//           'AlignmentGeometry.lerp(${field.selfName}, other.$fieldName, t)';
//     } else if (fieldType.startsWith('Matrix4')) {
//       lerpExpression = 'lerpMatrix4(${field.selfName}, other.$fieldName, t)';
//     } else if (fieldType.startsWith('Clip')) {
//       lerpExpression = 'lerpSnap(${field.selfName}, other.$fieldName, t)';
//     } else if (fieldType == 'bool') {
//       lerpExpression = 'lerpSnap(${field.selfName}, other.$fieldName, t)';
//     } else {
//       lerpExpression = 'other.$fieldName';
//     }

//     return '$fieldName: $lerpExpression';
//   }).join(', ');

//   return Method((b) => b
//     ..name = 'lerp'
//     ..returns = refer(className)
//     ..requiredParameters.addAll([
//       Parameter((b) => b
//         ..name = 'other'
//         ..type = refer('$className?')),
//       Parameter((b) => b
//         ..name = 't'
//         ..type = refer('double')),
//     ])
//     ..body = Code('''
//           final self = this as $className;

//           if (other == null) return this;

//           return $className(
//             $lerpStatements
//           );
//         '''));
// }

// Method _generateEqualityOperator(String className, List<FieldElement> fields) {
//   final equalityChecks = fields.map((field) {
//     final fieldType = field.type.getDisplayString(withNullability: true);

//     if (fieldType.startsWith('List<')) {
//       return 'listEquals(other.${field.name}, ${field.selfName})';
//     } else if (fieldType.startsWith('Map<')) {
//       return 'mapEquals(other.${field.name}, ${field.selfName})';
//     } else if (fieldType.startsWith('Set<')) {
//       return 'setEquals(other.${field.name}, ${field.selfName})';
//     } else {
//       return 'other.${field.name} == ${field.selfName}';
//     }
//   }).join(' && ');

//   return Method((b) => b
//     ..name = 'operator =='
//     ..annotations.add(refer('override'))
//     ..returns = refer('bool')
//     ..requiredParameters.add(Parameter((b) => b
//       ..name = 'other'
//       ..type = refer('Object')))
//     ..body = Code('''
//           if (identical(this, other)) return true;

//           final self = this as $className;

//           return other is $className && $equalityChecks;
//         '''));
// }

// Method _generateHashCodeGetter(String className, List<FieldElement> fields) {
//   return Method((b) => b
//     ..name = 'hashCode'
//     ..annotations.add(refer('override'))
//     ..returns = refer('int')
//     ..type = MethodType.getter
//     ..body = Code('''
//           final self = this as $className;
//           return ${fields.map((field) => '${field.selfName}.hashCode').join(' ^ ')};
//         '''));
// }

// extension on FieldElement {
//   String get selfName => 'self.$name';
// }
