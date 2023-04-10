import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/dtos/border/border.dto.dart';
import 'package:mix/src/dtos/color.dto.dart';
import 'package:mix/src/dtos/edge_insets/edge_insets.dto.dart';
import 'package:mix/src/dtos/radius/border_radius.dto.dart';
import 'package:mix/src/dtos/radius/radius_dto.dart';
import 'package:mix/src/dtos/shadow/box_shadow.dto.dart';

void main() {
  group("Box Attributes", () {
    test('-> Margin', () async {
      const marginAttribute =
          StyledContainerAttributes(margin: EdgeInsetsDto.all(20));
      final marginUtilityAttribute = margin(20);

      expect(
        marginAttribute,
        marginUtilityAttribute,
        reason: 'Margin utility does not match attribute',
      );

      expect(
        marginAttribute.margin,
        marginUtilityAttribute.margin,
        reason: 'Margin values on attribute do not match',
      );

      expect(
        marginAttribute.margin,
        const EdgeInsetsDto.all(20),
        reason: 'Margin attribute does not match EdgeInsetsDto.all(20)',
      );
    });

    test('-> Padding', () async {
      const paddingAttribute =
          StyledContainerAttributes(padding: EdgeInsetsDto.all(30));
      final paddingUtilityAttribute = padding(30);

      expect(
        paddingAttribute,
        paddingUtilityAttribute,
        reason: 'Padding utility does not match attribute',
      );

      expect(
        paddingAttribute.padding,
        paddingUtilityAttribute.padding,
        reason: 'Padding values on attribute do not match',
      );

      expect(
        paddingAttribute.padding,
        const EdgeInsetsDto.all(30),
        reason: 'Padding attribute does not match EdgeInsetsDto.all(30)',
      );
    });

    test('-> Width', () async {
      const widthAttribute = StyledContainerAttributes(width: 40);
      final widthUtilityAttribute = width(40);

      expect(
        widthAttribute,
        widthUtilityAttribute,
        reason: 'Width utility does not match attribute',
      );

      expect(
        widthAttribute.width,
        widthUtilityAttribute.width,
        reason: 'Width values on attribute do not match',
      );

      expect(
        widthAttribute.width,
        40,
        reason: 'Width attribute does not match 20',
      );
    });

    test('-> Height', () async {
      const heightAttribute = StyledContainerAttributes(height: 50);
      final heightUtilityAttribute = height(50);

      expect(
        heightAttribute,
        heightUtilityAttribute,
        reason: 'Height utility does not match attribute',
      );

      expect(
        heightAttribute.height,
        heightUtilityAttribute.height,
        reason: 'Height values on attribute do not match',
      );

      expect(
        heightAttribute.height,
        50,
        reason: 'Height attribute does not match 20',
      );
    });

    test('-> Min Width', () async {
      const minWidthAttribute = StyledContainerAttributes(minWidth: 60);
      final minWidthUtilityAttribute = minWidth(60);

      expect(
        minWidthAttribute,
        minWidthUtilityAttribute,
        reason: 'Min Width utility does not match attribute',
      );

      expect(
        minWidthAttribute.minWidth,
        minWidthUtilityAttribute.minWidth,
        reason: 'Min Width values on attribute do not match',
      );

      expect(
        minWidthAttribute.minWidth,
        60,
        reason: 'Min Width attribute does not match 20',
      );
    });

    test('-> Min Height', () async {
      const minHeightAttribute = StyledContainerAttributes(minHeight: 70);
      final minHeightUtilityAttribute = minHeight(70);

      expect(
        minHeightAttribute,
        minHeightUtilityAttribute,
        reason: 'Min Height utility does not match attribute',
      );

      expect(
        minHeightAttribute.minHeight,
        minHeightUtilityAttribute.minHeight,
        reason: 'Min Height values on attribute do not match',
      );

      expect(
        minHeightAttribute.minHeight,
        70,
        reason: 'Min Height attribute does not match 20',
      );
    });

    test('-> Max Width', () async {
      const maxWidthAttribute = StyledContainerAttributes(maxWidth: 80);
      final maxWidthUtilityAttribute = maxWidth(80);

      expect(
        maxWidthAttribute,
        maxWidthUtilityAttribute,
        reason: 'Max Width utility does not match attribute',
      );

      expect(
        maxWidthAttribute.maxWidth,
        maxWidthUtilityAttribute.maxWidth,
        reason: 'Max Width values on attribute do not match',
      );

      expect(
        maxWidthAttribute.maxWidth,
        80,
        reason: 'Max Width attribute does not match 20',
      );
    });

    test('-> Max Height', () async {
      const maxHeightAttribute = StyledContainerAttributes(maxHeight: 90);
      final maxHeightUtilityAttribute = maxHeight(90);

      expect(
        maxHeightAttribute,
        maxHeightUtilityAttribute,
        reason: 'Max Height utility does not match attribute',
      );

      expect(
        maxHeightAttribute.maxHeight,
        maxHeightUtilityAttribute.maxHeight,
        reason: 'Max Height values on attribute do not match',
      );

      expect(
        maxHeightAttribute.maxHeight,
        90,
        reason: 'Max Height attribute does not match 20',
      );
    });

    test('-> Alignment', () async {
      const alignmentAttribute =
          StyledContainerAttributes(alignment: Alignment.topLeft);
      final alignmentUtilityAttribute = align(Alignment.topLeft);

      expect(
        alignmentAttribute,
        alignmentUtilityAttribute,
        reason: 'Alignment utility does not match attribute',
      );

      expect(
        alignmentAttribute.alignment,
        alignmentUtilityAttribute.alignment,
        reason: 'Alignment values on attribute do not match',
      );

      expect(
        alignmentAttribute.alignment,
        Alignment.topLeft,
        reason: 'Alignment attribute does not match Alignment.topLeft',
      );
    });

    // Border Radius

    test('-> Border Radius', () async {
      const borderRadiusAttribute = StyledContainerAttributes(
        borderRadius: BorderRadiusDto.all(
          RadiusDto.circular(10),
        ),
      );
      final borderRadiusUtilityAttribute = rounded(10);

      expect(
        borderRadiusAttribute,
        borderRadiusUtilityAttribute,
        reason: 'Border Radius utility does not match attribute',
      );

      expect(
        borderRadiusAttribute.borderRadius,
        borderRadiusUtilityAttribute.borderRadius,
        reason: 'Border Radius values on attribute do not match',
      );

      expect(
        borderRadiusAttribute.borderRadius,
        const BorderRadiusDto.all(RadiusDto.circular(10)),
        reason:
            'Border Radius attribute does not match BorderRadiusDto.all(10)',
      );

      const topLeftBorderRadius = StyledContainerAttributes(
        borderRadius: BorderRadiusDto.only(
          topLeft: RadiusDto.circular(10),
        ),
      );
      final topLeftBorderRadiusUtility = roundedTL(10);

      expect(
        topLeftBorderRadius,
        topLeftBorderRadiusUtility,
        reason: 'Border Radius utility does not match attribute',
      );

      expect(
        topLeftBorderRadius.borderRadius,
        topLeftBorderRadiusUtility.borderRadius,
        reason: 'Border Radius values on attribute do not match',
      );

      expect(
        topLeftBorderRadius.borderRadius,
        const BorderRadiusDto.only(topLeft: RadiusDto.circular(10)),
        reason:
            'Border Radius attribute does not match BorderRadiusDto.only(topLeft: 10)',
      );
    });

    // Border

    test('-> Border', () async {
      final borderAttribute = StyledContainerAttributes(
        border: BorderDto.all(
          style: BorderStyle.solid,
          width: 10,
          color: const ColorDto(Colors.red),
        ),
      );
      final borderUtilityAttribute = border(
        style: BorderStyle.solid,
        width: 10,
        color: Colors.red,
      );

      expect(
        borderAttribute,
        borderUtilityAttribute,
        reason: 'Border utility does not match attribute',
      );

      expect(
        borderAttribute.border,
        borderUtilityAttribute.border,
        reason: 'Border values on attribute do not match',
      );

      expect(
        borderAttribute.border,
        BorderDto.all(
          style: BorderStyle.solid,
          width: 10,
          color: const ColorDto(Colors.red),
        ),
        reason: 'Border attribute does not match BorderDto.all(10)',
      );
    });

    // Shadows

    test('-> Shadow', () async {
      const shadowAttribute = StyledContainerAttributes(
        boxShadow: [
          BoxShadowDto(
            color: ColorDto(Colors.red),
            offset: Offset(10, 10),
            blurRadius: 10,
            spreadRadius: 15,
          ),
        ],
      );
      final shadowUtilityAttribute = shadow(
        color: Colors.red,
        offset: const Offset(10, 10),
        blurRadius: 10,
        spreadRadius: 15,
      );

      expect(
        shadowAttribute,
        shadowUtilityAttribute,
        reason: 'Shadow utility does not match attribute',
      );

      expect(
        shadowAttribute.boxShadow,
        shadowUtilityAttribute.boxShadow,
        reason: 'Shadow values on attribute do not match',
      );

      expect(
        shadowAttribute.boxShadow,
        [
          const BoxShadowDto(
            color: ColorDto(Colors.red),
            offset: Offset(10, 10),
            blurRadius: 10,
            spreadRadius: 15,
          ),
        ],
        reason: 'Shadow attribute does not match ShadowDto(10)',
      );
    });

    // Transform
    //TODO: Implement transform

    test('-> Transform', () async {
      final transformAttribute = StyledContainerAttributes(
        transform: Matrix4.rotationZ(0.1),
      );
      final transformUtilityAttribute = transform(Matrix4.rotationZ(0.1));

      expect(
        transformAttribute,
        transformUtilityAttribute,
        reason: 'Transform utility does not match attribute',
      );

      expect(
        transformAttribute.transform,
        transformUtilityAttribute.transform,
        reason: 'Transform values on attribute do not match',
      );

      expect(
        transformAttribute.transform,
        Matrix4.rotationZ(0.1),
        reason: 'Transform attribute does not match TransformDto(10)',
      );
    });
  });
}
