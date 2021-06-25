// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'space.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SpaceAttributeTearOff {
  const _$SpaceAttributeTearOff();

  _SpaceAttribute call(
      {double? left, double? top, double? right, double? bottom}) {
    return _SpaceAttribute(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  MarginAttribute margin(
      {double? left, double? top, double? right, double? bottom}) {
    return MarginAttribute(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  PaddingAttribute padding(
      {double? left, double? top, double? right, double? bottom}) {
    return PaddingAttribute(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }
}

/// @nodoc
const $SpaceAttribute = _$SpaceAttributeTearOff();

/// @nodoc
mixin _$SpaceAttribute {
  double? get left => throw _privateConstructorUsedError;
  double? get top => throw _privateConstructorUsedError;
  double? get right => throw _privateConstructorUsedError;
  double? get bottom => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double? left, double? top, double? right, double? bottom)
        $default, {
    required TResult Function(
            double? left, double? top, double? right, double? bottom)
        margin,
    required TResult Function(
            double? left, double? top, double? right, double? bottom)
        padding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double? left, double? top, double? right, double? bottom)?
        $default, {
    TResult Function(double? left, double? top, double? right, double? bottom)?
        margin,
    TResult Function(double? left, double? top, double? right, double? bottom)?
        padding,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SpaceAttribute value) $default, {
    required TResult Function(MarginAttribute value) margin,
    required TResult Function(PaddingAttribute value) padding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SpaceAttribute value)? $default, {
    TResult Function(MarginAttribute value)? margin,
    TResult Function(PaddingAttribute value)? padding,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpaceAttributeCopyWith<SpaceAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpaceAttributeCopyWith<$Res> {
  factory $SpaceAttributeCopyWith(
          SpaceAttribute value, $Res Function(SpaceAttribute) then) =
      _$SpaceAttributeCopyWithImpl<$Res>;
  $Res call({double? left, double? top, double? right, double? bottom});
}

/// @nodoc
class _$SpaceAttributeCopyWithImpl<$Res>
    implements $SpaceAttributeCopyWith<$Res> {
  _$SpaceAttributeCopyWithImpl(this._value, this._then);

  final SpaceAttribute _value;
  // ignore: unused_field
  final $Res Function(SpaceAttribute) _then;

  @override
  $Res call({
    Object? left = freezed,
    Object? top = freezed,
    Object? right = freezed,
    Object? bottom = freezed,
  }) {
    return _then(_value.copyWith(
      left: left == freezed
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double?,
      top: top == freezed
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double?,
      right: right == freezed
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as double?,
      bottom: bottom == freezed
          ? _value.bottom
          : bottom // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$SpaceAttributeCopyWith<$Res>
    implements $SpaceAttributeCopyWith<$Res> {
  factory _$SpaceAttributeCopyWith(
          _SpaceAttribute value, $Res Function(_SpaceAttribute) then) =
      __$SpaceAttributeCopyWithImpl<$Res>;
  @override
  $Res call({double? left, double? top, double? right, double? bottom});
}

/// @nodoc
class __$SpaceAttributeCopyWithImpl<$Res>
    extends _$SpaceAttributeCopyWithImpl<$Res>
    implements _$SpaceAttributeCopyWith<$Res> {
  __$SpaceAttributeCopyWithImpl(
      _SpaceAttribute _value, $Res Function(_SpaceAttribute) _then)
      : super(_value, (v) => _then(v as _SpaceAttribute));

  @override
  _SpaceAttribute get _value => super._value as _SpaceAttribute;

  @override
  $Res call({
    Object? left = freezed,
    Object? top = freezed,
    Object? right = freezed,
    Object? bottom = freezed,
  }) {
    return _then(_SpaceAttribute(
      left: left == freezed
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double?,
      top: top == freezed
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double?,
      right: right == freezed
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as double?,
      bottom: bottom == freezed
          ? _value.bottom
          : bottom // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_SpaceAttribute extends _SpaceAttribute {
  _$_SpaceAttribute({this.left, this.top, this.right, this.bottom}) : super._();

  @override
  final double? left;
  @override
  final double? top;
  @override
  final double? right;
  @override
  final double? bottom;

  @override
  String toString() {
    return 'SpaceAttribute(left: $left, top: $top, right: $right, bottom: $bottom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SpaceAttribute &&
            (identical(other.left, left) ||
                const DeepCollectionEquality().equals(other.left, left)) &&
            (identical(other.top, top) ||
                const DeepCollectionEquality().equals(other.top, top)) &&
            (identical(other.right, right) ||
                const DeepCollectionEquality().equals(other.right, right)) &&
            (identical(other.bottom, bottom) ||
                const DeepCollectionEquality().equals(other.bottom, bottom)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(left) ^
      const DeepCollectionEquality().hash(top) ^
      const DeepCollectionEquality().hash(right) ^
      const DeepCollectionEquality().hash(bottom);

  @JsonKey(ignore: true)
  @override
  _$SpaceAttributeCopyWith<_SpaceAttribute> get copyWith =>
      __$SpaceAttributeCopyWithImpl<_SpaceAttribute>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double? left, double? top, double? right, double? bottom)
        $default, {
    required TResult Function(
            double? left, double? top, double? right, double? bottom)
        margin,
    required TResult Function(
            double? left, double? top, double? right, double? bottom)
        padding,
  }) {
    return $default(left, top, right, bottom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double? left, double? top, double? right, double? bottom)?
        $default, {
    TResult Function(double? left, double? top, double? right, double? bottom)?
        margin,
    TResult Function(double? left, double? top, double? right, double? bottom)?
        padding,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(left, top, right, bottom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SpaceAttribute value) $default, {
    required TResult Function(MarginAttribute value) margin,
    required TResult Function(PaddingAttribute value) padding,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SpaceAttribute value)? $default, {
    TResult Function(MarginAttribute value)? margin,
    TResult Function(PaddingAttribute value)? padding,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _SpaceAttribute extends SpaceAttribute {
  factory _SpaceAttribute(
      {double? left,
      double? top,
      double? right,
      double? bottom}) = _$_SpaceAttribute;
  _SpaceAttribute._() : super._();

  @override
  double? get left => throw _privateConstructorUsedError;
  @override
  double? get top => throw _privateConstructorUsedError;
  @override
  double? get right => throw _privateConstructorUsedError;
  @override
  double? get bottom => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SpaceAttributeCopyWith<_SpaceAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarginAttributeCopyWith<$Res>
    implements $SpaceAttributeCopyWith<$Res> {
  factory $MarginAttributeCopyWith(
          MarginAttribute value, $Res Function(MarginAttribute) then) =
      _$MarginAttributeCopyWithImpl<$Res>;
  @override
  $Res call({double? left, double? top, double? right, double? bottom});
}

/// @nodoc
class _$MarginAttributeCopyWithImpl<$Res>
    extends _$SpaceAttributeCopyWithImpl<$Res>
    implements $MarginAttributeCopyWith<$Res> {
  _$MarginAttributeCopyWithImpl(
      MarginAttribute _value, $Res Function(MarginAttribute) _then)
      : super(_value, (v) => _then(v as MarginAttribute));

  @override
  MarginAttribute get _value => super._value as MarginAttribute;

  @override
  $Res call({
    Object? left = freezed,
    Object? top = freezed,
    Object? right = freezed,
    Object? bottom = freezed,
  }) {
    return _then(MarginAttribute(
      left: left == freezed
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double?,
      top: top == freezed
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double?,
      right: right == freezed
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as double?,
      bottom: bottom == freezed
          ? _value.bottom
          : bottom // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$MarginAttribute extends MarginAttribute {
  _$MarginAttribute({this.left, this.top, this.right, this.bottom}) : super._();

  @override
  final double? left;
  @override
  final double? top;
  @override
  final double? right;
  @override
  final double? bottom;

  @override
  String toString() {
    return 'SpaceAttribute.margin(left: $left, top: $top, right: $right, bottom: $bottom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MarginAttribute &&
            (identical(other.left, left) ||
                const DeepCollectionEquality().equals(other.left, left)) &&
            (identical(other.top, top) ||
                const DeepCollectionEquality().equals(other.top, top)) &&
            (identical(other.right, right) ||
                const DeepCollectionEquality().equals(other.right, right)) &&
            (identical(other.bottom, bottom) ||
                const DeepCollectionEquality().equals(other.bottom, bottom)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(left) ^
      const DeepCollectionEquality().hash(top) ^
      const DeepCollectionEquality().hash(right) ^
      const DeepCollectionEquality().hash(bottom);

  @JsonKey(ignore: true)
  @override
  $MarginAttributeCopyWith<MarginAttribute> get copyWith =>
      _$MarginAttributeCopyWithImpl<MarginAttribute>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double? left, double? top, double? right, double? bottom)
        $default, {
    required TResult Function(
            double? left, double? top, double? right, double? bottom)
        margin,
    required TResult Function(
            double? left, double? top, double? right, double? bottom)
        padding,
  }) {
    return margin(left, top, right, bottom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double? left, double? top, double? right, double? bottom)?
        $default, {
    TResult Function(double? left, double? top, double? right, double? bottom)?
        margin,
    TResult Function(double? left, double? top, double? right, double? bottom)?
        padding,
    required TResult orElse(),
  }) {
    if (margin != null) {
      return margin(left, top, right, bottom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SpaceAttribute value) $default, {
    required TResult Function(MarginAttribute value) margin,
    required TResult Function(PaddingAttribute value) padding,
  }) {
    return margin(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SpaceAttribute value)? $default, {
    TResult Function(MarginAttribute value)? margin,
    TResult Function(PaddingAttribute value)? padding,
    required TResult orElse(),
  }) {
    if (margin != null) {
      return margin(this);
    }
    return orElse();
  }
}

abstract class MarginAttribute extends SpaceAttribute {
  factory MarginAttribute(
      {double? left,
      double? top,
      double? right,
      double? bottom}) = _$MarginAttribute;
  MarginAttribute._() : super._();

  @override
  double? get left => throw _privateConstructorUsedError;
  @override
  double? get top => throw _privateConstructorUsedError;
  @override
  double? get right => throw _privateConstructorUsedError;
  @override
  double? get bottom => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $MarginAttributeCopyWith<MarginAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaddingAttributeCopyWith<$Res>
    implements $SpaceAttributeCopyWith<$Res> {
  factory $PaddingAttributeCopyWith(
          PaddingAttribute value, $Res Function(PaddingAttribute) then) =
      _$PaddingAttributeCopyWithImpl<$Res>;
  @override
  $Res call({double? left, double? top, double? right, double? bottom});
}

/// @nodoc
class _$PaddingAttributeCopyWithImpl<$Res>
    extends _$SpaceAttributeCopyWithImpl<$Res>
    implements $PaddingAttributeCopyWith<$Res> {
  _$PaddingAttributeCopyWithImpl(
      PaddingAttribute _value, $Res Function(PaddingAttribute) _then)
      : super(_value, (v) => _then(v as PaddingAttribute));

  @override
  PaddingAttribute get _value => super._value as PaddingAttribute;

  @override
  $Res call({
    Object? left = freezed,
    Object? top = freezed,
    Object? right = freezed,
    Object? bottom = freezed,
  }) {
    return _then(PaddingAttribute(
      left: left == freezed
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double?,
      top: top == freezed
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double?,
      right: right == freezed
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as double?,
      bottom: bottom == freezed
          ? _value.bottom
          : bottom // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$PaddingAttribute extends PaddingAttribute {
  _$PaddingAttribute({this.left, this.top, this.right, this.bottom})
      : super._();

  @override
  final double? left;
  @override
  final double? top;
  @override
  final double? right;
  @override
  final double? bottom;

  @override
  String toString() {
    return 'SpaceAttribute.padding(left: $left, top: $top, right: $right, bottom: $bottom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaddingAttribute &&
            (identical(other.left, left) ||
                const DeepCollectionEquality().equals(other.left, left)) &&
            (identical(other.top, top) ||
                const DeepCollectionEquality().equals(other.top, top)) &&
            (identical(other.right, right) ||
                const DeepCollectionEquality().equals(other.right, right)) &&
            (identical(other.bottom, bottom) ||
                const DeepCollectionEquality().equals(other.bottom, bottom)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(left) ^
      const DeepCollectionEquality().hash(top) ^
      const DeepCollectionEquality().hash(right) ^
      const DeepCollectionEquality().hash(bottom);

  @JsonKey(ignore: true)
  @override
  $PaddingAttributeCopyWith<PaddingAttribute> get copyWith =>
      _$PaddingAttributeCopyWithImpl<PaddingAttribute>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double? left, double? top, double? right, double? bottom)
        $default, {
    required TResult Function(
            double? left, double? top, double? right, double? bottom)
        margin,
    required TResult Function(
            double? left, double? top, double? right, double? bottom)
        padding,
  }) {
    return padding(left, top, right, bottom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double? left, double? top, double? right, double? bottom)?
        $default, {
    TResult Function(double? left, double? top, double? right, double? bottom)?
        margin,
    TResult Function(double? left, double? top, double? right, double? bottom)?
        padding,
    required TResult orElse(),
  }) {
    if (padding != null) {
      return padding(left, top, right, bottom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SpaceAttribute value) $default, {
    required TResult Function(MarginAttribute value) margin,
    required TResult Function(PaddingAttribute value) padding,
  }) {
    return padding(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SpaceAttribute value)? $default, {
    TResult Function(MarginAttribute value)? margin,
    TResult Function(PaddingAttribute value)? padding,
    required TResult orElse(),
  }) {
    if (padding != null) {
      return padding(this);
    }
    return orElse();
  }
}

abstract class PaddingAttribute extends SpaceAttribute {
  factory PaddingAttribute(
      {double? left,
      double? top,
      double? right,
      double? bottom}) = _$PaddingAttribute;
  PaddingAttribute._() : super._();

  @override
  double? get left => throw _privateConstructorUsedError;
  @override
  double? get top => throw _privateConstructorUsedError;
  @override
  double? get right => throw _privateConstructorUsedError;
  @override
  double? get bottom => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $PaddingAttributeCopyWith<PaddingAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}
