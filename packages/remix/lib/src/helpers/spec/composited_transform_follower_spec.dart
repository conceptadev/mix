import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'composited_transform_follower_spec.g.dart';

@MixableSpec()
class CompositedTransformFollowerSpec
    extends Spec<CompositedTransformFollowerSpec>
    with _$CompositedTransformFollowerSpec, Diagnosticable {
  final Offset offset;
  final AlignmentGeometry targetAnchor;
  final AlignmentGeometry followerAnchor;

  /// {@macro composited_transform_follower_spec_of}
  static const of = _$CompositedTransformFollowerSpec.of;

  static const from = _$CompositedTransformFollowerSpec.from;

  const CompositedTransformFollowerSpec({
    Offset? offset,
    AlignmentGeometry? targetAnchor,
    AlignmentGeometry? followerAnchor,
    super.modifiers,
    super.animated,
  })  : offset = offset ?? Offset.zero,
        targetAnchor = targetAnchor ?? Alignment.center,
        followerAnchor = followerAnchor ?? Alignment.topCenter;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
