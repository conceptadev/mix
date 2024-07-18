// ignore_for_file: camel_case_types

import '../attributes/enum/enum_util.dart';
import '../specs/image/image_spec.dart';
import '../variants/widget_state_variant.dart';
import 'attribute.dart';
import 'internal/widget_state/widget_state.dart';

class InternalMixDeprecatedAnnotation extends Deprecated {
  final String version;
  const InternalMixDeprecatedAnnotation({
    required String message,
    required this.version,
  }) : super(message);
}

class InternalRenameDeprecatedAnnotation
    extends InternalMixDeprecatedAnnotation {
  final String updatedName;

  const InternalRenameDeprecatedAnnotation({
    required super.message,
    required super.version,
    required this.updatedName,
  });
}

typedef RenamedDeprecated = InternalRenameDeprecatedAnnotation;

extension ImageSpecUtilityDeprecationX<T extends Attribute>
    on ImageSpecUtility<T> {
  @RenamedDeprecated(
    message:
        'To match Flutter naming conventions, use `colorBlendMode` instead.',
    version: '2.0.0',
    updatedName: 'colorBlendMode',
  )
  BlendModeUtility<T> get blendMode => colorBlendMode;
}

@RenamedDeprecated(
  message: 'Use `WidgetStateVariant` instead.',
  version: '2.0.0',
  updatedName: 'WidgetStateVariant',
)
typedef WidgetContextVariant = WidgetStateVariant;
@RenamedDeprecated(
  message: 'Use `WidgetStateModel` instead.',
  version: '2.0.0',
  updatedName: 'WidgetStateModel',
)
typedef PressableState = WidgetStateModel;

@RenamedDeprecated(
  message: 'Use `MixWidgetState` instead.',
  version: '2.0.0',
  updatedName: 'MixWidgetState',
)
typedef PressableCurrentState = WidgetMixState;
