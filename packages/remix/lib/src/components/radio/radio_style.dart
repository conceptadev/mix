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
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOutQuad,
      );
}

Style get _containerStyle => Style(
      _container.chain
        ..borderRadius(99)
        ..alignment.center()
        ..size(14)
        ..border.all.width(1)
        ..border.all.color.black(),
      $on.disabled(_container.border.color.black45()),
      $on.dark(
        _container.border.all.color.white(),
        $on.disabled(_container.border.color.white60()),
      ),
    );

Style get _indicatorStyle => Style(
      _indicator.chain
        ..borderRadius(99)
        ..color.black()
        ..wrap.padding.all(2)
        ..wrap.opacity(0)
        ..wrap.scale(0.5),
      $on.selected(_indicator.wrap.opacity(1), _indicator.wrap.scale(1)),
      $on.disabled(_indicator.color.black45()),
      $on.dark(
        _indicator.color.white(),
        $on.disabled(_indicator.color.white54()),
      ),
    );

Style get _textStyle => Style(
      _text.chain
        ..style.fontSize(14)
        ..style.height(1)
        ..style.fontWeight.w500()
        ..textHeightBehavior(
          const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        ),
    );

Style get _flexStyle => Style(
      _flex.chain
        ..row()
        ..mainAxisAlignment.start()
        ..crossAxisAlignment.center()
        ..gap(8),
    );
