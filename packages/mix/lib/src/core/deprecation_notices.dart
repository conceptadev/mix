// ignore_for_file: camel_case_types

import 'package:flutter/widgets.dart';

import '../../mix.dart';

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

@Deprecated('Use `WidgetModifierSpecAttribute` instead.')
abstract base class WidgetModifierAttribute<
        Self extends WidgetModifierSpecAttribute<Value>,
        Value extends WidgetModifierSpec<Value>>
    extends WidgetModifierSpecAttribute<Value> {
  const WidgetModifierAttribute();
}

// VisibilityUtility
@Deprecated('Use `VisibilityModifierUtility` instead.')
typedef VisibilityUtility = VisibilityModifierUtility;

// OpacityUtility
@Deprecated('Use `OpacityModifierUtility` instead.')
typedef OpacityUtility = OpacityModifierUtility;

// RotatedBoxWidgetUtility
@Deprecated('Use `RotatedBoxModifierUtility` instead.')
typedef RotatedBoxWidgetUtility = RotatedBoxModifierUtility;

// AspectRatioUtility
@Deprecated('Use `AspectRatioModifierUtility` instead.')
typedef AspectRatioUtility = AspectRatioModifierUtility;

// IntrinsicHeightWidgetUtility
@Deprecated('Use `IntrinsicHeightModifierUtility` instead.')
typedef IntrinsicHeightWidgetUtility = IntrinsicHeightModifierUtility;

// IntrinsicWidthWidgetUtility
@Deprecated('Use `IntrinsicWidthModifierUtility` instead.')
typedef IntrinsicWidthWidgetUtility = IntrinsicWidthModifierUtility;

// AlignWidgetUtility
@Deprecated('Use `AlignModifierUtility` instead.')
typedef AlignWidgetUtility = AlignModifierUtility;

// TransformUtility
@Deprecated('Use `TransformModifierUtility` instead.')
typedef TransformUtility = TransformModifierUtility;
