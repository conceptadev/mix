import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

// Making this a getter so that it works with hot reload

StyleMix get onSurfaceMix => StyleMix(
      text.style(color: Colors.black),
      onDark(
        text.style(color: Colors.white),
      ),
    );

StyleMix get headingMix => StyleMix.create([
      text.style(fontSize: 24),
      ...onSurfaceMix.values,
    ]);

StyleMix get flexAlign => StyleMix(
      flex.mainAxisAlignment.start(),
      flex.crossAxisAlignment.start(),
      flex.mainAxisSize.max(),
      box.width(double.infinity),
    );
