import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:logging/logging.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../core/metadata/base_metadata.dart';
import '../core/metadata/resolvable_metadata.dart';
import '../core/resolvable/resolvable_extension_builder.dart';
import '../core/resolvable/resolvable_mixin_builder.dart';
import '../core/resolvable/resolvable_utility_builder.dart';
import '../core/utils/utils.dart';

/// Generator for classes annotated with [MixableResolvable].
///
/// This generator produces:
/// - A mixin with Resolvable functionality
/// - A utility class for the DTO (if not skipped)
/// - A value extension (if enabled)
class MixableResolvableGenerator
    extends BaseMixGenerator<MixableResolvable, ResolvableMetadata> {
  final Logger _logger = Logger('MixableResolvableGenerator');

  MixableResolvableGenerator()
      : super(const TypeChecker.fromRuntime(MixableResolvable));

  @override
  Future<ResolvableMetadata> createMetadata(
    ClassElement element,
    BuildStep buildStep,
  ) async {
    validateClassElement(element);

    final annotation = readMixableResolvable(element);

    final metadata = ResolvableMetadata.fromAnnotation(element, annotation);

    return metadata;
  }

  @override
  String generateForMetadata(
    ResolvableMetadata metadata,
    BuildStep buildStep,
  ) {
    final output = StringBuffer();

    // Add warning ignore if necessary
    if (metadata.parameters.any((field) => field.hasDeprecated)) {
      output.writeln(
        '// ignore_for_file: deprecated_member_use_from_same_package',
      );
      output.writeln();
    }

    // Generate mixin

    final mixinBuilder = ResolvableMixinBuilder(metadata);
    output.writeln(mixinBuilder.build());
    output.writeln();

    // Generate utility class (if not skipped)
    if (metadata.generatedComponents.hasFlag(
      GeneratedResolvableComponents.utility,
    )) {
      final utilityBuilder = ResolvableUtilityBuilder(metadata);
      try {
        final utilityCode = utilityBuilder.build();
        output.writeln(utilityCode);
      } catch (e) {
        // Skip utility class generation if it fails
        _logger
            .warning('Error generating utility class for ${metadata.name}: $e');
      }
      output.writeln();
    }

    // Generate value extension (if enabled)
    if (metadata.generatedComponents.hasFlag(
      GeneratedResolvableComponents.resolvableExtension,
    )) {
      try {
        final extensionBuilder = ResolvableExtensionBuilder(metadata);
        final extensionCode = extensionBuilder.build();
        output.writeln(extensionCode);
      } catch (e) {
        // Skip extension generation if it fails
        _logger.warning(
          'Error generating value extension for ${metadata.name}: $e',
        );
      }
    }

    return output.toString();
  }

  @override
  bool get allowAbstractClasses => false;

  @override
  String get annotationName => 'MixableResolvable';
}
