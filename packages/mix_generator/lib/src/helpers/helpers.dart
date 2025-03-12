import 'package:dart_style/dart_style.dart';

import 'field_info.dart';

/// Returns constructor for the given type and optional named constructor name. E.g. "TestConstructor" or "TestConstructor._private" when "_private" constructor name is provided.
String constructorFor(String typeAnnotation, String? namedConstructor) =>
    "$typeAnnotation${namedConstructor == null ? "" : ".$namedConstructor"}";

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
  return _formatter.format(contents);
}
