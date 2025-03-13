import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:logging/logging.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../core/dto/dto_mixin_builder.dart';
import '../core/dto/dto_utility_builder.dart';
import '../core/models/dto_metadata.dart';
import '../core/utils/base_generator.dart';

/// Generator for classes annotated with [MixableDto].
///
/// This generator produces:
/// - A mixin with DTO functionality
/// - A utility class for the DTO (if not skipped)
/// - A value extension (if enabled)
class MixableDtoGenerator extends BaseMixGenerator<MixableDto, DtoMetadata> {
  final Logger _logger = Logger('MixableDtoGenerator');

  MixableDtoGenerator() : super(const TypeChecker.fromRuntime(MixableDto));

  @override
  Future<DtoMetadata> createMetadata(
    ClassElement element,
    BuildStep buildStep,
  ) async {
    validateClassElement(element);

    return DtoMetadata.fromAnnotation(
      element,
      ConstantReader(typeChecker.firstAnnotationOfExact(element)),
    );
  }

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        '@MixableDto can only be applied to classes.',
        element: element,
      );
    }

    final metadata = await createMetadata(element, buildStep);

    return generateForMetadata(metadata, buildStep);
  }

  @override
  String generateForMetadata(DtoMetadata metadata, BuildStep buildStep) {
    final output = StringBuffer();

    // Add warning ignore if necessary
    if (metadata.fields.any((field) => field.hasDeprecated)) {
      output.writeln(
        '// ignore_for_file: deprecated_member_use_from_same_package',
      );
      output.writeln();
    }

    // Generate mixin
    final mixinBuilder = DtoMixinBuilder(metadata);
    output.writeln(mixinBuilder.build());
    output.writeln();

    // Generate utility class (if not skipped)
    if (metadata.generateUtility) {
      final utilityBuilder = DtoUtilityBuilder(metadata);
      try {
        final utilityCode = utilityBuilder.build();
        output.writeln(utilityCode);
      } catch (e) {
        // Skip utility class generation if it fails
        print('Error generating utility class for ${metadata.name}: $e');
      }
      output.writeln();
    }

    // Generate value extension (if enabled)
    if (metadata.generateValueExtension) {
      try {
        // Skip extension generation for now as DtoExtensionBuilder is not available
        print(
            'Value extension generation is not currently supported for ${metadata.name}');
      } catch (e) {
        // Skip extension generation if it fails
        print('Error generating value extension for ${metadata.name}: $e');
      }
    }

    return output.toString();
  }

  @override
  bool get allowAbstractClasses => false;

  @override
  String get annotationName => 'MixableDto';
}
