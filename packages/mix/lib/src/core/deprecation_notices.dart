// ignore_for_file: camel_case_types

import 'package:flutter/widgets.dart';

import '../attributes/enum/enum_util.dart';
import '../specs/image/image_spec.dart';
import '../variants/widget_state_variant.dart';
import 'attribute.dart';

class _DeprecatedAnnotation extends Deprecated {
  final String version;
  const _DeprecatedAnnotation({
    required String message,
    required this.version,
  }) : super(message);
}

class _RenamedAnnotation extends _DeprecatedAnnotation {
  final String updatedName;

  const _RenamedAnnotation({
    required super.message,
    required super.version,
    required this.updatedName,
  });
}

extension ImageSpecUtilityDeprecationX<T extends Attribute>
    on ImageSpecUtility<T> {
  @_RenamedAnnotation(
    message:
        'To match Flutter naming conventions, use `colorBlendMode` instead.',
    version: '2.0.0',
    updatedName: 'colorBlendMode',
  )
  BlendModeUtility<T> get blendMode => colorBlendMode;
}

@_RenamedAnnotation(
  message: 'Use `MixWidgetStateVariant` instead.',
  version: '2.0.0',
  updatedName: 'MixWidgetStateVariant',
)
typedef WidgetContextVariant = MixWidgetStateVariant;

@_RenamedAnnotation(
  message: 'Use `OnFocusedVariant` instead.',
  version: '2.0.0',
  updatedName: 'OnFocusedVariant',
)
typedef OnFocusVariant = OnFocusedVariant;

@_DeprecatedAnnotation(
  message: 'Use OnNotVariant(OnDisabledVariant())',
  version: '2.0.0',
)
class OnEnabledVariant extends OnDisabledVariant {
  const OnEnabledVariant();

  @override
  bool when(BuildContext context) => !super.when(context);
}
