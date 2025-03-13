// // ignore_for_file: non_constant_identifier_names

// import 'package:analyzer/dart/element/element.dart';
// import 'package:analyzer/dart/element/type.dart';
// import 'package:build/build.dart';
// import 'package:mix_annotations/mix_annotations.dart';
// import 'package:source_gen/source_gen.dart';

// import '../core/utils/helpers.dart';
// import '../helpers/builder_utils.dart';
// import '../helpers/type_extension.dart';

// class MixableEnumUtilityGenerator
//     extends GeneratorForAnnotation<MixableEnumUtility> {
//   const MixableEnumUtilityGenerator();

//   EnumUtilityAnnotationContext _readContext(ClassElement classElement) {
//     final annotation = typeChecker.firstAnnotationOfExact(classElement);
//     final reader = ConstantReader(annotation);
//     final enumType = _getUtilityType(classElement);
//     if (enumType == null || enumType.isEnum == false) {
//       throw InvalidGenerationSourceError(
//         'The annotation can only be applied to a class that extends MixUtility<Attribute, EnumType>',
//         element: classElement,
//       );
//     }
//     final generateCallMethod = reader.read('generateCallMethod').boolValue;

//     final enumElement = enumType.element;

//     if (enumElement is! EnumElement) {
//       throw InvalidGenerationSourceError(
//         'The "type" argument must be an enum.',
//         element: enumElement,
//       );
//     }

//     return EnumUtilityAnnotationContext(
//       element: classElement,
//       enumElement: enumElement,
//       generateCallMethod: generateCallMethod,
//     );
//   }

//   @override
//   Future<String> generateForAnnotatedElement(
//     Element element,
//     ConstantReader annotation,
//     BuildStep buildStep,
//   ) async {
//     if (element is! ClassElement) {
//       throw InvalidGenerationSourceError(
//         'The annotation can only be applied to a class.',
//         element: element,
//       );
//     }

//     final context = _readContext(element);

//     final output = StringBuffer();

//     output.writeln(_abstractEnumUtility(context));

//     return dartFormat(output.toString());
//   }
// }

// String _abstractEnumUtility(EnumUtilityAnnotationContext context) {
//   final className = context.element.name;
//   final generatedClassName = context.generatedName;

//   final shouldGenerateCallMethod = context.generateCallMethod;

//   final enumElement = context.enumElement;
//   final enumTypeName = enumElement.name;

//   final values = enumElement.values;

//   final callMethod = shouldGenerateCallMethod
//       ? '''
// /// Creates an [Attribute] instance with the specified $enumTypeName value.
// T call($enumTypeName value) => builder(value);
// '''
//       : '';

//   final fieldStatements = values.map((fieldName) {
//     return '''
// /// Creates an [Attribute] instance with [$enumTypeName.$fieldName] value.
// T $fieldName() => builder($enumTypeName.$fieldName);
// ''';
//   }).join('\n');

//   final comments = '''
// /// {@template ${className.snakecase}}
// /// A utility class for creating [Attribute] instances from [$enumTypeName] values.
// ///
// /// This class extends [MixUtility] and provides methods to create [Attribute] instances
// /// from predefined [$enumTypeName] values.
// /// {@endtemplate}''';

//   return '''
// $comments
// mixin $generatedClassName<T extends Attribute> on MixUtility<T,$enumTypeName> {

// $fieldStatements

// $callMethod
// }
// ''';
// }

// DartType? _getUtilityType(ClassElement element) {
//   const utilityTypes = ['MixUtility'];

//   for (var supertype in element.allSupertypes) {
//     if (utilityTypes.contains(supertype.element.name) &&
//         supertype.typeArguments.length == 2) {
//       return supertype.typeArguments[1];
//     }
//   }

//   return null;
// }
