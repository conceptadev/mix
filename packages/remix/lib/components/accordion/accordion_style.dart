part of 'accordion.dart';

final _accordion = AccordionSpecUtility.self;
final _container = _accordion.container;
final _flex = _accordion.flex;
final _header = _accordion.header;
final _contentContainer = _accordion.contentContainer;
final _textContent = _accordion.textContent;

class AccordionStyle {
  const AccordionStyle();

  static Style get _headerStyle => Style(
        _header.container.width.infinity(),
        _header.container.padding.vertical(16),
        _header.container.color.transparent(),
        // Header Flex
        _header.flex.gap(6),
        // Header Leading Icon
        _header.leadingIcon.size(18),
        // Header trailing Icon
        _header.trailingIcon.size(18),
        // Header Text
        _header.text.style.fontSize(16),
        _header.text.style.letterSpacing(0.4),
        _header.text.style.fontWeight.w600(),
        _header.text.style.decoration.none(),
        _header.trailingIcon.wrap.transform.rotate(0),
        $on.hover(_header.text.style.decoration.underline()),
        $on.selected(_header.trailingIcon.wrap.transform.rotate.d180()),
      );

  static Style get _flexStyle => Style(_flex.mainAxisSize.min());

  static Style get _contentStyle => Style(
        _contentContainer.padding.bottom(16),
        _contentContainer.wrap.align(
          alignment: Alignment.topCenter,
          heightFactor: 0,
        ),
        $on.selected(_contentContainer.wrap.align(heightFactor: 1)),
      );

  static Style get _containerStyle => Style(
        _container.border.bottom.color.black(),
        _container.border.bottom.color.withOpacity(0.2),
        $on.dark(
          _container.border.bottom.color.white(),
          _container.border.bottom.color.withOpacity(0.2),
        ),
        _container.clipBehavior.antiAlias(),
      );

  static Style get _textContainerStyle => Style(
        _textContent.style.fontSize(14),
        _textContent.style.height(1.4),
        _textContent.style.letterSpacing(0.2),
      );

  static Style get base => Style(
        _flexStyle(),
        _containerStyle(),
        _contentStyle(),
        _textContainerStyle(),
        _headerStyle(),
      );
}
