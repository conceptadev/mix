import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

// Making this a getter so that it works with hot reload

StyleMix get onSurfaceMix => StyleMix(
      textStyle(color: Colors.black),
      onDark(
        textStyle(color: Colors.white),
      ),
    );

StyleMix get headingMix => StyleMix.create([
      textStyle(fontSize: 24),
      ...onSurfaceMix.values,
    ]);

StyleMix get flexAlign => StyleMix(
      mainAxisAlignment(MainAxisAlignment.start),
      crossAxis(CrossAxisAlignment.start),
      mainAxisSize(MainAxisSize.max),
      width(double.infinity),
    );
