// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';

import 'builder_utils.dart';
import 'type_ref_repository.dart';

extension DartTypeExtension on DartType {
  bool isAssignableTo(DartType other) {
    final self = this;

    if (self is InterfaceType) {
      final library = self.element.library;

      return library.typeSystem.isAssignableTo(this, other);
    }

    return true;
  }

  String getTypeAsString() {
    final thisElement = element;

    // Check if element is a list
    if (thisElement is ClassElement &&
        !isDartCoreList &&
        !isDartCoreMap &&
        !isDartCoreSet &&
        !isDartCoreObject) {
      return thisElement.name;
    }

    return getDisplayString(withNullability: false);
  }

  ClassElement? get classElement {
    return element is ClassElement ? element as ClassElement : null;
  }

  InterfaceType? get interfaceType {
    return this is InterfaceType ? this as InterfaceType : null;
  }

  DartType? tryGetTypeGeneric() {
    if (this is ParameterizedType) {
      final type = this as ParameterizedType;
      if (type.typeArguments.isNotEmpty) {
        return type.typeArguments.firstOrNull;
      }
    }

    return null;
  }

  DartType getGenericType() {
    final type = tryGetTypeGeneric();
    if (type != null) {
      return type;
    }
    throw Exception(type?.getTypeAsString() ?? '' 'has no type generic');
  }

  bool get isEnum {
    final self = this;

    return self is InterfaceType && self.element is EnumElement;
  }

  bool get isDto => _isMixType($Dto);

  bool get isSpec => _isMixType($Spec);

  bool get isSpecAttribute => _isMixType($SpecAttribute);

  bool get isWidgetModifier => _isMixType($WidgetModifierSpec);

  bool _isMixType(String className) {
    final self = this;
    if (self is! InterfaceType) return false;

    return self.allSupertypes.any((type) {
      final hasType = type.element.name == className;
      final isMixPackage = type.element.isMixRef;

      if (hasType && isMixPackage) {
        return true;
      }

      if (isMixPackage) {
        // Check if the current type or any of its supertypes has the specified className
        return type.element.allSupertypes.any((supertype) {
          return supertype.element.name == className;
        });
      }

      return false;
    });
  }

  String get displayType => getTypeAsString();

  bool get isNullableType =>
      this is DynamicType || nullabilitySuffix == NullabilitySuffix.question;

  /// Returns `true` if `this` is `dynamic` or `Object?`.
  bool get isLikeDynamic =>
      (isDartCoreObject && isNullableType) || this is DynamicType;

  /// Returns all of the [DartType] types that `this` implements, mixes-in, and
  /// extends, starting with `this` itself.
  Iterable<DartType> get typeImplementations sync* {
    yield this;

    final myType = this;

    if (myType is InterfaceType) {
      yield* myType.interfaces.expand((e) => e.typeImplementations);
      yield* myType.mixins.expand((e) => e.typeImplementations);

      if (myType.superclass != null) {
        yield* myType.superclass!.typeImplementations;
      }
    }
  }

  /// If `this` is the [Type] or implements the [Type] represented by [checker],
  /// returns the generic arguments to the [checker] [Type] if there are any.
  ///
  /// If the [checker] [Type] doesn't have generic arguments, `null` is
  /// returned.
  List<DartType>? typeArgumentsOf(TypeChecker checker) {
    final implementation = _getImplementationType(checker) as InterfaceType?;

    return implementation?.typeArguments;
  }

  DartType? _getImplementationType(TypeChecker checker) =>
      typeImplementations.firstWhereOrNull(checker.isExactlyType);
}

// Check if identifier starts with 'package:flutter/' or 'dart:
// Also check if there is a depednency on pubspec, that matches 'package:NAME/'

extension LibraryElementX on LibraryElement {
  bool get isFlutterLibrary =>
      source.uri.toString().startsWith('package:flutter/');

  bool get isDartLibrary => source.uri.toString().startsWith('dart:');

  bool get isFlutterOrDart {
    return isFlutterLibrary || isDartLibrary;
  }
}

extension ConstructorElementX on ConstructorElement {
  bool get isUnamedConstructor => name == '' && !isFactory;
  bool get isPrivateConstructor => name.startsWith('_') && !isFactory;
}

extension ConstantReaderX on ConstantReader {
  String? get typeAsString {
    final peakedType = peek('type');

    String? name;

    if (peakedType?.isString == true) {
      return peakedType!.stringValue;
    } else if (peakedType?.isType == true) {
      return peakedType!.typeValue.element!.name!;
    }

    return name;
  }
}

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
