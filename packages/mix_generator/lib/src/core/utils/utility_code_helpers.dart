import 'package:analyzer/dart/element/element.dart';

/// Parameter information for code generation
class ParameterInfo {
  final String signature;
  final String invocation;

  const ParameterInfo({required this.signature, required this.invocation});
}

/// Element information for utility generation
class ElementInfo {
  final ClassElement fieldElement;
  final ClassElement constructorElement;
  final ClassElement mappingElement;

  const ElementInfo({
    required this.fieldElement,
    required this.constructorElement,
    required this.mappingElement,
  });
}
