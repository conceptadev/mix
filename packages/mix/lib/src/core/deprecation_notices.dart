// ignore_for_file: camel_case_types

import '../attributes/scalars/scalar_util.dart';
import '../specs/image/image_spec.dart';
import 'attribute.dart';

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

extension ImageSpecUtilityDeprecationUtilityX<T extends Attribute>
    on ImageSpecUtility<T> {
  @RenamedDeprecated(
    message:
        'To match Flutter naming conventions, use `colorBlendMode` instead.',
    version: '2.0.0',
    updatedName: 'colorBlendMode',
  )
  BlendModeUtility<T> get blendMode => colorBlendMode;
}
