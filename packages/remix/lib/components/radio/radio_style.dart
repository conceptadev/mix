part of 'radio.dart';

final _radio = RadioSpecUtility.self;
final _container = _radio.container;
final _indicator = _radio.indicator;
final _flex = _radio.flex;
final _text = _radio.text;

class XRadioStyle {
  static Style get container => Style(
        _container.borderRadius(99),
        _container.alignment.center(),
        _container.size(14),
        _container.border.all.width(1),
        _container.border.all.color.black(),
        $on.disabled(
          _container.border.color.black.brighten(80),
        ),
        $on.dark(
          _container.border.all.color.white(),
          $on.disabled(
            _container.border.color.black.darken(30),
          ),
        ),
      );
  static Style get indicator => Style(
        _indicator.borderRadius(99),
        _indicator.color.black(),
        _indicator.wrap.padding.all(2),
        _indicator.wrap.opacity(0),
        _indicator.wrap.scale(0.5),
        $on.selected(
          _indicator.wrap.opacity(1),
          _indicator.wrap.scale(1),
        ),
        $on.disabled(
          _indicator.color.black.brighten(70),
        ),
        $on.dark(
          _indicator.color.white(),
          $on.disabled(
            _indicator.color.black.darken(50),
          ),
        ),
      );

  static Style get text => Style(
        _text.style.fontSize(14),
        _text.style.height(1),
        _text.style.fontWeight.w500(),
        _text.textHeightBehavior(TextHeightBehavior(
          applyHeightToFirstAscent: false,
          applyHeightToLastDescent: false,
        )),
        $on.disabled(
          _indicator.color.black.brighten(70),
        ),
      );

  static Style get flex => Style(
        _flex.row(),
        _flex.mainAxisAlignment.start(),
        _flex.crossAxisAlignment.center(),
        _flex.gap(8),
      );

  static Style get base => Style(
        container(),
        indicator(),
        text(),
        flex(),
      ).animate(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOutQuad,
      );
}
