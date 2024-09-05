part of 'accordion.dart';

final _container = $accordion.container;
final _flex = $accordion.flex;
final _header = $accordion.header;
final _contentContainer = $accordion.contentContainer;
final _textContent = $accordion.textContent;

class XAccordionStyle {
  static Style get base => Style(
        _flexStyle(),
        _containerStyle(),
        _contentStyle(),
        _textContainerStyle(),
        _headerStyle(),
      );
}

Style get _headerStyle => Style(
      _header.container.chain
        ..width.infinity()
        ..padding.vertical(16)
        ..color.transparent(),
      _header.chain
        ..flex.gap(6)
        ..leadingIcon.size(18)
        ..trailingIcon.wrap.transform.rotate(0)
        ..trailingIcon.size(18),
      _header.text.chain
        ..style.fontSize(16)
        ..style.letterSpacing(0.4)
        ..style.fontWeight.w600()
        ..style.decoration.none(),
      $on.hover(_header.text.style.decoration.underline()),
      openedVariant(_header.trailingIcon.wrap.transform.rotate.d180()),
    );

Style get _flexStyle => Style(_flex.mainAxisSize.min());

Style get _contentStyle => Style(
      _contentContainer.padding.bottom(16),
      _contentContainer.wrap.align(
        alignment: Alignment.topCenter,
        heightFactor: 0,
      ),
      openedVariant(_contentContainer.wrap.align(heightFactor: 1)),
    );

Style get _containerStyle => Style(
      _container.chain
        ..clipBehavior.antiAlias()
        ..border.bottom.color.black()
        ..border.bottom.color.withOpacity(0.2),
    );

Style get _textContainerStyle => Style(
      _textContent.chain
        ..style.fontSize(14)
        ..style.height(1.4)
        ..style.letterSpacing(0.2),
    );
