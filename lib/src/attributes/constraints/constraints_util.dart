import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../scalars/scalar_util.dart';
import 'constraints_dto.dart';

class BoxConstraintsUtility<T extends StyleAttribute>
    extends DtoUtility<T, BoxConstraintsDto, BoxConstraints> {
  late final maxWidth = DoubleUtility((v) => only(maxWidth: v));
  late final minWidth = DoubleUtility((v) => only(minWidth: v));
  late final minHeight = DoubleUtility((v) => only(minHeight: v));
  late final maxHeight = DoubleUtility((v) => only(maxHeight: v));

  BoxConstraintsUtility(super.builder)
      : super(valueToDto: BoxConstraintsDto.from);

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
}
