import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:code_builder/code_builder.dart';

final _dtoMap = <String, String>{
  'EdgeInsetsGeometry': 'SpacingDto',
  'BoxConstraints': 'BoxConstraintsDto',
  'Decoration': 'DecorationDto',
};

class FieldInfo {
  final String name;
  final String type;
  final bool isNullable;

  final bool isStatic;

  final bool isLate;
  final bool isFinal;
  final bool isConst;
  final bool isSuper;
  final String typeRef;

  final List<Expression> annotations;
  final String? documentationComment;

  FieldInfo({
    required this.name,
    required this.type,
    required this.typeRef,
    required this.isNullable,
    required this.isStatic,
    required this.isLate,
    required this.isFinal,
    required this.isConst,
    required this.isSuper,
    this.annotations = const [],
    required this.documentationComment,
  });

  factory FieldInfo.fromElement(FieldElement field) {
    return FieldInfo(
      name: field.name,
      type: field.type.getDisplayString(withNullability: true),
      typeRef: field.type.getDisplayString(withNullability: false),
      isNullable: field.type.nullabilitySuffix == NullabilitySuffix.question,
      isLate: field.isLate,
      isStatic: field.isStatic,
      isConst: field.isConst,
      isFinal: field.isFinal,
      documentationComment: field.documentationComment,
      isSuper: false,
    );
  }

  Field toField({
    bool dtoType = false,
    List<String> docs = const [],
  }) {
    return Field(
      (b) {
        b
          ..name = name
          ..type = dtoType ? refer(this.dtoType) : refer(type)
          ..static = isStatic
          ..late = isLate
          ..modifier = isFinal
              ? FieldModifier.final$
              : isConst
                  ? FieldModifier.constant
                  : FieldModifier.var$
          ..annotations.addAll(annotations)
          ..docs.addAll([...docs, documentationComment ?? '']);
      },
    );
  }

  Parameter toParameter() {
    return Parameter(
      (b) => b
        ..name = name
        ..toThis = true
        ..named = true
        ..required = false
        ..toSuper = isSuper,
    );
  }

  bool get hasDto => _dtoMap[typeRef] != null;

  String get dtoType => (_dtoMap[typeRef] ?? typeRef) + (isNullable ? '?' : '');
}
