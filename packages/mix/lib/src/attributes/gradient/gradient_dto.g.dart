// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_dto.dart';

// **************************************************************************
// Generator: DtoDefinitionBuilder
// **************************************************************************

mixin LinearGradientDtoMixable on Dto<LinearGradient> {
  @override
  LinearGradient resolve(MixData mix) {
    final defaultValue = LinearGradient(colors: []);

    return LinearGradient(
      begin: _$this.begin ?? defaultValue.begin,
      end: _$this.end ?? defaultValue.end,
      tileMode: _$this.tileMode ?? defaultValue.tileMode,
      transform: _$this.transform ?? defaultValue.transform,
      colors: _$this.colors?.map((e) => e.resolve(mix)).toList() ??
          defaultValue.colors,
      stops: _$this.stops ?? defaultValue.stops,
    );
  }

  @override
  LinearGradientDto merge(LinearGradientDto? other) {
    if (other == null) return _$this;

    return LinearGradientDto(
        begin: other.begin ?? _$this.begin,
        end: other.end ?? _$this.end,
        tileMode: other.tileMode ?? _$this.tileMode,
        transform: other.transform ?? _$this.transform,
        colors: Dto.mergeList(_$this.colors, other._$this.colors),
        stops: _mergeListT(
          _$this.stops,
          other.stops,
        ));
  }

  /// The list of properties that constitute the state of this [LinearGradientDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [LinearGradientDto] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.begin,
      _$this.end,
      _$this.tileMode,
      _$this.transform,
      _$this.colors,
      _$this.stops,
    ];
  }

  LinearGradientDto get _$this => this as LinearGradientDto;
  List<T>? _mergeListT<T>(
    List<T>? a,
    List<T>? b,
  ) {
    if (b == null) return a ?? [];
    if (a == null) return b;

    final mergedList = [...a];
    for (int i = 0; i < b.length; i++) {
      if (i < mergedList.length) {
        mergedList[i] = b[i] ?? mergedList[i];
      } else {
        mergedList.add(b[i]);
      }
    }

    return mergedList;
  }
}

mixin RadialGradientDtoMixable on Dto<RadialGradient> {
  @override
  RadialGradient resolve(MixData mix) {
    final defaultValue = RadialGradient(colors: []);

    return RadialGradient(
      center: _$this.center ?? defaultValue.center,
      radius: _$this.radius ?? defaultValue.radius,
      tileMode: _$this.tileMode ?? defaultValue.tileMode,
      focal: _$this.focal ?? defaultValue.focal,
      focalRadius: _$this.focalRadius ?? defaultValue.focalRadius,
      transform: _$this.transform ?? defaultValue.transform,
      colors: _$this.colors?.map((e) => e.resolve(mix)).toList() ??
          defaultValue.colors,
      stops: _$this.stops ?? defaultValue.stops,
    );
  }

  @override
  RadialGradientDto merge(RadialGradientDto? other) {
    if (other == null) return _$this;

    return RadialGradientDto(
        center: other.center ?? _$this.center,
        radius: other.radius ?? _$this.radius,
        tileMode: other.tileMode ?? _$this.tileMode,
        focal: other.focal ?? _$this.focal,
        focalRadius: other.focalRadius ?? _$this.focalRadius,
        transform: other.transform ?? _$this.transform,
        colors: Dto.mergeList(_$this.colors, other._$this.colors),
        stops: _mergeListT(
          _$this.stops,
          other.stops,
        ));
  }

  /// The list of properties that constitute the state of this [RadialGradientDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [RadialGradientDto] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.center,
      _$this.radius,
      _$this.tileMode,
      _$this.focal,
      _$this.focalRadius,
      _$this.transform,
      _$this.colors,
      _$this.stops,
    ];
  }

  RadialGradientDto get _$this => this as RadialGradientDto;
  List<T>? _mergeListT<T>(
    List<T>? a,
    List<T>? b,
  ) {
    if (b == null) return a ?? [];
    if (a == null) return b;

    final mergedList = [...a];
    for (int i = 0; i < b.length; i++) {
      if (i < mergedList.length) {
        mergedList[i] = b[i] ?? mergedList[i];
      } else {
        mergedList.add(b[i]);
      }
    }

    return mergedList;
  }
}

mixin SweepGradientDtoMixable on Dto<SweepGradient> {
  @override
  SweepGradient resolve(MixData mix) {
    final defaultValue = SweepGradient(colors: []);

    return SweepGradient(
      center: _$this.center ?? defaultValue.center,
      startAngle: _$this.startAngle ?? defaultValue.startAngle,
      endAngle: _$this.endAngle ?? defaultValue.endAngle,
      tileMode: _$this.tileMode ?? defaultValue.tileMode,
      transform: _$this.transform ?? defaultValue.transform,
      colors: _$this.colors?.map((e) => e.resolve(mix)).toList() ??
          defaultValue.colors,
      stops: _$this.stops ?? defaultValue.stops,
    );
  }

  @override
  SweepGradientDto merge(SweepGradientDto? other) {
    if (other == null) return _$this;

    return SweepGradientDto(
        center: other.center ?? _$this.center,
        startAngle: other.startAngle ?? _$this.startAngle,
        endAngle: other.endAngle ?? _$this.endAngle,
        tileMode: other.tileMode ?? _$this.tileMode,
        transform: other.transform ?? _$this.transform,
        colors: Dto.mergeList(_$this.colors, other._$this.colors),
        stops: _mergeListT(
          _$this.stops,
          other.stops,
        ));
  }

  /// The list of properties that constitute the state of this [SweepGradientDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SweepGradientDto] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.center,
      _$this.startAngle,
      _$this.endAngle,
      _$this.tileMode,
      _$this.transform,
      _$this.colors,
      _$this.stops,
    ];
  }

  SweepGradientDto get _$this => this as SweepGradientDto;
  List<T>? _mergeListT<T>(
    List<T>? a,
    List<T>? b,
  ) {
    if (b == null) return a ?? [];
    if (a == null) return b;

    final mergedList = [...a];
    for (int i = 0; i < b.length; i++) {
      if (i < mergedList.length) {
        mergedList[i] = b[i] ?? mergedList[i];
      } else {
        mergedList.add(b[i]);
      }
    }

    return mergedList;
  }
}
