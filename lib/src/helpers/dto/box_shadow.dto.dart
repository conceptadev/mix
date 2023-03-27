import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'color.dto.dart';
import 'dto.dart';

class BoxShadowDto extends Dto<BoxShadow> {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;
  final double? spreadRadius;

  const BoxShadowDto({
    this.color,
    this.offset,
    this.blurRadius,
    this.spreadRadius,
  });

  final BoxShadow _default = const BoxShadow();

  factory BoxShadowDto.fromBoxShadow(BoxShadow? boxShadow) {
    if (boxShadow == null) {
      return const BoxShadowDto();
    }

    return BoxShadowDto(
      blurRadius: boxShadow.blurRadius,
      color: ColorDto.maybeFrom(boxShadow.color),
      offset: Offset(boxShadow.offset.dx, boxShadow.offset.dy),
      spreadRadius: boxShadow.spreadRadius,
    );
  }

  factory BoxShadowDto.random() {
    return BoxShadowDto(
      color: ColorDto.random(),
      offset: Offset(
        Random().nextDouble() * 10,
        Random().nextDouble() * 10,
      ),
      blurRadius: Random().nextDouble() * 10,
      spreadRadius: Random().nextDouble() * 10,
    );
  }

  @override
  BoxShadow resolve(BuildContext context) {
    return BoxShadow(
      color: color?.resolve(context) ?? _default.color,
      offset: offset ?? _default.offset,
      blurRadius: blurRadius ?? _default.blurRadius,
      spreadRadius: spreadRadius ?? _default.spreadRadius,
    );
  }

  BoxShadowDto merge(BoxShadowDto? other) {
    return copyWith(
      color: other?.color,
      offset: other?.offset,
      blurRadius: other?.blurRadius,
    );
  }

  BoxShadowDto copyWith({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return BoxShadowDto(
      color: color ?? this.color,
      offset: offset ?? this.offset,
      blurRadius: blurRadius ?? this.blurRadius,
      spreadRadius: spreadRadius ?? this.spreadRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoxShadowDto &&
        other.color == color &&
        other.offset == offset &&
        other.blurRadius == blurRadius &&
        other.spreadRadius == spreadRadius;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        offset.hashCode ^
        blurRadius.hashCode ^
        spreadRadius.hashCode;
  }

  @override
  String toString() {
    return 'BoxShadowProps(color: $color, offset: $offset, blurRadius: $blurRadius, spreadRadius: $spreadRadius)';
  }
}

extension BoxShadowDtoExtension on List<BoxShadowDto> {
  List<BoxShadow> resolve(BuildContext context) {
    return map((e) => e.resolve(context)).toList();
  }

  List<BoxShadowDto> merge(List<BoxShadowDto>? other) {
    if (other == null || listEquals(other, this)) return this;
    final otherList = other;

    // Create array with the largest size
    final maxLength = max(length, otherList.length);

    // Get index value of List<BoxShadowProps>
    BoxShadowDto? getValueAtIndex(int index, List<BoxShadowDto> list) {
      if (index < list.length) return list[index];

      return null;
    }

    final mergedShadows = List<BoxShadowDto>.generate(maxLength, (int index) {
      final otherValue = getValueAtIndex(index, otherList);
      final thisValue = getValueAtIndex(index, this);
      // One of the values should be valid because of maxLength

      return thisValue?.merge(otherValue) ?? otherValue!;
    });

    return mergedShadows;
  }
}
