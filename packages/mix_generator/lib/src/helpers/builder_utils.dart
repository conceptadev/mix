// // ignore_for_file: unnecessary-trailing-comma

// import 'package:analyzer/dart/element/element.dart';
// import 'package:analyzer/dart/element/type.dart';
// import 'package:build/build.dart';
// import 'package:collection/collection.dart';

// import 'type_extension.dart';

// class MixHelperRef {
//   const MixHelperRef._();

//   static String get _refName => 'MixHelpers';

//   static String get deepEquality => '$_refName.deepEquality';

//   static String get lerpDouble => '$_refName.lerpDouble';

//   static String get mergeList => '$_refName.mergeList';

//   static String get lerpStrutStyle => '$_refName.lerpStrutStyle';

//   static String get lerpMatrix4 => '$_refName.lerpMatrix4';

//   static String get lerpTextStyle => '$_refName.lerpTextStyle';

//   static String get lerpInt => '$_refName.lerpInt';

//   static String get lerpShadowList => '$_refName.lerpShadowList';
// }

// abstract class AnnotationContext<T> {
//   final ClassElement element;

//   AnnotationContext({
//     required this.element,
//   });
// }

// class EnumUtilityAnnotationContext extends AnnotationContext {
//   final EnumElement enumElement;
//   final bool generateCallMethod;
//   EnumUtilityAnnotationContext({
//     required super.element,
//     required this.enumElement,
//     required this.generateCallMethod,
//   });

//   String get name => element.name;

//   String get generatedName => element.generatedName;
// }

// class ClassUtilityAnnotationContext extends AnnotationContext {
//   final ClassElement valueElement;
//   final ClassElement? mappingElement;
//   final bool generateCallMethod;
//   ClassUtilityAnnotationContext({
//     required super.element,
//     required this.valueElement,
//     required this.mappingElement,
//     required this.generateCallMethod,
//   });
// }

// extension EnumElementX on EnumElement {
//   List<String> get values {
//     final valuesField = getField('values');
//     final valuesObject = valuesField?.computeConstantValue();

//     if (valuesObject != null && valuesObject.toListValue() != null) {
//       return valuesObject
//           .toListValue()!
//           .map((obj) {
//             final enumField = obj.getField('_name');

//             return enumField?.toStringValue();
//           })
//           .whereType<String>()
//           .toList();
//     }

//     return [];
//   }
// }

// extension ClassElementX on ClassElement {
//   bool get isConst => unnamedConstructor?.isConst ?? false;

//   bool get hasUnamedConstructor => unnamedConstructor != null;

//   ClassElement get genericSuperType =>
//       getGenericTypeOfSuperclass()!.element as ClassElement;

//   bool get hasDiagnosticable =>
//       allSupertypes.any((e) => e.element.name == 'Diagnosticable');

//   ConstructorElement get defaultConstructor {
//     final selectedConstructor = constructors.firstWhereOrNull((element) {
//       return element.isDefaultConstructor ||
//           element.isUnamedConstructor ||
//           element.isPrivateConstructor;
//     });
//     if (selectedConstructor == null) {
//       throw Exception('No default constructor found for class $name');
//     }

//     return selectedConstructor;
//   }

//   List<String> get methodNames => methods.map((e) => e.name).toList();

//   List<String> get mixinNames => mixins.map((e) => e.displayType).toList();

//   List<String> get interfaceNames =>
//       interfaces.map((e) => e.displayType).toList();

//   DartType? getGenericTypeOfSuperclass() {
//     final supertype = this.supertype;
//     if (supertype != null) {
//       return supertype.typeArguments.firstOrNull;
//     }

//     return null;
//   }

//   String get generatedName => '_\$$name';
// }

// Future<ClassElement?> getClassElementForTypeName(
//   BuildStep buildStep,
//   String typeName,
// ) async {
//   final libraryElement = await buildStep.inputLibrary;

//   // Look for the type in the current library
//   var classElement = libraryElement.getClass(typeName);
//   if (classElement != null) {
//     return classElement;
//   }

//   // If not found, search in the imported libraries
//   for (var importedLibrary in libraryElement.importedLibraries) {
//     classElement = importedLibrary.getClass(typeName);
//     if (classElement != null) {
//       return classElement;
//     }
//   }

//   // Type not found in the current library or its imports
//   return null;
// }

// String kDefaultValueRef = 'defaultValue';
