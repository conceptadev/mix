import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

/// Reads the [MixableProperty] annotation from a field element
MixableProperty readMixableProperty(FieldElement element) {
  const checker = TypeChecker.fromRuntime(MixableProperty);
  final annotation = checker.firstAnnotationOf(element);
  
  if (annotation is! DartObject) {
    return const MixableProperty();
  }
  
  return _getMixableProperty(ConstantReader(annotation));
}

/// Reads the [MixableSpec] annotation from a class element
MixableSpec readMixableSpec(ClassElement element) {
  const checker = TypeChecker.fromRuntime(MixableSpec);
  final annotation = checker.firstAnnotationOfExact(element);

  if (annotation == null) {
    throw InvalidGenerationSourceError(
      'No MixableSpec annotation found on the class',
      element: element,
    );
  }

  final reader = ConstantReader(annotation);
  final prefix = reader.read('prefix').stringValue;

  return MixableSpec(
    withCopyWith: reader.read('withCopyWith').boolValue,
    withEquality: reader.read('withEquality').boolValue,
    withLerp: reader.read('withLerp').boolValue,
    skipUtility: reader.read('skipUtility').boolValue,
    prefix: prefix.isEmpty ? element.name : prefix,
  );
}

/// Reads the [MixableDto] annotation from a class element
MixableDto readMixableDto(ClassElement element) {
  const checker = TypeChecker.fromRuntime(MixableDto);
  final annotation = checker.firstAnnotationOfExact(element);

  if (annotation == null) {
    throw InvalidGenerationSourceError(
      'No MixableDto annotation found on the class',
      element: element,
    );
  }

  final reader = ConstantReader(annotation);

  return MixableDto(
    mergeLists: reader.read('mergeLists').boolValue,
    generateValueExtension: reader.read('generateValueExtension').boolValue,
    generateUtility: reader.read('generateUtility').boolValue,
  );
}

/// Reads the [MixableToken] annotation from a class element
MixableToken readMixableToken(ClassElement element) {
  const checker = TypeChecker.fromRuntime(MixableToken);
  final annotation = checker.firstAnnotationOfExact(element);

  if (annotation == null) {
    throw InvalidGenerationSourceError(
      'No MixableToken annotation found on the class',
      element: element,
    );
  }
  final reader = ConstantReader(annotation);
  final type = reader.read('type').typeValue;

  return MixableToken(
    type,
    namespace: reader.read('namespace').isNull
        ? null
        : reader.read('namespace').stringValue,
    utilityExtension: reader.read('utilityExtension').boolValue,
    contextExtension: reader.read('contextExtension').boolValue,
  );
}

/// Extracts [MixableProperty] data from a [ConstantReader]
MixableProperty _getMixableProperty(ConstantReader reader) {
  final dtoReader = reader.peek('dto');
  
  final utilities = reader
      .peek('utilities')
      ?.listValue
      .map((e) => _readMixableUtility(ConstantReader(e)))
      .toList();
  
  final isLerpable = reader.peek('isLerpable')?.boolValue ?? true;
  
  return MixableProperty(
    dto: dtoReader != null ? _getMixableDto(dtoReader) : null,
    utilities: utilities,
    isLerpable: isLerpable,
  );
}

/// Extracts [MixableFieldDto] data from a [ConstantReader]
MixableFieldDto? _getMixableDto(ConstantReader reader) {
  final typeString = reader.peek('type')?.typeAsString ?? 
                     reader.peek('type')?.stringValue;
  
  if (typeString == null) return null;
  
  return MixableFieldDto(type: typeString);
}

/// Reads a [MixableUtility] from a [ConstantReader]
MixableUtility _readMixableUtility(ConstantReader reader) {
  String? utilityName;
  
  final typeReader = reader.peek('type');
  if (typeReader?.isString == true) {
    utilityName = typeReader!.stringValue;
  } else if (typeReader?.isType == true) {
    utilityName = typeReader!.typeValue.element!.name!;
  }
  
  final utilityAlias = reader.peek('alias')?.stringValue;
  
  final properties = reader
      .peek('properties')
      ?.listValue
      .map((e) => _getMixableUtilityProps(ConstantReader(e)))
      .toList() ?? [];
  
  return MixableUtility(
    alias: utilityAlias,
    type: utilityName,
    properties: properties,
  );
}

/// Extracts [MixableUtilityProps] data from a [ConstantReader]
MixableUtilityProps _getMixableUtilityProps(ConstantReader reader) {
  final path = reader.read('path').stringValue;
  final alias = reader.read('alias').stringValue;
  
  return (path: path, alias: alias);
}

/// Extension to get typeAsString from a ConstantReader
extension ConstantReaderX on ConstantReader {
  String? get typeAsString {
    final peakedType = peek('type');
    
    if (peakedType?.isString == true) {
      return peakedType!.stringValue;
    } else if (peakedType?.isType == true) {
      return peakedType!.typeValue.element!.name;
    }
    
    return null;
  }
}