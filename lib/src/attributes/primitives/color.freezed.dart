// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ColorAttributeTearOff {
  const _$ColorAttributeTearOff();

  _ColorAttribute call(Color color) {
    return _ColorAttribute(
      color,
    );
  }

  BackgroundColorAttribute backgroundColor(Color color) {
    return BackgroundColorAttribute(
      color,
    );
  }

  TextColorAttribute textColor(Color color) {
    return TextColorAttribute(
      color,
    );
  }

  ShadowColorAttribute shadowColor(Color color) {
    return ShadowColorAttribute(
      color,
    );
  }

  BorderColorAttribute borderColor(Color color) {
    return BorderColorAttribute(
      color,
    );
  }

  IconColorAttribute iconColor(Color color) {
    return IconColorAttribute(
      color,
    );
  }
}

/// @nodoc
const $ColorAttribute = _$ColorAttributeTearOff();

/// @nodoc
mixin _$ColorAttribute {
  Color get color => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Color color) $default, {
    required TResult Function(Color color) backgroundColor,
    required TResult Function(Color color) textColor,
    required TResult Function(Color color) shadowColor,
    required TResult Function(Color color) borderColor,
    required TResult Function(Color color) iconColor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Color color)? $default, {
    TResult Function(Color color)? backgroundColor,
    TResult Function(Color color)? textColor,
    TResult Function(Color color)? shadowColor,
    TResult Function(Color color)? borderColor,
    TResult Function(Color color)? iconColor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ColorAttribute value) $default, {
    required TResult Function(BackgroundColorAttribute value) backgroundColor,
    required TResult Function(TextColorAttribute value) textColor,
    required TResult Function(ShadowColorAttribute value) shadowColor,
    required TResult Function(BorderColorAttribute value) borderColor,
    required TResult Function(IconColorAttribute value) iconColor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ColorAttribute value)? $default, {
    TResult Function(BackgroundColorAttribute value)? backgroundColor,
    TResult Function(TextColorAttribute value)? textColor,
    TResult Function(ShadowColorAttribute value)? shadowColor,
    TResult Function(BorderColorAttribute value)? borderColor,
    TResult Function(IconColorAttribute value)? iconColor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorAttributeCopyWith<ColorAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorAttributeCopyWith<$Res> {
  factory $ColorAttributeCopyWith(
          ColorAttribute value, $Res Function(ColorAttribute) then) =
      _$ColorAttributeCopyWithImpl<$Res>;
  $Res call({Color color});
}

/// @nodoc
class _$ColorAttributeCopyWithImpl<$Res>
    implements $ColorAttributeCopyWith<$Res> {
  _$ColorAttributeCopyWithImpl(this._value, this._then);

  final ColorAttribute _value;
  // ignore: unused_field
  final $Res Function(ColorAttribute) _then;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
abstract class _$ColorAttributeCopyWith<$Res>
    implements $ColorAttributeCopyWith<$Res> {
  factory _$ColorAttributeCopyWith(
          _ColorAttribute value, $Res Function(_ColorAttribute) then) =
      __$ColorAttributeCopyWithImpl<$Res>;
  @override
  $Res call({Color color});
}

/// @nodoc
class __$ColorAttributeCopyWithImpl<$Res>
    extends _$ColorAttributeCopyWithImpl<$Res>
    implements _$ColorAttributeCopyWith<$Res> {
  __$ColorAttributeCopyWithImpl(
      _ColorAttribute _value, $Res Function(_ColorAttribute) _then)
      : super(_value, (v) => _then(v as _ColorAttribute));

  @override
  _ColorAttribute get _value => super._value as _ColorAttribute;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(_ColorAttribute(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_ColorAttribute extends _ColorAttribute {
  _$_ColorAttribute(this.color) : super._();

  @override
  final Color color;

  @override
  String toString() {
    return 'ColorAttribute(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ColorAttribute &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  _$ColorAttributeCopyWith<_ColorAttribute> get copyWith =>
      __$ColorAttributeCopyWithImpl<_ColorAttribute>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Color color) $default, {
    required TResult Function(Color color) backgroundColor,
    required TResult Function(Color color) textColor,
    required TResult Function(Color color) shadowColor,
    required TResult Function(Color color) borderColor,
    required TResult Function(Color color) iconColor,
  }) {
    return $default(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Color color)? $default, {
    TResult Function(Color color)? backgroundColor,
    TResult Function(Color color)? textColor,
    TResult Function(Color color)? shadowColor,
    TResult Function(Color color)? borderColor,
    TResult Function(Color color)? iconColor,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ColorAttribute value) $default, {
    required TResult Function(BackgroundColorAttribute value) backgroundColor,
    required TResult Function(TextColorAttribute value) textColor,
    required TResult Function(ShadowColorAttribute value) shadowColor,
    required TResult Function(BorderColorAttribute value) borderColor,
    required TResult Function(IconColorAttribute value) iconColor,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ColorAttribute value)? $default, {
    TResult Function(BackgroundColorAttribute value)? backgroundColor,
    TResult Function(TextColorAttribute value)? textColor,
    TResult Function(ShadowColorAttribute value)? shadowColor,
    TResult Function(BorderColorAttribute value)? borderColor,
    TResult Function(IconColorAttribute value)? iconColor,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ColorAttribute extends ColorAttribute {
  factory _ColorAttribute(Color color) = _$_ColorAttribute;
  _ColorAttribute._() : super._();

  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ColorAttributeCopyWith<_ColorAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackgroundColorAttributeCopyWith<$Res>
    implements $ColorAttributeCopyWith<$Res> {
  factory $BackgroundColorAttributeCopyWith(BackgroundColorAttribute value,
          $Res Function(BackgroundColorAttribute) then) =
      _$BackgroundColorAttributeCopyWithImpl<$Res>;
  @override
  $Res call({Color color});
}

/// @nodoc
class _$BackgroundColorAttributeCopyWithImpl<$Res>
    extends _$ColorAttributeCopyWithImpl<$Res>
    implements $BackgroundColorAttributeCopyWith<$Res> {
  _$BackgroundColorAttributeCopyWithImpl(BackgroundColorAttribute _value,
      $Res Function(BackgroundColorAttribute) _then)
      : super(_value, (v) => _then(v as BackgroundColorAttribute));

  @override
  BackgroundColorAttribute get _value =>
      super._value as BackgroundColorAttribute;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(BackgroundColorAttribute(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$BackgroundColorAttribute extends BackgroundColorAttribute {
  _$BackgroundColorAttribute(this.color) : super._();

  @override
  final Color color;

  @override
  String toString() {
    return 'ColorAttribute.backgroundColor(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BackgroundColorAttribute &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  $BackgroundColorAttributeCopyWith<BackgroundColorAttribute> get copyWith =>
      _$BackgroundColorAttributeCopyWithImpl<BackgroundColorAttribute>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Color color) $default, {
    required TResult Function(Color color) backgroundColor,
    required TResult Function(Color color) textColor,
    required TResult Function(Color color) shadowColor,
    required TResult Function(Color color) borderColor,
    required TResult Function(Color color) iconColor,
  }) {
    return backgroundColor(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Color color)? $default, {
    TResult Function(Color color)? backgroundColor,
    TResult Function(Color color)? textColor,
    TResult Function(Color color)? shadowColor,
    TResult Function(Color color)? borderColor,
    TResult Function(Color color)? iconColor,
    required TResult orElse(),
  }) {
    if (backgroundColor != null) {
      return backgroundColor(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ColorAttribute value) $default, {
    required TResult Function(BackgroundColorAttribute value) backgroundColor,
    required TResult Function(TextColorAttribute value) textColor,
    required TResult Function(ShadowColorAttribute value) shadowColor,
    required TResult Function(BorderColorAttribute value) borderColor,
    required TResult Function(IconColorAttribute value) iconColor,
  }) {
    return backgroundColor(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ColorAttribute value)? $default, {
    TResult Function(BackgroundColorAttribute value)? backgroundColor,
    TResult Function(TextColorAttribute value)? textColor,
    TResult Function(ShadowColorAttribute value)? shadowColor,
    TResult Function(BorderColorAttribute value)? borderColor,
    TResult Function(IconColorAttribute value)? iconColor,
    required TResult orElse(),
  }) {
    if (backgroundColor != null) {
      return backgroundColor(this);
    }
    return orElse();
  }
}

abstract class BackgroundColorAttribute extends ColorAttribute {
  factory BackgroundColorAttribute(Color color) = _$BackgroundColorAttribute;
  BackgroundColorAttribute._() : super._();

  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $BackgroundColorAttributeCopyWith<BackgroundColorAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextColorAttributeCopyWith<$Res>
    implements $ColorAttributeCopyWith<$Res> {
  factory $TextColorAttributeCopyWith(
          TextColorAttribute value, $Res Function(TextColorAttribute) then) =
      _$TextColorAttributeCopyWithImpl<$Res>;
  @override
  $Res call({Color color});
}

/// @nodoc
class _$TextColorAttributeCopyWithImpl<$Res>
    extends _$ColorAttributeCopyWithImpl<$Res>
    implements $TextColorAttributeCopyWith<$Res> {
  _$TextColorAttributeCopyWithImpl(
      TextColorAttribute _value, $Res Function(TextColorAttribute) _then)
      : super(_value, (v) => _then(v as TextColorAttribute));

  @override
  TextColorAttribute get _value => super._value as TextColorAttribute;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(TextColorAttribute(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

@Implements.fromString('TextTypeAttribute<Color>')
class _$TextColorAttribute extends TextColorAttribute {
  _$TextColorAttribute(this.color) : super._();

  @override
  final Color color;

  @override
  String toString() {
    return 'ColorAttribute.textColor(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TextColorAttribute &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  $TextColorAttributeCopyWith<TextColorAttribute> get copyWith =>
      _$TextColorAttributeCopyWithImpl<TextColorAttribute>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Color color) $default, {
    required TResult Function(Color color) backgroundColor,
    required TResult Function(Color color) textColor,
    required TResult Function(Color color) shadowColor,
    required TResult Function(Color color) borderColor,
    required TResult Function(Color color) iconColor,
  }) {
    return textColor(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Color color)? $default, {
    TResult Function(Color color)? backgroundColor,
    TResult Function(Color color)? textColor,
    TResult Function(Color color)? shadowColor,
    TResult Function(Color color)? borderColor,
    TResult Function(Color color)? iconColor,
    required TResult orElse(),
  }) {
    if (textColor != null) {
      return textColor(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ColorAttribute value) $default, {
    required TResult Function(BackgroundColorAttribute value) backgroundColor,
    required TResult Function(TextColorAttribute value) textColor,
    required TResult Function(ShadowColorAttribute value) shadowColor,
    required TResult Function(BorderColorAttribute value) borderColor,
    required TResult Function(IconColorAttribute value) iconColor,
  }) {
    return textColor(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ColorAttribute value)? $default, {
    TResult Function(BackgroundColorAttribute value)? backgroundColor,
    TResult Function(TextColorAttribute value)? textColor,
    TResult Function(ShadowColorAttribute value)? shadowColor,
    TResult Function(BorderColorAttribute value)? borderColor,
    TResult Function(IconColorAttribute value)? iconColor,
    required TResult orElse(),
  }) {
    if (textColor != null) {
      return textColor(this);
    }
    return orElse();
  }
}

abstract class TextColorAttribute extends ColorAttribute
    implements TextTypeAttribute<Color> {
  factory TextColorAttribute(Color color) = _$TextColorAttribute;
  TextColorAttribute._() : super._();

  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $TextColorAttributeCopyWith<TextColorAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShadowColorAttributeCopyWith<$Res>
    implements $ColorAttributeCopyWith<$Res> {
  factory $ShadowColorAttributeCopyWith(ShadowColorAttribute value,
          $Res Function(ShadowColorAttribute) then) =
      _$ShadowColorAttributeCopyWithImpl<$Res>;
  @override
  $Res call({Color color});
}

/// @nodoc
class _$ShadowColorAttributeCopyWithImpl<$Res>
    extends _$ColorAttributeCopyWithImpl<$Res>
    implements $ShadowColorAttributeCopyWith<$Res> {
  _$ShadowColorAttributeCopyWithImpl(
      ShadowColorAttribute _value, $Res Function(ShadowColorAttribute) _then)
      : super(_value, (v) => _then(v as ShadowColorAttribute));

  @override
  ShadowColorAttribute get _value => super._value as ShadowColorAttribute;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(ShadowColorAttribute(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$ShadowColorAttribute extends ShadowColorAttribute {
  _$ShadowColorAttribute(this.color) : super._();

  @override
  final Color color;

  @override
  String toString() {
    return 'ColorAttribute.shadowColor(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShadowColorAttribute &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  $ShadowColorAttributeCopyWith<ShadowColorAttribute> get copyWith =>
      _$ShadowColorAttributeCopyWithImpl<ShadowColorAttribute>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Color color) $default, {
    required TResult Function(Color color) backgroundColor,
    required TResult Function(Color color) textColor,
    required TResult Function(Color color) shadowColor,
    required TResult Function(Color color) borderColor,
    required TResult Function(Color color) iconColor,
  }) {
    return shadowColor(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Color color)? $default, {
    TResult Function(Color color)? backgroundColor,
    TResult Function(Color color)? textColor,
    TResult Function(Color color)? shadowColor,
    TResult Function(Color color)? borderColor,
    TResult Function(Color color)? iconColor,
    required TResult orElse(),
  }) {
    if (shadowColor != null) {
      return shadowColor(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ColorAttribute value) $default, {
    required TResult Function(BackgroundColorAttribute value) backgroundColor,
    required TResult Function(TextColorAttribute value) textColor,
    required TResult Function(ShadowColorAttribute value) shadowColor,
    required TResult Function(BorderColorAttribute value) borderColor,
    required TResult Function(IconColorAttribute value) iconColor,
  }) {
    return shadowColor(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ColorAttribute value)? $default, {
    TResult Function(BackgroundColorAttribute value)? backgroundColor,
    TResult Function(TextColorAttribute value)? textColor,
    TResult Function(ShadowColorAttribute value)? shadowColor,
    TResult Function(BorderColorAttribute value)? borderColor,
    TResult Function(IconColorAttribute value)? iconColor,
    required TResult orElse(),
  }) {
    if (shadowColor != null) {
      return shadowColor(this);
    }
    return orElse();
  }
}

abstract class ShadowColorAttribute extends ColorAttribute {
  factory ShadowColorAttribute(Color color) = _$ShadowColorAttribute;
  ShadowColorAttribute._() : super._();

  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $ShadowColorAttributeCopyWith<ShadowColorAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BorderColorAttributeCopyWith<$Res>
    implements $ColorAttributeCopyWith<$Res> {
  factory $BorderColorAttributeCopyWith(BorderColorAttribute value,
          $Res Function(BorderColorAttribute) then) =
      _$BorderColorAttributeCopyWithImpl<$Res>;
  @override
  $Res call({Color color});
}

/// @nodoc
class _$BorderColorAttributeCopyWithImpl<$Res>
    extends _$ColorAttributeCopyWithImpl<$Res>
    implements $BorderColorAttributeCopyWith<$Res> {
  _$BorderColorAttributeCopyWithImpl(
      BorderColorAttribute _value, $Res Function(BorderColorAttribute) _then)
      : super(_value, (v) => _then(v as BorderColorAttribute));

  @override
  BorderColorAttribute get _value => super._value as BorderColorAttribute;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(BorderColorAttribute(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$BorderColorAttribute extends BorderColorAttribute {
  _$BorderColorAttribute(this.color) : super._();

  @override
  final Color color;

  @override
  String toString() {
    return 'ColorAttribute.borderColor(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BorderColorAttribute &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  $BorderColorAttributeCopyWith<BorderColorAttribute> get copyWith =>
      _$BorderColorAttributeCopyWithImpl<BorderColorAttribute>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Color color) $default, {
    required TResult Function(Color color) backgroundColor,
    required TResult Function(Color color) textColor,
    required TResult Function(Color color) shadowColor,
    required TResult Function(Color color) borderColor,
    required TResult Function(Color color) iconColor,
  }) {
    return borderColor(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Color color)? $default, {
    TResult Function(Color color)? backgroundColor,
    TResult Function(Color color)? textColor,
    TResult Function(Color color)? shadowColor,
    TResult Function(Color color)? borderColor,
    TResult Function(Color color)? iconColor,
    required TResult orElse(),
  }) {
    if (borderColor != null) {
      return borderColor(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ColorAttribute value) $default, {
    required TResult Function(BackgroundColorAttribute value) backgroundColor,
    required TResult Function(TextColorAttribute value) textColor,
    required TResult Function(ShadowColorAttribute value) shadowColor,
    required TResult Function(BorderColorAttribute value) borderColor,
    required TResult Function(IconColorAttribute value) iconColor,
  }) {
    return borderColor(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ColorAttribute value)? $default, {
    TResult Function(BackgroundColorAttribute value)? backgroundColor,
    TResult Function(TextColorAttribute value)? textColor,
    TResult Function(ShadowColorAttribute value)? shadowColor,
    TResult Function(BorderColorAttribute value)? borderColor,
    TResult Function(IconColorAttribute value)? iconColor,
    required TResult orElse(),
  }) {
    if (borderColor != null) {
      return borderColor(this);
    }
    return orElse();
  }
}

abstract class BorderColorAttribute extends ColorAttribute {
  factory BorderColorAttribute(Color color) = _$BorderColorAttribute;
  BorderColorAttribute._() : super._();

  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $BorderColorAttributeCopyWith<BorderColorAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconColorAttributeCopyWith<$Res>
    implements $ColorAttributeCopyWith<$Res> {
  factory $IconColorAttributeCopyWith(
          IconColorAttribute value, $Res Function(IconColorAttribute) then) =
      _$IconColorAttributeCopyWithImpl<$Res>;
  @override
  $Res call({Color color});
}

/// @nodoc
class _$IconColorAttributeCopyWithImpl<$Res>
    extends _$ColorAttributeCopyWithImpl<$Res>
    implements $IconColorAttributeCopyWith<$Res> {
  _$IconColorAttributeCopyWithImpl(
      IconColorAttribute _value, $Res Function(IconColorAttribute) _then)
      : super(_value, (v) => _then(v as IconColorAttribute));

  @override
  IconColorAttribute get _value => super._value as IconColorAttribute;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(IconColorAttribute(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$IconColorAttribute extends IconColorAttribute {
  _$IconColorAttribute(this.color) : super._();

  @override
  final Color color;

  @override
  String toString() {
    return 'ColorAttribute.iconColor(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IconColorAttribute &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  $IconColorAttributeCopyWith<IconColorAttribute> get copyWith =>
      _$IconColorAttributeCopyWithImpl<IconColorAttribute>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Color color) $default, {
    required TResult Function(Color color) backgroundColor,
    required TResult Function(Color color) textColor,
    required TResult Function(Color color) shadowColor,
    required TResult Function(Color color) borderColor,
    required TResult Function(Color color) iconColor,
  }) {
    return iconColor(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Color color)? $default, {
    TResult Function(Color color)? backgroundColor,
    TResult Function(Color color)? textColor,
    TResult Function(Color color)? shadowColor,
    TResult Function(Color color)? borderColor,
    TResult Function(Color color)? iconColor,
    required TResult orElse(),
  }) {
    if (iconColor != null) {
      return iconColor(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ColorAttribute value) $default, {
    required TResult Function(BackgroundColorAttribute value) backgroundColor,
    required TResult Function(TextColorAttribute value) textColor,
    required TResult Function(ShadowColorAttribute value) shadowColor,
    required TResult Function(BorderColorAttribute value) borderColor,
    required TResult Function(IconColorAttribute value) iconColor,
  }) {
    return iconColor(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ColorAttribute value)? $default, {
    TResult Function(BackgroundColorAttribute value)? backgroundColor,
    TResult Function(TextColorAttribute value)? textColor,
    TResult Function(ShadowColorAttribute value)? shadowColor,
    TResult Function(BorderColorAttribute value)? borderColor,
    TResult Function(IconColorAttribute value)? iconColor,
    required TResult orElse(),
  }) {
    if (iconColor != null) {
      return iconColor(this);
    }
    return orElse();
  }
}

abstract class IconColorAttribute extends ColorAttribute {
  factory IconColorAttribute(Color color) = _$IconColorAttribute;
  IconColorAttribute._() : super._();

  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $IconColorAttributeCopyWith<IconColorAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}
