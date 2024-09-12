part of 'accordion.dart';

class FortalezaAccordionStyle extends AccordionStyle {
  const FortalezaAccordionStyle();

  @override
  Style makeStyle(SpecConfiguration<AccordionSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    final lightVariant = Style(
      // Container
      $.container.chain
        ..border.all.color.$neutral(2)
        ..shape.roundedRectangle.borderRadius(6)
        ..shape.roundedRectangle.side.width(1)
        ..shape.roundedRectangle.side.strokeAlign(BorderSide.strokeAlignOutside)
        ..shape.roundedRectangle.side.color.blue()
        ..border.all.color.$neutral(7)
        ..border.all.color.withOpacity(1)
        ..borderRadius.all.$radius(2)
        ..color.$neutral(2),

      // Header
      $.header.chain
        ..container.padding.horizontal.$space(4)
        ..text.style.fontWeight.w400()
        ..text.style.color.$neutral(12)
        ..trailingIcon.color.$neutral(10)
        ..container.color.$white(),

      $.contentContainer.chain
        ..padding.all.$space(3)
        ..border.style.none()
        ..border.top.color.$neutral(6),

      // Text Container
      $.textContent.chain
        ..style.color.$neutral(10)
        ..style.fontWeight.w300(),

      // Variants
      spec.on.selected($.contentContainer.border.top.style.solid()),
      spec.on.hover(
        $.header.container.color.$neutral(2),
        $.header.text.style.decoration.none(),
      ),
    );

    // final darkVariant = Style(
    //   $.header.chain
    //     ..container.color.$neutral(12)
    //     ..text.style.color.$neutral(1),
    //   $.container.chain
    //     ..border.all.color.$neutral(11)
    //     ..border.all.color.withOpacity(0.5),
    //   $.contentContainer.chain
    //     ..color.$neutral(12)
    //     ..color.withOpacity(0.97),
    //   $.contentContainer.chain
    //     ..border.top.color.$neutral(11)
    //     ..border.color.withOpacity(0.3),
    //   spec.on.hover(
    //     $.header.chain
    //       ..container.color.$neutral(12)
    //       ..container.color.withOpacity(0.97),
    //   ),
    // );

    return Style.create([baseStyle(), lightVariant()]);
  }
}
