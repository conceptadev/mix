part of 'accordion.dart';

class XAccordionThemeStyle extends XAccordionStyle {
  static Style get value => Style(
        XAccordionStyle.base(),
        _lightVariant(),
        $on.dark(_darkVariant()),
      ).animate(curve: Curves.decelerate);
}

Style get _lightVariant => Style(
      // Container
      _container.chain
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
      _header.chain
        ..container.padding.horizontal.$space(4)
        ..text.style.fontWeight.w400()
        ..text.style.color.$neutral(12)
        ..trailingIcon.color.$neutral(10)
        ..container.color.$white(),

      _contentContainer.chain
        ..padding.all.$space(3)
        ..border.style.none()
        ..border.top.color.$neutral(6),

      // Text Container
      _textContent.chain
        ..style.color.$neutral(10)
        ..style.fontWeight.w300(),

      // Variants
      openedVariant(_contentContainer.border.top.style.solid()),
      $on.hover(
        _header.container.color.$neutral(2),
        _header.text.style.decoration.none(),
      ),
    );

Style get _darkVariant => Style(
      _header.chain
        ..container.color.$neutral(12)
        ..text.style.color.$neutral(1),
      _container.chain
        ..border.all.color.$neutral(11)
        ..border.all.color.withOpacity(0.5),
      _contentContainer.chain
        ..color.$neutral(12)
        ..color.withOpacity(0.97),
      _contentContainer.chain
        ..border.top.color.$neutral(11)
        ..border.color.withOpacity(0.3),
      $on.hover(
        _header.chain
          ..container.color.$neutral(12)
          ..container.color.withOpacity(0.97),
      ),
    );
