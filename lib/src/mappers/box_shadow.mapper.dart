import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:mix/src/mappers/class_properties.dart';

extension BoxShadowPropsExtension on List<BoxShadowProps> {
  List<BoxShadow> create() {
    return map((e) => e.create()).toList();
  }

  List<BoxShadowProps> merge(List<BoxShadowProps>? other) {
    final otherList = other ?? [];

    // Create array with the largest size
    final maxLength = max(length, otherList.length);

    // Get index value of List<BoxShadowProps>
    BoxShadowProps? getValueAtIndex(int index, List<BoxShadowProps> list) {
      if (index < list.length) return list[index];
      return null;
    }

    final mergedShadows = List<BoxShadowProps>.generate(maxLength, (int index) {
      final otherValue = getValueAtIndex(index, otherList);
      final thisValue = getValueAtIndex(index, this);
      // One of the values should be valid because of maxLength
      return thisValue?.merge(otherValue) ?? otherValue!;
    });

    return mergedShadows;
  }
}

class BoxShadowProps extends Properties<BoxShadow> {
  final Color? color;
  final Offset? offset;
  final double? blurRadius;
  final double? spreadRadius;

  const BoxShadowProps({
    this.color,
    this.offset,
    this.blurRadius,
    this.spreadRadius,
  });

  final BoxShadow _default = const BoxShadow();

  @override
  BoxShadow create() {
    return BoxShadow(
      color: color ?? _default.color,
      offset: offset ?? _default.offset,
      blurRadius: blurRadius ?? _default.blurRadius,
      spreadRadius: spreadRadius ?? _default.spreadRadius,
    );
  }

  BoxShadowProps merge(BoxShadowProps? other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      offset: other.offset,
      blurRadius: other.blurRadius,
    );
  }

  BoxShadowProps copyWith({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return BoxShadowProps(
      color: color ?? this.color,
      offset: offset ?? this.offset,
      blurRadius: blurRadius ?? this.blurRadius,
      spreadRadius: spreadRadius ?? this.spreadRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoxShadowProps &&
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
