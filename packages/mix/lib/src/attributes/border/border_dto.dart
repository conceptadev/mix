// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports
import 'package:flutter/material.dart';
import 'package:mix/annotations.dart';

import '../../../mix.dart';

part 'border_dto.g.dart';

@immutable
class BoxBorderDto extends Dto<BoxBorder> {
  final BorderSideDto? top;
  final BorderSideDto? bottom;

  final BorderSideDto? left;
  final BorderSideDto? right;

  // Directional
  final BorderSideDto? start;
  final BorderSideDto? end;

  const BoxBorderDto({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.start,
    this.end,
  });

  const BoxBorderDto.fromSide(BorderSideDto? side)
      : this(top: side, bottom: side, left: side, right: side);

  bool get _colorIsUniform {
    final topColor = top?.color;

    return left?.color == topColor &&
        bottom?.color == topColor &&
        right?.color == topColor;
  }

  bool get _widthIsUniform {
    final topWidth = top?.width;

    return left?.width == topWidth &&
        bottom?.width == topWidth &&
        right?.width == topWidth;
  }

  bool get _styleIsUniform {
    final topStyle = top?.style;

    return left?.style == topStyle &&
        bottom?.style == topStyle &&
        right?.style == topStyle;
  }

  bool get _strokeAlignIsUniform {
    final topStrokeAlign = top?.strokeAlign;

    return left?.strokeAlign == topStrokeAlign &&
        bottom?.strokeAlign == topStrokeAlign &&
        right?.strokeAlign == topStrokeAlign;
  }

  bool get _hasStartOrEnd => start != null || end != null;

  bool get _hasLeftOrRight => left != null || right != null;

  bool get isUniform =>
      _colorIsUniform &&
      _widthIsUniform &&
      _styleIsUniform &&
      _strokeAlignIsUniform;

  bool get isDirectional => _hasStartOrEnd && !_hasLeftOrRight;

  Type? checkMergeType(BoxBorderDto other) {
    if (_hasLeftOrRight && !other._hasStartOrEnd) {
      return Border;
    }
    if (_hasStartOrEnd && !other._hasLeftOrRight) {
      return BorderDirectional;
    }

    return null;
  }

  @override
  BoxBorderDto merge(BoxBorderDto? other) {
    if (other == null) return this;
    final type = checkMergeType(other);
    assert(type != null, 'Cannot merge Border with BoxBorderDirectional');
    if (type == Border) {
      return BoxBorderDto(
        top: top?.merge(other.top) ?? other.top,
        bottom: bottom?.merge(other.bottom) ?? other.bottom,
        left: left?.merge(other.left) ?? other.left,
        right: right?.merge(other.right) ?? other.right,
      );
    }

    if (type == BorderDirectional) {
      return BoxBorderDto(
        top: top?.merge(other.top) ?? other.top,
        bottom: bottom?.merge(other.bottom) ?? other.bottom,
        start: start?.merge(other.start) ?? other.start,
        end: end?.merge(other.end) ?? other.end,
      );
    }

    return other;
  }

  @override
  BoxBorder resolve(MixData mix) {
    if (isDirectional) {
      return BorderDirectional(
        top: top?.resolve(mix) ?? BorderSide.none,
        start: start?.resolve(mix) ?? BorderSide.none,
        end: end?.resolve(mix) ?? BorderSide.none,
        bottom: bottom?.resolve(mix) ?? BorderSide.none,
      );
    }

    return Border(
      top: top?.resolve(mix) ?? BorderSide.none,
      right: right?.resolve(mix) ?? BorderSide.none,
      bottom: bottom?.resolve(mix) ?? BorderSide.none,
      left: left?.resolve(mix) ?? BorderSide.none,
    );
  }

  @override
  BoxBorder get defaultValue => const Border();

  @override
  get props => [top, bottom, left, right, start, end];
}

@MixableDto()
final class BorderSideDto extends Dto<BorderSide> with _$BorderSideDto {
  final ColorDto? color;
  final double? width;

  @MixableProperty(utilities: [
    MixableUtility(properties: [(path: 'none', alias: 'none')]),
  ])
  final BorderStyle? style;
  final double? strokeAlign;

  const BorderSideDto({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  const BorderSideDto.none() : this();
  @override
  BorderSide get defaultValue => const BorderSide();
}

extension BoxBorderExt on BoxBorder {
  BoxBorderDto toDto() {
    if (this is Border) {
      return (this as Border).toDto();
    }
    if (this is BorderDirectional) {
      return (this as BorderDirectional).toDto();
    }

    throw ArgumentError.value(
      this,
      'border',
      'Border type is not supported',
    );
  }
}

extension BorderDirectionalExt on BorderDirectional {
  BoxBorderDto toDto() {
    return BoxBorderDto(
      top: top.toDto(),
      bottom: bottom.toDto(),
      start: start.toDto(),
      end: end.toDto(),
    );
  }
}

extension BorderExt on Border {
  BoxBorderDto toDto() {
    return BoxBorderDto(
      top: top.toDto(),
      bottom: bottom.toDto(),
      left: left.toDto(),
      right: right.toDto(),
    );
  }
}
