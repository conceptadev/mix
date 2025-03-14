import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:logging/logging.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../core/dto/dto_extension_builder.dart';
import '../core/dto/dto_mixin_builder.dart';
import '../core/dto/dto_utility_builder.dart';
import '../core/metadata/dto_metadata.dart';
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
    print('Creating metadata for ${element.name}');

    final metadata = DtoMetadata.fromAnnotation(
      element,
      ConstantReader(typeChecker.firstAnnotationOfExact(element)),
    );

    print('  Created metadata for ${metadata.name}');
    print('  Fields: ${metadata.fields.map((f) => f.name).join(', ')}');
    print(
      '  Has custom merge method: ${element.methods.any((m) => m.name == 'merge')}',
    );

    return metadata;
  }

  @override
  String generateForMetadata(DtoMetadata metadata, BuildStep buildStep) {
    print('Generating code for ${metadata.name}');
    final output = StringBuffer();

    // Add warning ignore if necessary
    if (metadata.fields.any((field) => field.hasDeprecated)) {
      output.writeln(
        '// ignore_for_file: deprecated_member_use_from_same_package',
      );
      output.writeln();
    }

    // Generate mixin
    print('  Generating mixin for ${metadata.name}');
    final mixinBuilder = DtoMixinBuilder(metadata);
    output.writeln(mixinBuilder.build());
    output.writeln();

    // Generate utility class (if not skipped)
    if (metadata.generateUtility) {
      print('  Generating utility class for ${metadata.name}');
      final utilityBuilder = DtoUtilityBuilder(metadata);
      try {
        final utilityCode = utilityBuilder.build();
        output.writeln(utilityCode);
      } catch (e) {
        // Skip utility class generation if it fails
        _logger
            .warning('Error generating utility class for ${metadata.name}: $e');
        print('  Error generating utility class: $e');
      }
      output.writeln();
    }

    // Generate value extension (if enabled)
    if (metadata.generateValueExtension) {
      print('  Generating value extension for ${metadata.name}');
      try {
        final extensionBuilder = DtoExtensionBuilder(metadata);
        final extensionCode = extensionBuilder.build();
        output.writeln(extensionCode);
      } catch (e) {
        // Skip extension generation if it fails
        _logger.warning(
          'Error generating value extension for ${metadata.name}: $e',
        );
        print('  Error generating value extension: $e');
      }
    }

    print('  Code generation complete for ${metadata.name}');

    return output.toString();
  }

  @override
  bool get allowAbstractClasses => false;

  @override
  String get annotationName => 'MixableDto';
}
