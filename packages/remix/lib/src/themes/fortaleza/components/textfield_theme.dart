import 'package:mix/mix.dart';

import '../../../components/textfield/textfield.dart';
import '../tokens.dart';

class FortalezaTextFieldStyle extends TextFieldStyle {
  const FortalezaTextFieldStyle();

  @override
  Style makeStyle(SpecConfiguration<TextFieldSpecUtility> spec) {
    final $ = spec.utilities;

    final textFieldContainerStyle = $.textFieldContainer.chain
      ..color.$neutral(1)
      ..padding.horizontal.$space3()
      ..padding.vertical.$space2()
      ..borderRadius.all.$radius2()
      ..border.all.color.$neutral()
      ..border.all.strokeAlign.outside()
      ..shadow.color.$neutral(4)
      ..flex.gap.$space2();

    final textStyle = [$.style.$text2(), $.style.color.$neutral()];

    final containerStyle = $.container.flex.gap.$space2();

    final hintStyle = [
      $.hintTextStyle.color.$neutral(),
      $.hintTextStyle.$text2(),
    ];

    final floatingHintStyle = [
      $.floatingLabelStyle.color.$neutral(),
      $.floatingLabelStyle.$text1(),
    ];

    final helperStyle = [
      $.helperText.style.color.$neutral(),
      $.helperText.style.$text1(),
    ];
    final icon = $.icon.color.$accent();

    final focus = spec.on.focus(
      $.textFieldContainer.chain
        ..border.all.color.$accent()
        ..border.all.width(2),
    );

    return Style.create([
      super.makeStyle(spec).call(),
      $.floatingLabel.on(),
      $.cursorColor.$neutral(12),
      textFieldContainerStyle,
      containerStyle,
      ...textStyle,
      ...hintStyle,
      ...floatingHintStyle,
      ...helperStyle,
      icon,
      focus,
    ]).animate();
  }
}
