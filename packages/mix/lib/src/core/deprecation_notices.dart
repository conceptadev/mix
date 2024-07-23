// ignore_for_file: camel_case_types

import 'package:flutter/widgets.dart';

import '../attributes/enum/enum_util.dart';
import '../attributes/spacing/edge_insets_dto.dart';
import '../modifiers/align_widget_modifier.dart';
import '../specs/image/image_spec.dart';
import '../variants/widget_state_variant.dart';
import 'attribute.dart';

class _RenamedAnnotation {
  final String updatedName;
  final String version;

  const _RenamedAnnotation({
    required this.version,
    required this.updatedName,
  });

  String get message =>
      'Use $updatedName instead. This feature was deprecated in $version';
}

extension ImageSpecUtilityDeprecationX<T extends Attribute>
    on ImageSpecUtility<T> {
  @_RenamedAnnotation(
    version: '2.0.0',
    updatedName: 'colorBlendMode',
  )
  @Deprecated('Use colorBlendMode instead')
  BlendModeUtility<T> get blendMode => colorBlendMode;
}

@_RenamedAnnotation(
  version: '2.0.0',
  updatedName: 'MixWidgetStateVariant',
)
@Deprecated('Use MixWidgetStateVariant instead')
typedef WidgetContextVariant = MixWidgetStateVariant;

@_RenamedAnnotation(
  version: '2.0.0',
  updatedName: 'OnFocusedVariant',
)
@Deprecated('Use OnFocusedVariant instead')
typedef OnFocusVariant = OnFocusedVariant;

@Deprecated('Use OnNotVariant(OnDisabledVariant())')
class OnEnabledVariant extends OnDisabledVariant {
  const OnEnabledVariant();

  @override
  bool when(BuildContext context) => !super.when(context);
}

@_RenamedAnnotation(
  version: '2.0.0',
  updatedName: 'AlignSpec',
)
@Deprecated('Use AlignSpec instead')
typedef AlignModifierSpec = AlignSpec;

@_RenamedAnnotation(
  version: '2.0.0',
  updatedName: 'AlignSpecAttribute',
)
@Deprecated('Use AlignSpecAttribute instead')
typedef AlignModifierAttribute = AlignSpecAttribute;

@_RenamedAnnotation(
  version: '2.0.0',
  updatedName: 'AlignSpecUtility',
)
@Deprecated('Use AlignSpecUtility instead')
typedef AlignWidgetUtility = AlignSpecUtility;

@_RenamedAnnotation(
  version: '2.0.0',
  updatedName: 'EdgeInsetsGeometryDto',
)
typedef SpacingDto = EdgeInsetsGeometryDto<EdgeInsetsGeometry>;
