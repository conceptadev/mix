import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

// Making this a getter so that it works with hot reload

Style get onSurfaceMix => Style(
      text.style(color: Colors.black),
      onDark(
        text.style(color: Colors.white),
      ),
    );

Style get headingMix => Style.create([
      text.style(fontSize: 24),
      ...onSurfaceMix.values,
    ]);

Style get flexAlign => Style(
      flex.mainAxisAlignment.start(),
      flex.crossAxisAlignment.start(),
      flex.mainAxisSize.max(),
      box.width(double.infinity),
    );
