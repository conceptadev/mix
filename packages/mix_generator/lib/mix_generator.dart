import 'package:build/build.dart';
import 'src/mixable_class_utility_generator.dart';
import 'src/mixable_dto_generator.dart';
import 'src/mixable_enum_utility_generator.dart';
import 'src/mixable_spec_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder specDefinition() => SharedPartBuilder(
      [const MixableSpecGenerator()],
      'spec',
      allowSyntaxErrors: true,
    );

Builder dtoDefinition() => SharedPartBuilder(
      [const MixableDtoGenerator()],
      'dto',
      allowSyntaxErrors: true,
    );

Builder classUtilityDefinition() => SharedPartBuilder(
      [const MixableClassUtilityGenerator()],
      'class_utility',
      allowSyntaxErrors: true,
    );

Builder enumUtilityDefinition() => SharedPartBuilder(
      [const MixableEnumUtilityGenerator()],
      'enum_utility',
      allowSyntaxErrors: true,
    );
