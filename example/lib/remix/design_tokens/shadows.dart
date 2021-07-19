import 'package:flutter/material.dart';

class RemixShadows {
  get none => RemixElevation();
  get elevation20 => RemixElevation(blurRadius: 3, offset: Offset(0, 1));
  get elevation40 => RemixElevation(blurRadius: 4, offset: Offset(0, 2));
  get elevation60 => RemixElevation(blurRadius: 8, offset: Offset(0, 4));
  get elevation80 => RemixElevation(blurRadius: 16, offset: Offset(0, 8));
  get elevation100 => RemixElevation(blurRadius: 24, offset: Offset(0, 16));
}

class RemixElevation {
  final Offset? offset;
  final double? blurRadius;
  final double? spreadRadius;

  const RemixElevation({
    this.offset,
    this.blurRadius,
    this.spreadRadius,
  });
}
