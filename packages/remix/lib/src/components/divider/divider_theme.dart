part of 'divider.dart';

class FortalezaDividerStyle extends DividerStyle {
  const FortalezaDividerStyle();

  @override
  Style makeStyle(SpecConfiguration<DividerSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    final containerStyle = [$.container.color.$neutral(5)];

    return Style.create([baseStyle(), ...containerStyle]);
  }
}
