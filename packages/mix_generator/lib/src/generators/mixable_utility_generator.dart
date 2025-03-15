// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:logging/logging.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../core/metadata/utility_metadata.dart';
import '../core/utils/base_generator.dart';
import '../core/utils/utility_code_generator.dart';

/// Generates utility mixins for classes and enums.
///
/// This generator creates utility mixins that provide:
/// - Static constants (when the utility type has static constants)
/// - Constructors (when the utility type has constructors)
/// - Enum values (when the utility type is an enum)
class MixableUtilityGenerator
    extends BaseMixGenerator<MixableFieldUtility, UtilityMetadata> {
  final Logger _logger = Logger('MixableUtilityGenerator');

  MixableUtilityGenerator()
      : super(const TypeChecker.fromRuntime(MixableUtility));

  @override
  String generateForMetadata(UtilityMetadata metadata, BuildStep buildStep) {
    try {
      // Use the unified generator
      return UtilityCodeGenerator.generateUtilityMixin(metadata);
    } catch (e, stackTrace) {
      _logger.severe(
        'Error generating utility mixin for ${metadata.name}',
        e,
        stackTrace,
      );

      return '// Error generating utility mixin for ${metadata.name}: $e';
    }
  }

  @override
  Future<UtilityMetadata> createMetadata(
    ClassElement element,
    BuildStep buildStep,
  ) async {
    validateClassElement(element);

    final annotation = typeChecker.firstAnnotationOfExact(element);

    if (annotation == null) {
      _logger.warning(
        'No MixableUtility annotation found for ${element.name}. Using basic metadata.',
      );

      return UtilityMetadata.fromElement(element);
    }

    return UtilityMetadata.fromAnnotation(
      element,
      ConstantReader(annotation),
    );
  }
}
