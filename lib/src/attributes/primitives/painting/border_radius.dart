import 'package:flutter/material.dart';
import 'package:mix/src/attributes/animation/animated_mix.dart';

import '../../../helpers/utils.dart';
import '../../base_attribute.dart';

// TODO: Move this into utility
class BorderRadiusUtility {
  const BorderRadiusUtility();
  BorderRadiusAttribute get none {
    return all(0.0);
  }

  BorderRadiusAttribute all(double radius) {
    return BorderRadiusAttribute(
      topLeft: radius,
      topRight: radius,
      bottomLeft: radius,
      bottomRight: radius,
    );
  }

  /// The top left radius
  BorderRadiusAttribute topLeft(double size) {
    return BorderRadiusAttribute(
      topLeft: size,
    );
  }

  /// The top right radius
  BorderRadiusAttribute topRight(double size) {
    return BorderRadiusAttribute(
      topRight: size,
    );
  }

  /// The bottom left radius
  BorderRadiusAttribute bottomLeft(double size) {
    return BorderRadiusAttribute(
      bottomLeft: size,
    );
  }

  /// The bottom right radius
  BorderRadiusAttribute bottomRight(double size) {
    return BorderRadiusAttribute(
      bottomRight: size,
    );
  }

  /// Builds radius from list using same logic as
  /// https://www.w3schools.com/cssref/css3_pr_border-radius.asp
  BorderRadiusAttribute fromParams([
    double? p1,
    double? p2,
    double? p3,
    double? p4,
  ]) {
    final values = positionalToList(p1, p2, p3, p4);
    BorderRadiusAttribute borderRadius;
    const borderRadiusUtility = BorderRadiusUtility();

    if (values.isEmpty) {
      return borderRadiusUtility.none;
    }

    switch (values.length) {
      case 1:
        borderRadius = borderRadiusUtility.all(values[0]);
        break;
      case 2:
        final first = values[0];
        final second = values[1];
        borderRadius = BorderRadiusAttribute(
          topLeft: first,
          bottomRight: first,
          topRight: second,
          bottomLeft: second,
        );
        break;
      case 3:
        final first = values[0];
        final second = values[1];
        final third = values[2];

        borderRadius = BorderRadiusAttribute(
          topLeft: first,
          topRight: second,
          bottomLeft: second,
          bottomRight: third,
        );
        break;
      case 4:
        final first = values[0];
        final second = values[1];
        final third = values[2];
        final fourth = values[3];

        borderRadius = BorderRadiusAttribute(
          topLeft: first,
          topRight: second,
          bottomRight: third,
          bottomLeft: fourth,
        );
        break;
      default:
        borderRadius = borderRadiusUtility.none;
    }

    return borderRadius;
  }
}

/// Border radius attribute
class BorderRadiusAttribute extends Attribute<BorderRadius> with AnimatedMix<BorderRadius> {
  BorderRadiusAttribute({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  @override
  BorderRadius get value {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0.0),
      topRight: Radius.circular(topRight ?? 0.0),
      bottomLeft: Radius.circular(bottomLeft ?? 0.0),
      bottomRight: Radius.circular(bottomRight ?? 0.0),
    );
  }

  BorderRadiusAttribute copyWith(BorderRadiusAttribute other) {
    return BorderRadiusAttribute(
      topLeft: other.topLeft ?? topLeft,
      topRight: other.topRight ?? topRight,
      bottomLeft: other.bottomLeft ?? bottomLeft,
      bottomRight: other.bottomRight ?? bottomRight,
    );
  }
}
