part of 'accordion.dart';

class AccordionStyle extends SpecStyle<AccordionSpecUtility> {
  const AccordionStyle();

  @override
  Style makeStyle(SpecConfiguration<AccordionSpecUtility> spec) {
    final $ = spec.utilities;

    final flexStyle = [$.flex.mainAxisSize.min()];

    final containerStyle = [
      $.container.chain
        ..clipBehavior.antiAlias()
        ..border.bottom.color.black()
        ..border.bottom.color.withOpacity(0.2),
    ];

    final contentStyle = [
      $.contentContainer.padding.bottom(16),
      $.contentContainer.wrap.align(
        alignment: Alignment.topCenter,
        heightFactor: 0,
      ),
      spec.on.selected($.contentContainer.wrap.align(heightFactor: 1)),
    ];

    final textContainerStyle = [
      $.textContent.chain
        ..style.fontSize(14)
        ..style.height(1.4)
        ..style.letterSpacing(0.2),
    ];

    final headerStyle = [
      $.header.container.chain
        ..width.infinity()
        ..padding.vertical(16)
        ..color.transparent(),
      $.header.chain
        ..flex.gap(6)
        ..leadingIcon.size(18)
        ..trailingIcon.wrap.transform.rotate(0)
        ..trailingIcon.size(18),
      $.header.text.chain
        ..style.fontSize(16)
        ..style.letterSpacing(0.4)
        ..style.fontWeight.w600()
        ..style.decoration.none(),
      spec.on.hover($.header.text.style.decoration.underline()),
      spec.on.selected($.header.trailingIcon.wrap.transform.rotate.d180()),
    ];

    return Style.create([
      ...flexStyle,
      ...containerStyle,
      ...contentStyle,
      ...textContainerStyle,
      ...headerStyle,
    ]);
  }
}

class AccordionDarkStyle extends AccordionStyle {
  const AccordionDarkStyle();

  @override
  Style makeStyle(SpecConfiguration<AccordionSpecUtility> spec) {
    final $ = spec.utilities;

    return Style.create([
      super.makeStyle(spec).call(),
      $.container.border.bottom.color.white(),
    ]);
  }
}
