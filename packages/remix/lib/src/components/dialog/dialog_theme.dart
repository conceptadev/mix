part of 'dialog.dart';

class FortalezaDialogStyle extends DialogStyle {
  const FortalezaDialogStyle();

  @override
  Style makeStyle(SpecConfiguration<DialogSpecUtility> spec) {
    final $ = spec.utilities;

    final flexContainerStyle = $.flexContainer.chain
      ..padding.all.$space(4)
      ..borderRadius.all.$radius(2)
      ..border.all.color.$neutral(6)
      ..color.$neutral(1);

    final titleStyle = $.title.chain
      ..style.$text(5)
      ..style.color.$neutral(12);

    final descriptionStyle = $.description.chain
      ..style.$text(2)
      ..style.color.$neutral(9);

    return Style.create(
      [
        super.makeStyle(spec).call(),
        flexContainerStyle,
        titleStyle,
        descriptionStyle,
      ],
    );
  }
}
