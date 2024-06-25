import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/dart_type_ext.dart';
import 'package:mix_generator/src/helpers/helpers.dart';

String abstractEnumUtility(UtilityAnnotationContext context) {
  final className = context.name;
  final mixinName = context.mixinExtensionName;

  final valueType = context.valueType;
  final valueTypeName = valueType.getTypeAsString();

  String fieldStatements;

  if (valueType.isEnum) {
    fieldStatements = _generateMethodStatementsFromEnum(context);
  } else {
    fieldStatements = _generateMethodFromStaticConstant(context);
  }

  final comments = '''
/// {@template ${className.snakecase}}
/// A utility class for creating [Attribute] instances from [$valueTypeName] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [$valueTypeName] values.
/// {@endtemplate}
''';

  return '''
$comments
abstract class $mixinName<T extends Attribute> extends ScalarUtility<T,$valueTypeName> {

$fieldStatements

}
''';
}

String utilityMixin(UtilityAnnotationContext context) {
  final className = context.name;
  final mixinName = context.mixinExtensionName;

  final valueType = context.valueType;
  final valueTypeName = valueType.getTypeAsString();

  String fieldStatements;

  if (valueType.isEnum) {
    fieldStatements = _generateMethodStatementsFromEnum(context);
  } else {
    fieldStatements = _generateMethodFromStaticConstant(context);
  }

  final comments = '''
/// {@template ${className.snakecase}}
/// A utility class for creating [Attribute] instances from [$valueTypeName] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [$valueTypeName] values.
/// {@endtemplate}
''';

  return '''
$comments
base mixin $mixinName<T extends Attribute> on MixUtility<T,$valueTypeName> {

$fieldStatements

}
''';
}

String _generateMethodFromStaticConstant(UtilityAnnotationContext context) {
  final fields = context.fields;
  final buffer = StringBuffer();

  final type = (context.annotation.type ?? context.valueType).getTypeAsString();

  fields.forEach((field) {
    final name = field.name;

    if (name == 'values') return;

    buffer.writeln(
      '/// Creates an [Attribute] instance with [$type.$name] value.',
    );
    buffer.writeln('T $name() => builder($type.$name);');
  });

  return buffer.toString();
}

String _generateMethodStatementsFromEnum(UtilityAnnotationContext context) {
  final fields = context.fields;

  final buffer = StringBuffer();

  fields.forEach((field) {
    final name = field.name;
    final type = field.type;

    if (name == 'values') return;

    buffer.writeln(
        '/// Creates an [Attribute] instance with [$type.$name] value.');
    buffer.writeln('T $name() => builder($type.$name);');
  });

  return buffer.toString();
}
