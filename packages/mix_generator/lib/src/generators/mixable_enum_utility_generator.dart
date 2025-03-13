// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:logging/logging.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../core/models/enum_utility_metadata.dart';
import '../core/utils/base_generator.dart';
import '../core/utils/extensions.dart';

/// Generator for classes annotated with [MixableEnumUtility].
///
/// This generator produces a mixin with utility methods for each enum value.
class MixableEnumUtilityGenerator
    extends BaseMixGenerator<MixableEnumUtility, EnumUtilityMetadata> {
  final Logger _logger = Logger('MixableEnumUtilityGenerator');

  MixableEnumUtilityGenerator()
      : super(const TypeChecker.fromRuntime(MixableEnumUtility));

  /// Generates the utility mixin code based on the given metadata.
  String _generateEnumUtilityMixin(EnumUtilityMetadata metadata) {
    final className = metadata.name;
    final generatedClassName = metadata.element.generatedName;
    final enumElement = metadata.enumElement;
    final enumTypeName = enumElement.name;
    final enumValues = metadata.enumValues;
    final shouldGenerateCallMethod = metadata.generateCallMethod;

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

  @override
  Future<EnumUtilityMetadata> createMetadata(
    ClassElement element,
    BuildStep buildStep,
  ) async {
    validateClassElement(element);

    return EnumUtilityMetadata.fromAnnotation(
      element,
      ConstantReader(typeChecker.firstAnnotationOfExact(element)),
    );
  }

  @override
  String generateForMetadata(
    EnumUtilityMetadata metadata,
    BuildStep buildStep,
  ) {
    final output = StringBuffer();
    output.writeln(_generateEnumUtilityMixin(metadata));

    return output.toString();
  }
}
