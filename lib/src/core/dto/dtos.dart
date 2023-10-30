import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_ref.dart';
import '../attribute.dart';

class DoubleDto extends ModifiableDto<double> {
  const DoubleDto(super.value, {super.modifier});

  double resolveAsSpace(MixData mix) {
    final resolvedValue = mix.resolver.space(value);

    return modify(resolvedValue);
  }

  @override
  DoubleDto merge(DoubleDto? other) {
    return DoubleDto(
      other?.value ?? value,
      modifier: other?.modifier ?? modifier,
    );
  }

  @override
  double resolve(MixData mix) => modify(value);

  @override
  List<Object?> get props => [value];
}

class ColorDto extends ModifiableDto<Color> {
  // Modifier is only used after value is resolved.

  const ColorDto(super.value, {super.modifier});

  static ColorDto? maybeFrom(Color? color) {
    return color == null ? null : ColorDto(color);
  }

  @override
  ColorDto merge(covariant ColorDto? other) {
    return ColorDto(
      other?.value ?? value,
      modifier: other?.modifier ?? modifier,
    );
  }

  @override
  Color resolve(MixData mix) {
    Color resolvedColor = value;

    if (resolvedColor is ColorRef) {
      resolvedColor = mix.resolver.color(resolvedColor);
    }

    return modify(resolvedColor);
  }

  @override
  get props => [value, modifier];
}

class EdgeInsetsGeometryDto extends Dto<EdgeInsetsGeometry> {
  final DoubleDto? top;
  final DoubleDto? bottom;
  final DoubleDto? left;
  final DoubleDto? right;

  // Directional
  final DoubleDto? start;
  final DoubleDto? end;

  final bool isDirectional;

  const EdgeInsetsGeometryDto({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.start,
    this.end,
    this.isDirectional = false,
  });

  const EdgeInsetsGeometryDto.all(DoubleDto all, {this.isDirectional = false})
      : top = all,
        bottom = all,
        left = all,
        right = all,
        start = all,
        end = all;

  const EdgeInsetsGeometryDto.symmetric({
    DoubleDto? vertical,
    DoubleDto? horizontal,
    this.isDirectional = false,
  })  : top = vertical,
        bottom = vertical,
        left = horizontal,
        right = horizontal,
        start = horizontal,
        end = horizontal;

  @override
  EdgeInsetsGeometryDto merge(EdgeInsetsGeometryDto? other) {
    if (other == null) return this;

    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional edgeinsets attributes",
      );
    }

    return EdgeInsetsGeometryDto(
      top: other.top ?? top,
      bottom: other.bottom ?? bottom,
      left: other.left ?? left,
      right: other.right ?? right,
      start: other.start ?? start,
      end: other.end ?? end,
    );
  }

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    const defaultValue = EdgeInsets.zero;
    const defalutDirectionalvalue = EdgeInsetsDirectional.zero;

    return isDirectional
        ? EdgeInsetsDirectional.only(
            start: start?.resolve(mix) ?? defalutDirectionalvalue.start,
            top: top?.resolve(mix) ?? defalutDirectionalvalue.top,
            end: end?.resolve(mix) ?? defalutDirectionalvalue.end,
            bottom: bottom?.resolve(mix) ?? defalutDirectionalvalue.bottom,
          )
        : EdgeInsets.only(
            left: left?.resolve(mix) ?? defaultValue.left,
            top: top?.resolve(mix) ?? defaultValue.top,
            right: right?.resolve(mix) ?? defaultValue.right,
            bottom: bottom?.resolve(mix) ?? defaultValue.bottom,
          );
  }

  @override
  get props => [top, bottom, left, right, start, end];
}

class SpaceGeometryDto extends EdgeInsetsGeometryDto {
  const SpaceGeometryDto({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
    super.isDirectional = false,
  });

  const SpaceGeometryDto.all(DoubleDto all, {super.isDirectional = false})
      : super.all(all);

  factory SpaceGeometryDto.positional(
    double p1, [
    double? p2,
    double? p3,
    double? p4,
  ]) {
    double top = p1;
    double bottom = p1;
    double left = p1;
    double right = p1;

    if (p2 != null) {
      left = p2;
      right = p2;
    }

    if (p3 != null) bottom = p3;
    if (p4 != null) right = p4;

    return SpaceGeometryDto(
      top: DoubleDto(top),
      bottom: DoubleDto(bottom),
      left: DoubleDto(left),
      right: DoubleDto(right),
      start: DoubleDto(left),
      end: DoubleDto(right),
    );
  }

  const SpaceGeometryDto.symmetric({
    DoubleDto? vertical,
    DoubleDto? horizontal,
    super.isDirectional = false,
  }) : super.symmetric(vertical: vertical, horizontal: horizontal);

  SpaceGeometryDto get toDirectional => copyWith(isDirectional: true);

  SpaceGeometryDto copyWith({
    DoubleDto? top,
    DoubleDto? bottom,
    DoubleDto? left,
    DoubleDto? right,
    DoubleDto? start,
    DoubleDto? end,
    bool? isDirectional,
  }) {
    return SpaceGeometryDto(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      right: right ?? this.right,
      start: start ?? this.start,
      end: end ?? this.end,
      isDirectional: isDirectional ?? this.isDirectional,
    );
  }

  @override
  SpaceGeometryDto merge(SpaceGeometryDto? other) {
    if (other == null) return this;

    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional edgeinsets attributes",
      );
    }

    return SpaceGeometryDto(
      top: other.top ?? top,
      bottom: other.bottom ?? bottom,
      left: other.left ?? left,
      right: other.right ?? right,
      start: other.start ?? start,
      end: other.end ?? end,
    );
  }

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    const defaultValue = EdgeInsets.zero;
    const defalutDirectionalvalue = EdgeInsetsDirectional.zero;

    return isDirectional
        ? EdgeInsetsDirectional.only(
            start: start?.resolveAsSpace(mix) ?? defalutDirectionalvalue.start,
            top: top?.resolveAsSpace(mix) ?? defalutDirectionalvalue.top,
            end: end?.resolveAsSpace(mix) ?? defalutDirectionalvalue.end,
            bottom:
                bottom?.resolveAsSpace(mix) ?? defalutDirectionalvalue.bottom,
          )
        : EdgeInsets.only(
            left: left?.resolveAsSpace(mix) ?? defaultValue.left,
            top: top?.resolveAsSpace(mix) ?? defaultValue.top,
            right: right?.resolveAsSpace(mix) ?? defaultValue.right,
            bottom: bottom?.resolveAsSpace(mix) ?? defaultValue.bottom,
          );
  }
}

class AlignmentGeometryDto extends Dto<AlignmentGeometry> {
  final DoubleDto? _start;
  final DoubleDto? _x;
  final DoubleDto? _y;

  const AlignmentGeometryDto({DoubleDto? start, DoubleDto? x, DoubleDto? y})
      : _start = start,
        _x = x,
        _y = y;

  @visibleForTesting
  DoubleDto? get start => _start;

  @visibleForTesting
  DoubleDto? get x => _x;

  @visibleForTesting
  DoubleDto? get y => _y;

  bool get _isDirectional => _start != null;

  @override
  AlignmentGeometryDto merge(AlignmentGeometryDto? other) {
    if (other == null) return this;

    if (other._isDirectional != _isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional alignment attributes",
      );
    }

    return AlignmentGeometryDto(
      start: other._start ?? _start,
      x: other._x ?? _x,
      y: other._y ?? _y,
    );
  }

  @override
  AlignmentGeometry resolve(MixData mix) {
    return _isDirectional
        ? AlignmentDirectional(
            _start?.resolve(mix) ?? 0.0,
            _y?.resolve(mix) ?? 0.0,
          )
        : Alignment(_x?.resolve(mix) ?? 0.0, _y?.resolve(mix) ?? 0.0);
  }

  @override
  get props => [_start, _x, _y];
}
