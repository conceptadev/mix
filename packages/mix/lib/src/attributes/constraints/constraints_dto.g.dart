// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constraints_dto.dart';

// **************************************************************************
// Generator: DtoDefinitionBuilder
// **************************************************************************

mixin _$BoxConstraintsDto on Dto<BoxConstraints> {
  @override
  BoxConstraints resolve(MixData mix) {
    const defaultValue = BoxConstraints();

    return BoxConstraints(
      minWidth: _$this.minWidth ?? defaultValue.minWidth,
      maxWidth: _$this.maxWidth ?? defaultValue.maxWidth,
      minHeight: _$this.minHeight ?? defaultValue.minHeight,
      maxHeight: _$this.maxHeight ?? defaultValue.maxHeight,
    );
  }

  @override
  BoxConstraintsDto merge(BoxConstraintsDto? other) {
    if (other == null) return _$this;

    return BoxConstraintsDto(
      minWidth: other.minWidth ?? _$this.minWidth,
      maxWidth: other.maxWidth ?? _$this.maxWidth,
      minHeight: other.minHeight ?? _$this.minHeight,
      maxHeight: other.maxHeight ?? _$this.maxHeight,
    );
  }

  /// The list of properties that constitute the state of this [BoxConstraintsDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxConstraintsDto] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.minWidth,
      _$this.maxWidth,
      _$this.minHeight,
      _$this.maxHeight,
    ];
  }

  BoxConstraintsDto get _$this => this as BoxConstraintsDto;
}

/// Utility class for configuring [BoxConstraintsDto] properties.
///
/// This class provides methods to set individual properties of a [BoxConstraintsDto].
///
/// Use the methods of this class to configure specific properties of a [BoxConstraintsDto].
final class BoxConstraintsUtility<T extends Attribute>
    extends DtoUtility<T, BoxConstraintsDto, BoxConstraints> {
  BoxConstraintsUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  /// Utility for defining [BoxConstraintsDto.minWidth]
  late final minWidth = DoubleUtility((v) => only(minWidth: v));

  /// Utility for defining [BoxConstraintsDto.maxWidth]
  late final maxWidth = DoubleUtility((v) => only(maxWidth: v));

  /// Utility for defining [BoxConstraintsDto.minHeight]
  late final minHeight = DoubleUtility((v) => only(minHeight: v));

  /// Utility for defining [BoxConstraintsDto.maxHeight]
  late final maxHeight = DoubleUtility((v) => only(maxHeight: v));

  /// Returns a new [BoxConstraintsDto] with the specified properties.
  @override
  T only({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return builder(
      BoxConstraintsDto(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
    );
  }

  T call({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return only(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }
}

extension BoxConstraintsExt on BoxConstraints {
  BoxConstraintsDto toDto() {
    return BoxConstraintsDto(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }
}
