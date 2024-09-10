import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../attributes/animated/animated_data.dart';
import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/animated/animated_util.dart';
import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/decoration/decoration_dto.dart';
import '../../attributes/enum/enum_util.dart';
import '../../attributes/modifiers/widget_modifiers_data.dart';
import '../../attributes/modifiers/widget_modifiers_data_dto.dart';
import '../../attributes/modifiers/widget_modifiers_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/edge_insets_dto.dart';
import '../../attributes/spacing/spacing_util.dart';
import '../../core/attribute.dart';
import '../../core/factory/mix_data.dart';
import '../../core/factory/mix_provider.dart';
import '../../core/helpers.dart';
import '../../core/spec.dart';
import '../../core/utility.dart';
import 'box_widget.dart';

part 'box_spec.g.dart';

const _constraints = MixableUtility(
  type: BoxConstraints,
  properties: [
    (path: 'minWidth', alias: 'minWidth'),
    (path: 'maxWidth', alias: 'maxWidth'),
    (path: 'minHeight', alias: 'minHeight'),
    (path: 'maxHeight', alias: 'maxHeight'),
  ],
);

const _foreground = MixableUtility(type: BoxDecoration);
const _boxDecor = MixableUtility(
  type: BoxDecoration,
  properties: [
    (path: 'color', alias: 'color'),
    (path: 'border', alias: 'border'),
    (path: 'border.directional', alias: 'borderDirectional'),
    (path: 'borderRadius', alias: 'borderRadius'),
    (path: 'borderRadius.directional', alias: 'borderRadiusDirectional'),
    (path: 'gradient', alias: 'gradient'),
    (path: 'gradient.sweep', alias: 'sweepGradient'),
    (path: 'gradient.radial', alias: 'radialGradient'),
    (path: 'gradient.linear', alias: 'linearGradient'),
    (path: 'boxShadows', alias: 'shadows'),
    (path: 'boxShadow', alias: 'shadow'),
    (path: 'elevation', alias: 'elevation'),
  ],
);

const _shapeDecor = MixableUtility(
  alias: 'shapeDecoration',
  type: ShapeDecoration,
  properties: [(path: 'shape', alias: 'shape')],
);

@MixableSpec()
class BoxSpec extends Spec<BoxSpec> with _$BoxSpec, Diagnosticable {
  /// {@macro box_spec_of}
  static const of = _$BoxSpec.of;

  static const from = _$BoxSpec.from;

  /// Aligns the child within the box.
  final AlignmentGeometry? alignment;

  /// Adds empty space inside the box.
  final EdgeInsetsGeometry? padding;

  /// Adds empty space around the box.
  final EdgeInsetsGeometry? margin;

  /// Applies additional constraints to the child.
  @MixableProperty(utilities: [_constraints])
  final BoxConstraints? constraints;

  /// Paints a decoration behind the child.
  @MixableProperty(utilities: [_boxDecor, _shapeDecor])
  final Decoration? decoration;

  /// Paints a decoration in front of the child.
  @MixableProperty(utilities: [_foreground])
  final Decoration? foregroundDecoration;

  /// Applies a transformation matrix before painting the box.
  final Matrix4? transform;

  /// Aligns the origin of the coordinate system for the [transform].
  final AlignmentGeometry? transformAlignment;

  /// Defines the clip behavior for the box
  /// when [BoxConstraints] has a negative minimum extent.
  final Clip? clipBehavior;

  /// Specifies the width of the box.
  final double? width;

  /// Specifies the height of the box.
  final double? height;

  const BoxSpec({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior,
    this.width,
    this.height,
    super.modifiers,
    super.animated,
  });

  Widget call({Widget? child, List<Type> orderOfModifiers = const []}) {
    return isAnimated
        ? AnimatedBoxSpecWidget(
            spec: this,
            duration: animated!.duration,
            curve: animated!.curve,
            onEnd: animated?.onEnd,
            orderOfModifiers: orderOfModifiers,
            child: child,
          )
        : BoxSpecWidget(
            spec: this,
            orderOfModifiers: orderOfModifiers,
            child: child,
          );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
