import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'dart_type_ext.dart';
import 'package:source_gen/source_gen.dart';

const _specChecker = TypeChecker.fromRuntime(MixableSpec);
const _utilityChecker = TypeChecker.fromRuntime(MixableUtility);

MixableSpec readMixableSpec(ClassElement classElement) {
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
    withLerp: reader.read('withLerp').boolValue,
    skipUtility: reader.read('skipUtility').boolValue,
    prefix: prefix.isEmpty ? classElement.name : prefix,
  );
}

MixableUtility readMixableUtility(ClassElement classElement) {
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
    alias: utilityAlias,
    type: utilityName,
    properties: extraUtilities,
  );
}

MixableUtilityProps _getMixableUtilityAlias(ConstantReader reader) {
  final path = reader.read('path').stringValue;
  final alias = reader.read('alias').stringValue;

  return (path: path, alias: alias);
}

MixableProperty readMixableProperty(FieldElement element) {
  const checker = TypeChecker.fromRuntime(MixableProperty);
  final annotation = checker.firstAnnotationOf(element);
  if (annotation is! DartObject) {
    return const MixableProperty();
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

  final isLerpable = reader.peek('isLerpable')?.boolValue ?? true;

  return MixableProperty(
    dto: dto == null ? null : _getMixableDto(dto),
    utilities: utilities,
    isLerpable: isLerpable,
  );
}

MixableFieldDto? _getMixableDto(ConstantReader? reader) {
  if (reader == null) return null;

  return MixableFieldDto(type: reader.typeAsString);
}
