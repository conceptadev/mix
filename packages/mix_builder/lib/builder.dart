import 'package:build/build.dart';
import 'package:mix_builder/src/spec_definition_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder specDefinition(BuilderOptions options) =>
    PartBuilder([SpecDefinitionBuilder()], '.spec.dart',
        allowSyntaxErrors: true, options: options);
