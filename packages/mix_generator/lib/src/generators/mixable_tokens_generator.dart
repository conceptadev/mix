import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../helpers/annotation_helpers.dart';
import '../helpers/field_info.dart';
import '../helpers/helpers.dart';

class MixableTokensGenerator extends GeneratorForAnnotation<MixableToken> {
  const MixableTokensGenerator();

  AnnotatedClassBuilderContext<MixableToken> _loadContext(Element element) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a class.',
        element: element,
      );
    }

    return AnnotatedClassBuilderContext(
      element: element,
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
    verifyIfIsValidClass(context);
    final output = StringBuffer();

    output.writeln(_generateTokenStruct(context));
    output.writeln(_generateTokenToDataMethod(context));

    if (context.annotation.utilityExtension) {
      output.writeln(_generateTokenUtilityExtension(context));
    }
    if (context.annotation.contextExtension) {
      output.writeln(_generateBuildContextMethods(context));
      output.writeln(_generateBuildContextExtension(context));
    }

    return dartFormat(output.toString());
  }
}

void verifyIfIsValidClass(AnnotatedClassBuilderContext<MixableToken> context) {
  if (context.classElement.fields.isEmpty) {
    throw InvalidGenerationSourceError(
      'The class must have at least one field.',
      element: context.classElement,
    );
  }
  if (context.classElement.constructors.isEmpty) {
    throw InvalidGenerationSourceError(
      'The class must have at least one constructor.',
      element: context.classElement,
    );
  }

  for (final param in context.classElement.fields) {
    final typeFromAnnotation = context.annotation.type.toString();

    if (!param.type.toString().contains(typeFromAnnotation)) {
      throw InvalidGenerationSourceError(
        'The constructor parameters must have the same type as the class annotation.',
        element: param,
      );
    }
  }
}

const _predefinedTokens = {
  'Color': (
    token: 'ColorToken',
    utilities: ['ColorUtility'],
    defaultNamespace: 'color',
  ),
  'TextStyle': (
    token: 'TextStyleToken',
    utilities: ['TextStyleUtility'],
    defaultNamespace: 'textStyle',
  ),
  'double': (
    token: 'SpaceToken',
    utilities: ['SpacingSideUtility', 'GapUtility'],
    defaultNamespace: 'space',
  ),
  'Radius': (
    token: 'RadiusToken',
    utilities: ['RadiusUtility'],
    defaultNamespace: 'radius',
  ),
};

String _kTokenStructName(String name) => '_\$${name}Struct';
String _kVariableStructName(String name) => '_struct$name';
String _kFunctionToMapName(String name) => '_\$${name}ToMap';
String _kUtilityExtensionName(String name, String utility) =>
    '\$$name${utility}X';
String _kBuildContextMethodsClassName(String name) =>
    'BuildContext${name}Methods';
String _kBuildContextExtensionName(String name) => '\$BuildContext${name}X';

String _generateTokenStruct(
  AnnotatedClassBuilderContext<MixableToken> context,
) {
  final type = context.annotation.type.toString();
  final settings = _predefinedTokens[type]!;

  final buffer = StringBuffer();
  buffer.writeln('class ${_kTokenStructName(context.name)} {');
  buffer.writeln('  ${_kTokenStructName(context.name)}();');
  buffer.writeln();

  for (var i = 0; i < context.fields.length; i++) {
    final field = context.classElement.fields[i];

    final annotation = getMixableSwatchColorToken(field);
    if (annotation != null) {
      buffer.writeln(
        '  final ColorSwatchToken ${field.name} = ColorSwatchToken.scale(\'${field.name}\', ${annotation.scale});',
      );
    } else {
      buffer.writeln(
        '  final ${settings.token} ${field.name} = const ${settings.token}(\'${field.name}\');',
      );
    }
  }

  buffer.writeln('}');
  buffer.writeln();
  buffer.writeln(
    'final ${_kVariableStructName(context.name)} = ${_kTokenStructName(context.name)}();',
  );

  return buffer.toString();
}

String _generateTokenToDataMethod(
  AnnotatedClassBuilderContext<MixableToken> context,
) {
  final type = context.annotation.type.toString();
  final settings = _predefinedTokens[type]!;

  return '''

Map<${settings.token}, $type> ${_kFunctionToMapName(context.name)}(${context.name} tokens) {
  return {
    ${context.fields.map((e) => '${_kVariableStructName(context.name)}.${e.name}: tokens.${e.name},').join('\n')}
  };
}
''';
}

String _generateTokenUtilityExtension(
  AnnotatedClassBuilderContext<MixableToken> context,
) {
  final type = context.annotation.type.toString();
  final settings = _predefinedTokens[type]!;
  String result = '';

  String generateMethod(int index) {
    final field = context.classElement.fields[index];

    final annotation = getMixableSwatchColorToken(field);

    if (annotation != null) {
      return 'T \$${field.name}([int step = ${annotation.defaultValue}]) => ref(${_kVariableStructName(context.name)}.${field.name}[step]);';
    }

    return 'T \$${field.name}() => ref(${_kVariableStructName(context.name)}.${field.name});';
  }

  for (final utility in settings.utilities) {
    result += '''
extension ${_kUtilityExtensionName(context.name, utility)}<T extends Attribute> on $utility<T> {
    ${[
      for (var i = 0; i < context.fields.length; i++) generateMethod(i),
    ].join('\n')}
}
''';
  }

  return result;
}

String _generateBuildContextMethods(
  AnnotatedClassBuilderContext<MixableToken> context,
) {
  String generateMethod(int index) {
    final field = context.classElement.fields[index];

    final annotation = getMixableSwatchColorToken(field);

    if (annotation != null) {
      return '${field.type} ${field.name}([int step = ${annotation.defaultValue}]) => ${_kVariableStructName(context.name)}.${field.name}[step].resolve(context);';
    }

    return '${field.type} ${field.name}() => ${_kVariableStructName(context.name)}.${field.name}.resolve(context);';
  }

  return '''
class ${_kBuildContextMethodsClassName(context.name)} {
  const ${_kBuildContextMethodsClassName(context.name)}(this.context);

  final BuildContext context;
  ${[
    for (var i = 0; i < context.fields.length; i++) generateMethod(i),
  ].join('\n')}
}
''';
}

String _generateBuildContextExtension(
  AnnotatedClassBuilderContext<MixableToken> context,
) {
  final type = context.annotation.type.toString();
  final settings = _predefinedTokens[type]!;

  return '''
extension ${_kBuildContextExtensionName(context.name)} on BuildContext {
  ${_kBuildContextMethodsClassName(context.name)} get \$${context.annotation.namespace ?? settings.defaultNamespace} =>
      ${_kBuildContextMethodsClassName(context.name)}(this);
}
''';
}

const _tokenChecker = TypeChecker.fromRuntime(MixableSwatchColorToken);

MixableSwatchColorToken? getMixableSwatchColorToken(FieldElement element) {
  final annotation = _tokenChecker.firstAnnotationOfExact(element);
  if (annotation == null) return null;

  final reader = ConstantReader(annotation);
  final scale = reader.read('scale').intValue;
  final defaultValue = reader.read('defaultValue').intValue;

  return MixableSwatchColorToken(scale: scale, defaultValue: defaultValue);
}
