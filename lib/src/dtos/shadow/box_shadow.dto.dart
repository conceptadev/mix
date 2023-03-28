import 'package:flutter/material.dart';

import '../../helpers/mergeable_list.dart';
import '../color.dto.dart';
import 'shadow.dto.dart';

class BoxShadowDto extends ShadowDto<BoxShadow> {
  final double? spreadRadius;

  const BoxShadowDto({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
    this.spreadRadius,
  }) : super(
          color: color,
          offset: offset,
          blurRadius: blurRadius,
        );

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

  @override
  BoxShadow resolve(BuildContext context) {
    return BoxShadow(
      color: color?.resolve(context) ?? _default.color,
      offset: offset ?? _default.offset,
      blurRadius: blurRadius ?? _default.blurRadius,
      spreadRadius: spreadRadius ?? _default.spreadRadius,
    );
  }

  @override
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
  BoxShadowDto merge(BoxShadowDto? other) {
    return copyWith(
      color: other?.color,
      offset: other?.offset,
      blurRadius: other?.blurRadius,
      spreadRadius: other?.spreadRadius,
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
    return 'BoxShadowDto(color: $color, offset: $offset, blurRadius: $blurRadius, spreadRadius: $spreadRadius)';
  }
}

extension BoxShadowDtoExt on List<BoxShadowDto> {
  List<BoxShadow> resolve(BuildContext context) {
    return map((e) => e.resolve(context)).toList();
  }

  List<BoxShadowDto> merge(List<BoxShadowDto>? other) {
    return combineMergeableLists(this, other);
  }
}
