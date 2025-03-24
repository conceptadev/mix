// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../internal/mix_error.dart';

part 'border_dto.g.dart';

@immutable
sealed class BoxBorderMix<T extends BoxBorder> extends Mixable<T> {
  final BorderSideMix? top;
  final BorderSideMix? bottom;

  const BoxBorderMix({this.top, this.bottom});

  /// Will try to merge two borders, the type will resolve to type of
  /// `b` if its not null and `a` otherwise.
  static BoxBorderMix? tryToMerge(BoxBorderMix? a, BoxBorderMix? b) {
    if (b == null) return a;
    if (a == null) return b;

    return a.runtimeType == b.runtimeType ? a.merge(b) : _exhaustiveMerge(a, b);
  }

  static B _exhaustiveMerge<A extends BoxBorderMix, B extends BoxBorderMix>(
    A a,
    B b,
  ) {
    if (a.runtimeType == b.runtimeType) return a.merge(b) as B;

    return switch (b) {
      (BorderMix g) => a._asBorder().merge(g) as B,
      (BorderDirectionalMix g) => a._asBorderDirectional().merge(g) as B,
    };
  }

  BorderMix _asBorder() {
    if (this is BorderMix) return this as BorderMix;

    return BorderMix(top: top, bottom: bottom);
  }

  BorderDirectionalMix _asBorderDirectional() {
    if (this is BorderDirectionalMix) return this as BorderDirectionalMix;

    return BorderDirectionalMix(top: top, bottom: bottom);
  }

  bool get isUniform;

  bool get isDirectional => this is BorderDirectionalMix;
  @override
  BoxBorderMix<T> merge(covariant BoxBorderMix<T>? other);
}

@MixableProperty(components: GeneratedPropertyComponents.skipUtility)
final class BorderMix extends BoxBorderMix<Border> with _$BorderMix {
  final BorderSideMix? left;
  final BorderSideMix? right;

  const BorderMix({super.top, super.bottom, this.left, this.right});

  const BorderMix.all(BorderSideMix side)
      : this(top: side, bottom: side, left: side, right: side);

  const BorderMix.none() : this.all(const BorderSideMix.none());

  const BorderMix.symmetric({
    BorderSideMix? vertical,
    BorderSideMix? horizontal,
  }) : this(
          top: horizontal,
          bottom: horizontal,
          left: vertical,
          right: vertical,
        );

  const BorderMix.vertical(BorderSideMix side) : this.symmetric(vertical: side);

  const BorderMix.horizontal(BorderSideMix side)
      : this.symmetric(horizontal: side);

  @override
  bool get isUniform => top == bottom && top == left && top == right;
}

@MixableProperty(components: GeneratedPropertyComponents.skipUtility)
final class BorderDirectionalMix extends BoxBorderMix<BorderDirectional>
    with _$BorderDirectionalMix {
  final BorderSideMix? start;
  final BorderSideMix? end;
  const BorderDirectionalMix({
    super.top,
    super.bottom,
    this.start,
    this.end,
  });

  const BorderDirectionalMix.all(BorderSideMix side)
      : this(top: side, bottom: side, start: side, end: side);

  const BorderDirectionalMix.symmetric({
    BorderSideMix? vertical,
    BorderSideMix? horizontal,
  }) : this(
          top: horizontal,
          bottom: horizontal,
          start: vertical,
          end: vertical,
        );

  const BorderDirectionalMix.none() : this.all(const BorderSideMix.none());
  const BorderDirectionalMix.vertical(BorderSideMix side)
      : this.symmetric(vertical: side);

  const BorderDirectionalMix.horizontal(BorderSideMix side)
      : this.symmetric(horizontal: side);

  @override
  bool get isUniform => top == bottom && top == start && top == end;
}

@MixableProperty()
final class BorderSideMix extends Mixable<BorderSide>
    with HasDefaultValue<BorderSide>, _$BorderSideMix {
  final ColorDto? color;
  final double? width;

  final BorderStyle? style;
  @MixableField(utilities: [MixableFieldUtility(type: StrokeAlignUtility)])
  final double? strokeAlign;

  const BorderSideMix({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  const BorderSideMix.none() : this(style: BorderStyle.none, width: 0.0);

  @override
  BorderSide get defaultValue => const BorderSide();
}

extension BoxBorderExt on BoxBorder {
  BoxBorderMix toDto() {
    final self = this;
    if (self is Border) return (self).toDto();
    if (self is BorderDirectional) return (self).toDto();

    throw MixError.unsupportedTypeInDto(
      BoxBorder,
      ['Border', 'BorderDirectional'],
    );
  }
}
