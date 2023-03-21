import 'package:flutter/material.dart';

import '../../attributes/common/common.props.dart';
import '../../mixer/mix_context_data.dart';
import '../../theme/refs/color_token.dart';
import 'icon.attributes.dart';

class IconProps extends CommonProps {
  final Color? color;
  final double size;

  const IconProps({
    this.color,
    required this.size,
    required bool animated,
    required Duration animationDuration,
    required Curve animationCurve,
    required bool visible,
    TextDirection? textDirection,
  }) : super(
          visible: visible,
          animated: animated,
          animationDuration: animationDuration,
          animationCurve: animationCurve,
          textDirection: textDirection,
        );

  factory IconProps.fromContext(MixContextData mixContext) {
    final iconAttributes = mixContext.attributesOfType<IconAttributes>();

    final commonProps = CommonProps.fromContext(mixContext);

    final context = mixContext.context;

    IconProps props;

// Icon with default size
    props = IconProps(
      size: 24,
      animated: commonProps.animated,
      animationDuration: commonProps.animationDuration,
      animationCurve: commonProps.animationCurve,
      visible: commonProps.visible,
      textDirection: commonProps.textDirection,
    );

    if (iconAttributes != null) {
      final theme = IconTheme.of(context);
      var color = iconAttributes.color;

      if (color is ColorToken) {
        color = color.resolve(context);
      }

      props = props.copyWith(
        color: color ?? theme.color,
        size: iconAttributes.size ?? theme.size ?? 24,
      );
    }

    return props;
  }

  IconProps copyWith({
    Color? color,
    double? size,
    bool? animated,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? visible,
    TextDirection? textDirection,
  }) {
    return IconProps(
      color: color ?? this.color,
      size: size ?? this.size,
      animated: animated ?? this.animated,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      visible: visible ?? this.visible,
      textDirection: textDirection ?? this.textDirection,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IconProps && other.color == color && other.size == size;
  }

  @override
  int get hashCode => color.hashCode ^ size.hashCode;
}
