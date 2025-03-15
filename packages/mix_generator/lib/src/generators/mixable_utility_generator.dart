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
    final output = StringBuffer();

    // Generate the appropriate utility based on the type
    if (metadata.isEnumUtility) {
      output.writeln(UtilityCodeGenerator.generateEnumUtilityMixin(metadata));
    } else {
      output.writeln(UtilityCodeGenerator.generateClassUtilityMixin(metadata));
    }

    return output.toString();
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
}
