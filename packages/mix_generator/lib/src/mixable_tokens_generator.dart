import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/field_info.dart';

class MixableTokensGenerator extends GeneratorForAnnotation<MixableToken> {
  const MixableTokensGenerator();

  ClassBuilderContext<MixableToken> _loadContext(Element element) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a class.',
        element: element,
      );
    }

    return ClassBuilderContext(
      classElement: element,
      annotation: const MixableToken(),
    );
  }

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader reader,
    BuildStep buildStep,
  ) async {
    final context = _loadContext(element);

    final classDef = Class(
      (b) => b
        ..name = '_\$${element.name!}Struct'
        ..constructors.add(Constructor((c) => c.constant = true))
        ..fields.addAll(
          context.fields.map(
            (e) => Field(
              (f) => f
                ..name = e.name
                ..modifier = FieldModifier.final$
                ..type = refer('ColorToken')
                ..assignment = Code('const ColorToken(\'${e.name}\')'),
            ),
          ),
        ),
    );

    final tokenVariable = Field(
      (f) => f
        ..name = '_tokens'
        ..modifier = FieldModifier.constant
        ..assignment = Code('_\$${element.name!}Struct()'),
    );

    final tokensToDataMethod = Method(
      (m) => m
        ..name = '_\$TokensToData'
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'tokens'
              ..required = false
              ..type = refer('ColorTokens'),
          ),
        )
        ..returns = refer('Map<ColorToken, Color>')
        ..body = Code(
          'return {${context.fields.map((e) => '${tokenVariable.name}.${e.name}: tokens.${e.name},').join('\n')}};',
        ),
    );

    final colorUtilXDef = Extension(
      (b) => b
        ..name = '\$${element.name!}X'
        ..on = refer('ColorUtility<T>')
        ..types.add(refer('T extends Attribute'))
        ..methods.addAll(
          context.fields.map(
            (e) => Method((m) => m
              ..name = e.name
              ..returns = refer('T')
              ..lambda = true
              ..body =
                  Block.of([Code('ref(${tokenVariable.name}.${e.name})')])),
          ),
        ),
    );

    final buildContextXDef = Extension(
      (b) => b
        ..name = '\$BuildContext${element.name!}X'
        ..on = refer('BuildContext')
        ..methods.addAll(
          context.fields.map(
            (e) => Method(
              (m) => m
                ..name = e.name
                ..returns = refer('Color')
                ..lambda = true
                ..body = Block.of(
                  [Code('${tokenVariable.name}.${e.name}.resolve(this)')],
                ),
            ),
          ),
        ),
    );

    final library = Library(
      (b) => b
        ..body.addAll([
          classDef,
          tokenVariable,
          tokensToDataMethod,
          colorUtilXDef,
          buildContextXDef,
        ]),
    );

    final emitter = DartEmitter();

    return DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
    ).format(library.accept(emitter).toString());
  }
}
