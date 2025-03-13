// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:logging/logging.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../builders/attribute/utility_class_builder.dart';
import '../core/models/utility_metadata.dart';
import '../core/utils/base_generator.dart';
import '../core/utils/constructor_utils.dart';
import '../core/utils/extensions.dart';

/// Generator for classes annotated with [MixableFieldUtility] or [MixableUtility].
///
/// This generator produces a mixin with utility methods for:
/// - Enum values (when the utility type is an enum)
/// - Class constants and constructors (when the utility type is a class)
class MixableUtilityGenerator
    extends BaseMixGenerator<MixableFieldUtility, UtilityMetadata> {
  final Logger _logger = Logger('MixableUtilityGenerator');

  MixableUtilityGenerator()
      : super(const TypeChecker.fromRuntime(MixableUtility));

  /// Generates the utility mixin code for an enum utility.
  String _generateEnumUtilityMixin(UtilityMetadata metadata) {
    final className = metadata.name;
    final generatedClassName = metadata.element.generatedName;
    final enumElement = metadata.enumElement!;
    final enumTypeName = enumElement.name;
    final enumValues = metadata.enumValues;
    final shouldGenerateCallMethod =
        metadata.generateHelpers == GenerateUtilityHelpers.callMethod;

    final callMethod = shouldGenerateCallMethod
        ? '''
/// Creates an [Attribute] instance with the specified $enumTypeName value.
T call($enumTypeName value) => builder(value);
'''
        : '';

    final fieldStatements = enumValues.map((fieldName) {
      return '''
/// Creates an [Attribute] instance with [$enumTypeName.$fieldName] value.
T $fieldName() => builder($enumTypeName.$fieldName);
''';
    }).join('\n');

    final comments = '''
/// {@template ${className.snakecase}}
/// A utility class for creating [Attribute] instances from [$enumTypeName] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [$enumTypeName] values.
/// {@endtemplate}''';

    return '''
$comments
mixin $generatedClassName<T extends Attribute> on MixUtility<T,$enumTypeName> {

$fieldStatements

$callMethod
}
''';
  }

  /// Generates the utility mixin code for a class utility.
  String _generateClassUtilityMixin(UtilityMetadata metadata) {
    final className = metadata.name;
    final generatedClassName = metadata.element.generatedName;
    final valueElement = metadata.valueElement!;
    final valueName = valueElement.name;
    final mappingElement = metadata.effectiveMappingElement!;
    final shouldGenerateCallMethod =
        metadata.generateHelpers == GenerateUtilityHelpers.callMethod;

    // Generate call method if requested
    final callMethod = shouldGenerateCallMethod
        ? '''
/// Creates an [Attribute] instance with the specified $valueName value.
T call($valueName value) => builder(value);
'''
        : '';

    // Generate utility methods for static constants
    final fieldStatements = <String>[];
    for (var field in mappingElement.fields) {
      final isSameType = field.type.isAssignableTo(valueElement.thisType);

      if (field.isStatic && field.isConst && isSameType) {
        final name = field.name;
        final type = mappingElement.name;
        fieldStatements.add('''
/// Creates an [Attribute] instance with [${mappingElement.name}.$name] value.
T $name() => builder($type.$name);
''');
      }
    }

    // Generate utility methods for constructors
    final constructorStatements = <String>[];
    final constructors = mappingElement.constructors.where((constructor) {
      return isValidConstructor(constructor);
    });

    for (var constructor in constructors) {
      // Skip unnamed constructors if we have a call method
      if (constructor.name.isEmpty && shouldGenerateCallMethod) {
        continue;
      }

      final statement = generateUtilityForConstructor(
        constructor,
        skipCallMethod: !shouldGenerateCallMethod,
        mappedEl: mappingElement,
      );

      if (statement.isNotEmpty) {
        constructorStatements.add(statement);
      }
    }

    final comments = '''
/// {@template ${className.snakecase}}
/// A utility class for creating [Attribute] instances from [$valueName] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [$valueName] values.
/// {@endtemplate}''';

    return '''
$comments
mixin $generatedClassName<T extends Attribute> on MixUtility<T,$valueName> {

${fieldStatements.join('\n')}

${constructorStatements.join('\n')}

$callMethod
}
''';
  }

  @override
  Future<UtilityMetadata> createMetadata(
    ClassElement element,
    BuildStep buildStep,
  ) async {
    validateClassElement(element);

    return UtilityMetadata.fromAnnotation(
      element,
      ConstantReader(typeChecker.firstAnnotationOfExact(element) ??
          const TypeChecker.fromRuntime(MixableUtility)
              .firstAnnotationOfExact(element)),
    );
  }

  @override
  String generateForMetadata(UtilityMetadata metadata, BuildStep buildStep) {
    final output = StringBuffer();

    // Generate the appropriate utility based on the type
    if (metadata.isEnumUtility) {
      output.writeln(_generateEnumUtilityMixin(metadata));
    } else {
      output.writeln(_generateClassUtilityMixin(metadata));
    }

    return output.toString();
  }
}
