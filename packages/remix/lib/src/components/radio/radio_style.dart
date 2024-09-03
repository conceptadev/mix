part of 'radio.dart';

final _container = $radio.container;
final _indicator = $radio.indicator;
final _flex = $radio.flex;
final _text = $radio.text;

class XRadioStyle {
  static Style get base => Style(
        _containerStyle(),
        _indicatorStyle(),
        _textStyle(),
        _flexStyle(),
      ).animate(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOutQuad,
      );
}

Style get _containerStyle => Style(
      _container.borderRadius(99),
      _container.alignment.center(),
      _container.size(14),
      _container.border.all.width(1),
      _container.border.all.color.black(),
      $on.disabled(_container.border.color.black45()),
      $on.dark(
        _container.border.all.color.white(),
        $on.disabled(_container.border.color.white60()),
      ),
    );

Style get _indicatorStyle => Style(
      _indicator.borderRadius(99),
      _indicator.color.black(),
      _indicator.wrap.padding.all(2),
      _indicator.wrap.opacity(0),
      _indicator.wrap.scale(0.5),
      $on.selected(_indicator.wrap.opacity(1), _indicator.wrap.scale(1)),
      $on.disabled(_indicator.color.black45()),
      $on.dark(
        _indicator.color.white(),
        $on.disabled(_indicator.color.white54()),
      ),
    );

Style get _textStyle => Style(
      _text.style.fontSize(14),
      _text.style.height(1),
      _text.style.fontWeight.w500(),
      _text.textHeightBehavior(TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      )),
    );

Style get _flexStyle => Style(
      _flex.row(),
      _flex.mainAxisAlignment.start(),
      _flex.crossAxisAlignment.center(),
      _flex.gap(8),
    );
