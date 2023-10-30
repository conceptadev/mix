// ignore_for_file: prefer-moving-to-variable

import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/dto/border_dto.dart';
import '../../core/dto/dtos.dart';
import '../../core/dto/radius_dto.dart';
import 'values_ext.dart';

extension ColorDtoExt on ColorDto {
  static ColorDto random() {
    return ColorDto(Color(0xFF000000 + Random().nextInt(0x00FFFFFF)));
  }
}

extension DoubleDtoExt on DoubleDto {
  static DoubleDto random() {
    return DoubleDto(Random().nextDouble());
  }
}

extension BorderStyleExt on BorderStyle {
  static BorderStyle random() {
    return BorderStyle.values[Random().nextInt(BorderStyle.values.length)];
  }
}

extension BorderSideDtoExt on BorderSideDto {
  static BorderSideDto random() {
    return BorderSideDto(
      color: ColorDtoExt.random(),
      style: BorderStyleExt.random(),
      width: DoubleDtoExt.random(),
    );
  }
}

extension RadiusDtoExt on RadiusDto {
  static RadiusDto random() {
    return RadiusDto.circular((Random().nextDouble() * 20).toDto);
  }
}

extension BoxBorderDtoExt on BoxBorderDto {
  static BoxBorderDto random() {
    return BoxBorderDto(
      top: BorderSideDtoExt.random(),
      bottom: BorderSideDtoExt.random(),
      left: BorderSideDtoExt.random(),
      right: BorderSideDtoExt.random(),
    );
  }

  static BoxBorderDto randomDirectional() {
    return BoxBorderDto(
      top: BorderSideDtoExt.random(),
      start: BorderSideDtoExt.random(),
      end: BorderSideDtoExt.random(),
      bottom: BorderSideDtoExt.random(),
      isDirectional: true,
    );
  }
}

extension BorderRadiusGeometryDtoExt on BorderRadiusGeometryDto {
  static BorderRadiusGeometryDto random() {
    return BorderRadiusGeometryDto(
      topLeft: RadiusDtoExt.random(),
      topRight: RadiusDtoExt.random(),
      bottomLeft: RadiusDtoExt.random(),
      bottomRight: RadiusDtoExt.random(),
    );
  }

  static BorderRadiusGeometryDto randomDirectional() {
    return BorderRadiusGeometryDto(
      topStart: RadiusDtoExt.random(),
      topEnd: RadiusDtoExt.random(),
      bottomStart: RadiusDtoExt.random(),
      bottomEnd: RadiusDtoExt.random(),
      isDirectional: true,
    );
  }
}
