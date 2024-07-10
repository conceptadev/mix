import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/card/card.style.dart';
import 'package:remix/components/card/card.variants.dart';
import 'package:remix/components/card/card_spec.dart';

class RxCard extends StatelessWidget {
  const RxCard({
    super.key,
    required this.children,
    this.variant = CardVariant.solid,
    this.style,
  });

  /// The list of child widgets to be displayed inside the card.
  final List<Widget> children;

  final CardVariant variant;

  /// Additional custom styling for the card.
  ///
  /// This allows you to override or extend the default card styling.
  final Style? style;

  Style _buildStyle() {
    return buildCardstyle(style).applyVariant(variant).animate();
  }

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _buildStyle(),
      builder: (context) {
        final spec = CardSpec.of(context);

        return spec.container(
          child: spec.flex(
            direction: Axis.vertical,
            children: children,
          ),
        );
      },
    );
  }
}
