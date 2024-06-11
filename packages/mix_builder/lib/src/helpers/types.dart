// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert' as convert;
import 'dart:core' as core;
import 'dart:typed_data';

import 'package:code_builder/code_builder.dart';

/// Common type references used throughout code generation.
abstract class DartTypes {
  /// `dart:core` types.
  static const core = _Core();

  /// `dart:async` types.
  static const async = _Async();

  /// `dart:convert` types.
  static const convert = _Convert();

  static const ui = _UI();

  /// `package:meta` types.
  static const meta = _Meta();

  /// `package:test` types.
  static const test = _Test();

  /// `dart:typed_data` types.
  static const typedData = _TypedData();

  DartTypes._();
}

abstract class FlutterTypes {
  static const foundation = _FlutterFoundation();

  static const widgets = _FlutterWidgets();
  const FlutterTypes();
}

class _FlutterFoundation {
  static const _url = 'package:flutter/foundation.dart';

  const _FlutterFoundation();

  /// Creates a [foundation.mapEquals] reference.
  Reference get mapEquals => const Reference('mapEquals', _url);

  /// Creates a [foundation.setEquals] reference.
  Reference get setEquals => const Reference('setEquals', _url);

  /// Creates a [foundation.listEquals] reference.
  Reference get listEquals => const Reference('listEquals', _url);
}

class MixTypes {
  static final foundation = _MixTypeFoundation();
  static final utilities = _MixTypeUtility();
  static final dtos = _MixTypeDto();
  const MixTypes._();
}

class _MixTypeFoundation {
  _MixTypeFoundation();

  final spec = Reference('Spec', 'package:mix/mix.dart');
  final dto = Reference('Dto', 'package:mix/mix.dart');
  final mix = Reference('Mix', 'package:mix/mix.dart');
  final mixData = Reference('MixData', 'package:mix/mix.dart');
  final specUtility = Reference('SpecUtility', 'package:mix/mix.dart');
  final attribute = Reference('Attribute', 'package:mix/mix.dart');
}

class _MixTypeDto {
  _MixTypeDto();

  // Reference? get(core.String type) {
  //   return Reference(type, 'package:mix/mix.dart');
  // }
}

class _MixTypeUtility {
  _MixTypeUtility();
  // Reference? get(core.String type) {
  //   return Reference(type, 'package:mix/mix.dart');
  // }
}

class _FlutterWidgets {
  static const _url = 'package:flutter/widgets.dart';

  const _FlutterWidgets();

  /// Creates a [widgets.Alignment] reference.
  Reference get alignment => const Reference('Alignment', _url);

  /// Creates a [widgets.AlignmentGeometry] reference.
  Reference get alignmentGeometry => const Reference('AlignmentGeometry', _url);

  /// Creates a [widgets.AlignmentDirectional] reference.
  Reference get alignmentDirectional =>
      const Reference('AlignmentDirectional', _url);

  /// Creates a [widgets.BoxConstraints] reference.
  Reference get boxConstraints => const Reference('BoxConstraints', _url);

  /// Creates a [widgets.Matrix4Tween] reference.
  Reference get matrix4Tween => const Reference('Matrix4Tween', _url);

  /// Creates a [widgets.BoxDecoration] reference.
  Reference get boxDecoration => const Reference('BoxDecoration', _url);

  /// Creates a [widgets.Clip] reference.
  Reference get clip => const Reference('Clip', _url);

  /// Creates a [widgets.Color] reference.
  Reference get color => const Reference('Color', _url);

  /// Creates a [widgets.Decoration] reference.
  Reference get decoration => const Reference('Decoration', _url);

  /// Creates a [widgets.BoxShape] reference.
  Reference get boxShape => const Reference('BoxShape', _url);

  /// Creates a [widgets.ShapeDecoration] reference.
  Reference get shapeDecoration => const Reference('ShapeDecoration', _url);

  /// Creates a [widgets.CrossAxisAlignment] reference.
  Reference get crossAxisAlignment =>
      const Reference('CrossAxisAlignment', _url);

  /// Creates a [widgets.MainAxisAlignment] reference.
  Reference get mainAxisAlignment => const Reference('MainAxisAlignment', _url);

  /// Creates a [widgets.MainAxisSize] reference.
  Reference get mainAxisSize => const Reference('MainAxisSize', _url);

  /// Creates a [widgets.Matrix4] reference.
  Reference get matrix4 => const Reference('Matrix4', _url);

  /// Creates a [widgets.TextBaseline] reference.
  Reference get textBaseline => const Reference('TextBaseline', _url);

  /// Creates a [widgets.TextDirection] reference.
  Reference get textDirection => const Reference('TextDirection', _url);

  /// Creates a [widgets.VerticalDirection] reference.
  Reference get verticalDirection => const Reference('VerticalDirection', _url);

  /// Creates a [widgets.Widget] reference.
  Reference get widget => const Reference('Widget', _url);

  /// Creates a [widgets.EdgeInsets] reference.
  Reference get edgeInsets => const Reference('EdgeInsets', _url);

  /// Creates a [widgets.EdgeInsetsDirectional] reference.
  Reference get edgeInsetsDirectional =>
      const Reference('EdgeInsetsDirectional', _url);

  /// Creates a [widgets.FractionalOffset] reference.
  Reference get fractionalOffset => const Reference('FractionalOffset', _url);

  Reference get edgeInsetsGeometry =>
      const Reference('EdgeInsetsGeometry', _url);

  // Creates a [widgets.Size] reference.
  Reference get size => const Reference('Size', _url);

  Reference get boxBorder => const Reference('BoxBorder', _url);

  Reference get border => const Reference('Border', _url);

  Reference get borderDirectional => const Reference('BorderDirectional', _url);
}

/// `dart:ui` types
class _UI {
  static const _url = 'dart:ui';
  const _UI();

  /// Creates a [ui.Image] reference.
  Reference get image => const Reference('Image', _url);

  /// Creates a lerpDouble reference.
  Reference get lerpDouble => const Reference('lerpDouble', _url);

  /// Creates a Color reference.
  Reference get color => const Reference('Color', _url);
}

/// `dart:core` types
class _Core {
  static const _url = 'dart:core';

  const _Core();

  /// Creates a [core.BigInt] reference.
  Reference get bigInt => const Reference('BigInt', _url);

  /// Creates a [core.bool] reference.
  Reference get bool => const Reference('bool', _url);

  /// Creates a [core.DateTime] reference.
  Reference get dateTime => const Reference('DateTime', _url);

  /// Creates a [core.Deprecated] reference.
  Reference get deprecated => const Reference('Deprecated', _url);

  /// Creates a [core.double] reference.
  Reference get double => const Reference('double', _url);

  /// Creates a [core.Duration] reference.
  Reference get duration => const Reference('Duration', _url);

  /// Creates a [core.Exception] reference.
  Reference get exception => const Reference('Exception', _url);

  /// Creates a [core.Function] reference.
  Reference get function => const Reference('Function', _url);

  /// Creates an [core.int] reference.
  Reference get int => const Reference('int', _url);

  /// Creates an [core.MapEntry] reference.
  Reference get mapEntry => const Reference('MapEntry', _url);

  /// Creates a [core.Null] reference.
  Reference get null$ => const Reference('Null', _url);

  /// Creates an [core.Object] reference.
  Reference get object => const Reference('Object', _url);

  /// Creates a [core.override] reference.
  Reference get override => const Reference('override', _url);

  /// Creates a [core.RegExp] reference.
  Reference get regExp => const Reference('RegExp', _url);

  /// Create a [core.StateError] reference.
  Reference get stateError => const Reference('StateError', _url);

  /// Creates a [core.String] reference.
  Reference get string => const Reference('String', _url);

  /// Creates a [core.Type] reference.
  Reference get type => const Reference('Type', _url);

  /// Creates a [core.Uri] reference.
  Reference get uri => const Reference('Uri', _url);

  /// Creates a `void` reference.
  Reference get void$ => const Reference('void');

  /// Creates a [core.Iterable] reference.
  Reference iterable([Reference? ref]) => TypeReference(
        (t) => t
          ..symbol = 'Iterable'
          ..url = _url
          ..types.addAll([if (ref != null) ref]),
      );

  /// Creates a [core.List] reference.
  Reference list([Reference? ref]) => TypeReference(
        (t) => t
          ..symbol = 'List'
          ..url = _url
          ..types.addAll([if (ref != null) ref]),
      );

  /// Creates a [core.Map] reference.
  Reference map(Reference key, Reference value) => TypeReference(
        (t) => t
          ..symbol = 'Map'
          ..url = _url
          ..types.add(key)
          ..types.add(value),
      );

  /// Creates a [core.Set] reference.
  Reference set(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'Set'
          ..url = _url
          ..types.add(ref),
      );
}

/// `dart:async` types
class _Async {
  static const _url = 'dart:async';

  const _Async();

  /// Creates a `runZoned` refererence.
  Reference get runZoned => const Reference('runZoned', _url);

  /// Creates a [Future] reference.
  Reference future(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'Future'
          ..url = _url
          ..types.add(ref),
      );

  /// Creates a [Stream] reference.
  Reference stream([Reference? ref]) => TypeReference(
        (t) => t
          ..symbol = 'Stream'
          ..url = _url
          ..types.addAll([if (ref != null) ref]),
      );
}

/// `dart:convert` types
class _Convert {
  static const _url = 'dart:convert';

  const _Convert();

  /// Creates a [convert.base64Decode] reference.
  Reference get base64Decode => const Reference('base64Decode', _url);

  /// Creates a [convert.base64Encode] reference.
  Reference get base64Encode => const Reference('base64Encode', _url);

  /// Creates a [convert.jsonEncode] reference.
  Reference get jsonEncode => const Reference('jsonEncode', _url);

  /// Creates a [convert.jsonDecode] reference.
  Reference get jsonDecode => const Reference('jsonDecode', _url);

  /// Creates a [convert.utf8] reference.
  Reference get utf8 => const Reference('utf8', _url);
}

/// `package:meta` types.
class _Meta {
  static const _url = 'package:meta/meta.dart';

  const _Meta();

  /// Creates a [meta.experimental] reference.
  Reference get experimental => const Reference('experimental', _url);

  /// Creates a [meta.internal] reference.
  Reference get internal => const Reference('internal', _url);

  /// Creates a [meta.immutable] reference.
  Reference get immutable => const Reference('immutable', _url);
}

/// `package:test` types
class _Test {
  static const _url = 'package:test/test.dart';

  const _Test();

  /// Creates an `test` reference.
  Reference get test => const Reference('test', _url);
}

/// `dart:typed_data` types
class _TypedData {
  static const _url = 'dart:typed_data';

  const _TypedData();

  /// Creates a [Uint8List] reference.
  Reference get uint8List => const Reference('Uint8List', _url);
}
