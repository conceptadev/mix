import 'package:build/build.dart';
import 'src/mixable_class_utility_generator.dart';
import 'src/mixable_dto_generator.dart';
import 'src/mixable_enum_utility_generator.dart';
import 'src/mixable_spec_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder specDefinition(BuilderOptions options) => SharedPartBuilder(
      [const MixableSpecGenerator()],
      'spec',
      allowSyntaxErrors: true,
    );

Builder dtoDefinition(BuilderOptions options) => SharedPartBuilder(
      [MixableDtoGenerator()],
      'dto',
      allowSyntaxErrors: true,
    );

Builder classUtilityDefinition(BuilderOptions options) => SharedPartBuilder(
      [MixableClassUtilityGenerator()],
      'class_utility',
      allowSyntaxErrors: true,
    );

Builder enumUtilityDefinition(BuilderOptions options) => SharedPartBuilder(
      [MixableEnumUtilityGenerator()],
      'enum_utility',
      allowSyntaxErrors: true,
    );
