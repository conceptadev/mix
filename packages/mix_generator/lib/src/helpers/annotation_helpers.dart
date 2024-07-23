import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/helpers/dart_type_ext.dart';
import 'package:source_gen/source_gen.dart';

final _specChecker = TypeChecker.fromRuntime(MixableSpec);
final _utilityChecker = TypeChecker.fromRuntime(MixableUtility);

MixableSpec readMixableSpec(
  ClassElement classElement,
) {
  final annotation = _specChecker.firstAnnotationOfExact(classElement);

  if (annotation == null) {
    throw InvalidGenerationSource(
      'No MixableSpec annotation found on the class',
      element: classElement,
    );
  }

  final reader = ConstantReader(annotation);

  final prefix = reader.read('prefix').stringValue;
  return MixableSpec(
    withCopyWith: reader.read('withCopyWith').boolValue,
    withEquality: reader.read('withEquality').boolValue,
    skipUtility: reader.read('skipUtility').boolValue,
    prefix: prefix.isEmpty ? classElement.name : prefix,
    withLerp: reader.read('withLerp').boolValue,
  );
}

MixableUtility readMixableUtility(
  ClassElement classElement,
) {
  final annotation = _utilityChecker.firstAnnotationOfExact(classElement);

  if (annotation == null) {
    throw InvalidGenerationSource(
      'No MixableUtility annotation found on the class',
      element: classElement,
    );
  }

  return _readMixableUtility(annotation);
}

MixableUtility _readMixableUtility(DartObject object) {
  final reader = ConstantReader(object);
  final peakedType = reader.peek('type');

  String? utilityName;

  if (peakedType?.isString == true) {
    utilityName = peakedType!.stringValue;
  } else if (peakedType?.isType == true) {
    utilityName = peakedType!.typeValue.element!.name!;
  }

  final utilityAlias = reader.peek('alias')?.stringValue;

  final extraUtilities = reader
      .read('properties')
      .listValue
      .map((e) => _getMixableUtilityAlias(ConstantReader(e)))
      .toList();

  return MixableUtility(
    type: utilityName,
    alias: utilityAlias,
    properties: extraUtilities,
  );
}

MixableUtilityProps _getMixableUtilityAlias(ConstantReader reader) {
  final path = reader.read('path').stringValue;
  final alias = reader.read('alias').stringValue;

  return (path: path, alias: alias);
}

MixableProperty readMixableProperty(
  FieldElement element,
) {
  const defaults = MixableProperty();

  const checker = TypeChecker.fromRuntime(MixableProperty);
  final annotation = checker.firstAnnotationOf(element);
  if (annotation is! DartObject) {
    return defaults;
  }

  return _getMixableProperty(ConstantReader(annotation));
}

MixableProperty _getMixableProperty(ConstantReader reader) {
  final dto = reader.peek('dto');
  final utilities = reader
      .peek('utilities')
      ?.listValue
      .map((e) => _readMixableUtility(e))
      .toList();

  return MixableProperty(
    dto: dto == null ? null : _getMixableDto(dto),
    utilities: utilities,
  );
}

MixableFieldDto? _getMixableDto(ConstantReader? reader) {
  if (reader == null) return null;

  return MixableFieldDto(type: reader.typeAsString);
}
