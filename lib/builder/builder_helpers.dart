import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:code_builder/code_builder.dart';

import 'types.dart';

final _dtoMap = {
  'EdgeInsetsGeometry': 'SpacingDto',
  'BoxConstraints': 'BoxConstraintsDto',
  'Decoration': 'DecorationDto',
  'Color': 'ColorDto',
  'AnimatedData': 'AnimatedDataDto',
};

Expression _getLerpExpression(String name, String type) {
  final expression = [refer(name), refer('other.$name'), refer('t')];

  switch (type) {
    case 'double':
      return DartTypes.ui.lerpDouble(expression);
    case 'int':
      return DartTypes.ui
          .lerpDouble(expression)
          .nullSafeProperty('toInt')
          .call([]).nullSafeProperty(name);
    case 'EdgeInsetsGeometry':
      return FlutterTypes.widgets.edgeInsetsGeometry
          .property('lerp')(expression);
    case 'BoxConstraints':
      return FlutterTypes.widgets.boxConstraints.property('lerp')(expression);
    case 'Decoration':
      return FlutterTypes.widgets.decoration.property('lerp')(expression);
    case 'AlignmentGeometry':
      return FlutterTypes.widgets.alignmentGeometry
          .property('lerp')(expression);
    case 'Matrix4':
      return FlutterTypes.widgets.matrix4Tween
          .newInstance(
            [],
            {'begin': refer(name), 'end': refer('other.$name')},
          )
          .property('lerp')
          .call([refer('t')]);

    default:
      return CodeExpression(Code('t < 0.5 ? $name : other.$name'));
  }
}

class FieldInfo {
  final String name;

  final bool isNullable;
  final bool isSuper;
  final String type;
  final List<String> annotations;
  final String? documentationComment;

  const FieldInfo({
    required this.name,
    required this.type,
    required this.isNullable,
    required this.isSuper,
    this.annotations = const [],
    required this.documentationComment,
  });

  factory FieldInfo.fromElement(FieldElement field) {
    return FieldInfo(
      name: field.name,
      type: field.type.getDisplayString(withNullability: false),
      isNullable: field.type.nullabilitySuffix == NullabilitySuffix.question,
      isSuper: false,
      documentationComment: field.documentationComment,
    );
  }

  bool get hasComment => documentationComment != null;

  String get typeAsNullable => type + (isNullable ? '?' : '');

  Expression get lerpExpression => _getLerpExpression(name, type);

  bool get hasDto => _dtoMap[type] != null;

  String get dtoType => (_dtoMap[type] ?? type) + (isNullable ? '?' : '');

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isNullable': isNullable,
      'isSuper': isSuper,
      'type': type,
      'annotations': annotations,
      'documentationComment': documentationComment,
      'hasDto': hasDto,
      'dtoType': dtoType,
      'lerpExpression': lerpExpression,
      'typeAsNullable': typeAsNullable,
      'hasComment': hasComment,
    };
  }
}

extension ListFieldInfoExt on List<FieldInfo> {
  List<FieldInfo> get nonSuper {
    return where((f) => !f.isSuper).toList();
  }

  List<Field> get classFields {
    return nonSuper.map(_fieldInfoFieldBuilder).toList();
  }

  List<Field> get classDtoFields {
    return nonSuper.map(_fieldInfoDtoFieldBuilder).toList();
  }

  List<Parameter> get constructorParams {
    return map(_fieldAsNamedConstructorParamBuilder).toList();
  }

  List<Parameter> get methodParams {
    return map(_fieldAsNamedMethodParamBuilder).toList();
  }
}

Field _fieldInfoFieldBuilder(FieldInfo field) {
  return Field((b) {
    b
      ..name = field.name
      ..type = refer(field.typeAsNullable)
      ..modifier = FieldModifier.final$
      ..annotations.addAll(field.annotations.map(refer))
      ..docs.add(field.documentationComment ?? '');
  });
}

Field _fieldInfoDtoFieldBuilder(FieldInfo field) {
  return Field((b) {
    b
      ..name = field.name
      ..type = refer(field.dtoType)
      ..modifier = FieldModifier.final$;
  });
}

Parameter _fieldAsNamedConstructorParamBuilder(FieldInfo field) {
  return Parameter((b) {
    b.name = field.name;
    b.toThis = !field.isSuper;
    b.named = true;
    b.required = false;
    b.toSuper = field.isSuper;
  });
}

Parameter _fieldAsNamedMethodParamBuilder(FieldInfo field) {
  return Parameter((builder) {
    builder.name = field.name;
    builder.named = true;
    builder.required = false;
    builder.type = refer('${field.type}?');
  });
}
