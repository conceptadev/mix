part of 'scaffold.dart';

class FortalezaScaffoldStyle extends ScaffoldStyle {
  const FortalezaScaffoldStyle();

  @override
  Style makeStyle(SpecConfiguration<ScaffoldSpecUtility> spec) {
    final $ = spec.utilities;

    return Style.create([$.container.color.$neutral(1)]);
  }
}
