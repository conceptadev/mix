part of 'textfield.dart';

class FortalezaTextFieldStyle extends TextFieldStyle {
  const FortalezaTextFieldStyle();

  @override
  Style makeStyle(SpecConfiguration<TextFieldSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = $.container.chain
      ..color.$neutral(1)
      ..padding.horizontal.$space(3)
      ..padding.vertical.$space(2)
      ..borderRadius.all.$radius(2)
      ..border.all.color.$neutral(6)
      ..border.all.strokeAlign.outside()
      ..shadow.color.$neutral(4);

    final textStyle = [$.style.$text(2), $.style.color.$neutral(12)];

    final layoutStyle = $.containerLayout.gap.$space(2);

    final contentLayoutStyle = $.contentLayout.gap.$space(2);

    final hintStyle = [
      $.hintTextStyle.color.$neutral(9),
      $.hintTextStyle.$text(2),
    ];

    final floatingHintStyle = [
      $.floatingLabelStyle.color.$neutral(9),
      $.floatingLabelStyle.$text(1),
    ];

    final helperStyle = [
      $.helperText.style.color.$neutral(9),
      $.helperText.style.$text(1),
    ];
    final icon = $.icon.color.$accent();

    final focus = spec.on.focus(
      $.container.chain
        ..border.all.color.$accent()
        ..border.all.width(2),
    );

    return Style.create([
      super.makeStyle(spec).call(),
      $.floatingLabel.on(),
      $.cursorColor.$neutral(12),
      containerStyle,
      layoutStyle,
      ...textStyle,
      ...hintStyle,
      ...floatingHintStyle,
      contentLayoutStyle,
      ...helperStyle,
      icon,
      focus,
    ]).animate();
  }
}
