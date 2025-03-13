import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../core/models/spec_metadata.dart';
import '../core/spec/spec_attribute_builder.dart';
import '../core/spec/spec_mixin_builder.dart';
import '../core/spec/spec_tween_builder.dart';
import '../core/spec/spec_utility_builder.dart';
import '../core/utils/base_generator.dart';

/// Generator for classes annotated with [MixableSpec].
///
/// This generator produces:
/// - A mixin with spec functionality
/// - An attribute class for the spec
/// - A utility class for the spec (if not skipped)
/// - A tween class for the spec
class MixableSpecGenerator extends BaseMixGenerator<MixableSpec, SpecMetadata> {
  MixableSpecGenerator() : super(const TypeChecker.fromRuntime(MixableSpec));

  @override
  Future<SpecMetadata> createMetadata(
    ClassElement element,
    BuildStep buildStep,
  ) async {
    validateClassElement(element);

    return SpecMetadata.fromAnnotation(
      element,
      ConstantReader(typeChecker.firstAnnotationOfExact(element)),
    );
  }

  @override
  String generateForMetadata(SpecMetadata metadata, BuildStep buildStep) {
    final output = StringBuffer();

    // Add warning ignore if necessary
    if (metadata.fields.any((field) => field.hasDeprecated)) {
      output.writeln(
        '// ignore_for_file: deprecated_member_use_from_same_package',
      );
      output.writeln();
    }

    // Generate mixin
    final mixinBuilder = SpecMixinBuilder(metadata);
    output.writeln(mixinBuilder.build());
    output.writeln();

    // Generate attribute class
    final attributeBuilder = SpecAttributeBuilder(metadata);
    output.writeln(attributeBuilder.build());
    output.writeln();

    // Generate utility class (if not skipped)
    if (!metadata.skipUtility) {
      final utilityBuilder = SpecUtilityBuilder(metadata);
      output.writeln(utilityBuilder.build());
      output.writeln();
    }

    // Generate tween class
    final tweenBuilder = SpecTweenBuilder(metadata);
    output.writeln(tweenBuilder.build());

    return output.toString();
  }

  @override
  bool get allowAbstractClasses => false;

  @override
  String get annotationName => 'MixableSpec';
}
