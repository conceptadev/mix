import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/annotation_helpers.dart';
import 'helpers/field_info.dart';
import 'helpers/helpers.dart';

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
      annotation: readMixableToken(element),
    );
  }

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final context = _loadContext(element);

    final output = StringBuffer();

    output.writeln(_generateTokenStruct(context));
    output.writeln(_generateTokenToDataMethod(context));
    output.writeln(_generateTokenUtilityExtension(context));
    output.writeln(_generateBuildContextMethods(context));
    output.writeln(_generateBuildContextExtension(context));

    return dartFormat(output.toString());
  }
}

const _predefinedTokens = {
  'Color': (token: 'ColorToken', utilities: ['ColorUtility'], alias: 'color'),
  'TextStyle': (
    token: 'TextStyleToken',
    utilities: ['TextStyleUtility'],
    alias: 'textStyle',
  ),
  'double': (
    token: 'SpaceToken',
    utilities: ['SpacingSideUtility', 'GapUtility'],
    alias: 'space',
  ),
  'Radius': (
    token: 'RadiusToken',
    utilities: ['RadiusUtility'],
    alias: 'radius',
  ),
};

String _kTokenStructName(String name) => '_\$${name}Struct';
String _kVariableStructName(String name) => '_struct$name';
String _kFunctionToDataName(String name) => '_\$${name}ToData';
String _kUtilityExtensionName(String name, String utility) =>
    '\$$name${utility}X';
String _kBuildContextMethodsClassName(String name) =>
    'BuildContext${name}Methods';
String _kBuildContextExtensionName(String name) => '\$BuildContext${name}X';

String _generateTokenStruct(ClassBuilderContext<MixableToken> context) {
  final type = context.annotation.type.toString();
  final settings = _predefinedTokens[type]!;

  return '''
class ${_kTokenStructName(context.name)} {
  const ${_kTokenStructName(context.name)}();

  ${context.fields.map((e) => 'final ${settings.token} ${e.name} = const ${settings.token}(\'${e.name}\');').join('\n')}
}

const ${_kVariableStructName(context.name)} = ${_kTokenStructName(context.name)}();
''';
}

String _generateTokenToDataMethod(ClassBuilderContext<MixableToken> context) {
  final type = context.annotation.type.toString();
  final settings = _predefinedTokens[type]!;

  return '''

Map<${settings.token}, $type> ${_kFunctionToDataName(context.name)}(${context.name} tokens) {
  return {
    ${context.fields.map((e) => '${_kVariableStructName(context.name)}.${e.name}: tokens.${e.name},').join('\n')}
  };
}
''';
}

String _generateTokenUtilityExtension(
  ClassBuilderContext<MixableToken> context,
) {
  final type = context.annotation.type.toString();
  final settings = _predefinedTokens[type]!;
  String result = '';

  for (final utility in settings.utilities) {
    result += '''
extension ${_kUtilityExtensionName(context.name, utility)}<T extends Attribute> on $utility<T> {
  ${context.fields.map((e) => 'T ${e.name}() => ref(${_kVariableStructName(context.classElement.name)}.${e.name});').join('\n  ')}
}
''';
  }

  return result;
}

String _generateBuildContextMethods(ClassBuilderContext<MixableToken> context) {
  return '''
class ${_kBuildContextMethodsClassName(context.name)} {
  const ${_kBuildContextMethodsClassName(context.name)}(this.context);

  final BuildContext context;

  ${context.fields.map((e) => '${e.name}() => ${_kVariableStructName(context.name)}.${e.name}.resolve(context);').join('\n')}
}
''';
}

String _generateBuildContextExtension(
  ClassBuilderContext<MixableToken> context,
) {
  final type = context.annotation.type.toString();
  final settings = _predefinedTokens[type]!;

  return '''
extension ${_kBuildContextExtensionName(context.name)} on BuildContext {
  ${_kBuildContextMethodsClassName(context.name)} get \$${settings.alias} =>
      ${_kBuildContextMethodsClassName(context.name)}(this);
}
''';
}
