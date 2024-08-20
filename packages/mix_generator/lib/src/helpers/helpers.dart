import 'package:analyzer/dart/element/element.dart' show ClassElement;
import 'package:dart_style/dart_style.dart';
import 'field_info.dart';

/// Returns parameter names or full parameters declaration declared by this class or an empty string.
///
/// If `nameOnly` is `true`: `class MyClass<T extends String, Y>` returns `<T, Y>`.
///
/// If `nameOnly` is `false`: `class MyClass<T extends String, Y>` returns `<T extends String, Y>`.
String typeParametersString(ClassElement classElement, bool nameOnly) {
  final names = classElement.typeParameters
      .map(
        (e) => nameOnly ? e.name : e.getDisplayString(withNullability: true),
      )
      .join(',');
  if (names.isNotEmpty) {
    return '<$names>';
  }

  return '';
}

/// Returns constructor for the given type and optional named constructor name. E.g. "TestConstructor" or "TestConstructor._private" when "_private" constructor name is provided.
String constructorFor(String typeAnnotation, String? namedConstructor) =>
    "$typeAnnotation${namedConstructor == null ? "" : ".$namedConstructor"}";

extension StringX on String {
  /// Returns a new string with the first character in upper case.
  String get capitalize {
    if (isEmpty) {
      return this;
    }

    return this[0].toUpperCase() + substring(1);
  }

  String get lowercaseFirst {
    if (isEmpty) {
      return this;
    }

    return this[0].toLowerCase() + substring(1);
  }

  String get snakecase {
    return replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), '_').toLowerCase();
  }
}

String buildConstructorParams(
  List<ParameterInfo> params,
  String Function(ParameterInfo) buildParam,
) {
  if (params.isEmpty) return '';

  final buffer = StringBuffer();
  final positionalParams = <ParameterInfo>[];
  final namedParams = <ParameterInfo>[];

  for (final param in params) {
    if (param.isPositional) {
      positionalParams.add(param);
    } else {
      namedParams.add(param);
    }
  }

  if (positionalParams.isNotEmpty) {
    buffer.write(positionalParams.map(buildParam).join(', '));
  }
  if (buffer.isNotEmpty) buffer.write(', ');
  if (namedParams.isNotEmpty) {
    buffer.write(namedParams
        .map((param) => '${param.name}: ${buildParam(param)}')
        .join(', '));

    buffer.write(', ');
  }

  return buffer.toString();
}

String buildConstructorParamsAsNamed(
  List<ParameterInfo> params,
  String Function(ParameterInfo) buildParam,
) {
  if (params.isEmpty) return '';

  final buffer = StringBuffer();

  for (final param in params) {
    buffer.write('${param.name}: ${buildParam(param)}');
    buffer.write(', ');
  }

  return buffer.toString();
}

final _formatter = DartFormatter(pageWidth: 80, fixes: StyleFix.all);

String dartFormat(String contents) {
  try {
    return _formatter.format(contents);
  } catch (e) {
    print('Generating: $contents');
    rethrow;
  }
}
