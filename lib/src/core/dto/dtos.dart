import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_token.dart';
import '../attribute.dart';
import '../style_attribute.dart';

class DoubleDto extends ModifiableDto<double> {
  const DoubleDto(super.value, {super.modifier});

  static DoubleDto? maybeFrom(double? value) {
    return value == null ? null : DoubleDto(value);
  }

  @override
  DoubleDto merge(DoubleDto? other) {
    return DoubleDto(
      other?.value ?? value,
      modifier: other?.modifier ?? modifier,
    );
  }

  @override
  double resolve(MixData mix) => value;

  @override
  List<Object?> get props => [value];
}

class SpacingDto extends DoubleDto {
  const SpacingDto(super.value, {super.modifier});

  @override
  SpacingDto merge(DoubleDto? other) {
    return SpacingDto(other?.value ?? value);
  }

  @override
  double resolve(MixData mix) {
    final resolvedValue = mix.resolver.space(value);

    return modify(resolvedValue);
  }
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

    if (resolvedColor is ColorToken) {
      resolvedColor = mix.resolver.color(resolvedColor);
    }

    return modify(resolvedColor);
  }

  @override
  get props => [value, modifier];
}

class SpacingGeometryDto extends Dto<EdgeInsetsGeometry> {
  final SpacingDto? _top;
  final SpacingDto? _bottom;
  final SpacingDto? _left;
  final SpacingDto? _right;

  // Directional
  final SpacingDto? _start;
  final SpacingDto? _end;

  const SpacingGeometryDto({
    SpacingDto? top,
    SpacingDto? bottom,
    SpacingDto? left,
    SpacingDto? right,
    SpacingDto? start,
    SpacingDto? end,
  })  : _top = top,
        _bottom = bottom,
        _left = left,
        _right = right,
        _start = start,
        _end = end;
  @visibleForTesting
  SpacingDto? get top => _top;

  @visibleForTesting
  SpacingDto? get bottom => _bottom;

  @visibleForTesting
  SpacingDto? get left => _left;

  @visibleForTesting
  SpacingDto? get right => _right;

  @visibleForTesting
  SpacingDto? get start => _start;

  @visibleForTesting
  SpacingDto? get end => _end;

  bool get _isDirectional => _start != null || _end != null;

  @override
  SpacingGeometryDto merge(SpacingGeometryDto? other) {
    if (other == null) return this;

    if (other._isDirectional != _isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional edgeinsets attributes",
      );
    }

    return SpacingGeometryDto(
      top: other._top ?? _top,
      bottom: other._bottom ?? _bottom,
      left: other._left ?? _left,
      right: other._right ?? _right,
      start: other._start ?? _start,
      end: other._end ?? _end,
    );
  }

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    const defaultValue = EdgeInsets.zero;
    const defalutDirectionalvalue = EdgeInsetsDirectional.zero;

    return _isDirectional
        ? EdgeInsetsDirectional.only(
            start: _start?.resolve(mix) ?? defalutDirectionalvalue.start,
            top: _top?.resolve(mix) ?? defalutDirectionalvalue.top,
            end: _end?.resolve(mix) ?? defalutDirectionalvalue.end,
            bottom: _bottom?.resolve(mix) ?? defalutDirectionalvalue.bottom,
          )
        : EdgeInsets.only(
            left: _left?.resolve(mix) ?? defaultValue.left,
            top: _top?.resolve(mix) ?? defaultValue.top,
            right: _right?.resolve(mix) ?? defaultValue.right,
            bottom: _bottom?.resolve(mix) ?? defaultValue.bottom,
          );
  }

  @override
  get props => [_top, _bottom, _left, _right, _start, _end];
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
