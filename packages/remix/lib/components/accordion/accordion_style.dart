part of 'accordion.dart';

final _accordion = AccordionSpecUtility.self;
final _container = _accordion.container;
final _header = _accordion.header;
final _contentContainer = _accordion.contentContainer;
final _flex = _accordion.flex;
final _textContent = _accordion.textContent;

get _iconAnimation => Style(
      _header.trailingIcon.wrap.transform.rotate(0),
      $on.selected(
        _header.trailingIcon.wrap.transform.rotate(math.pi),
      ),
    );

Style get _headerStyle => Style(
      _header.container.width.infinity(),
      _header.container.padding.horizontal(16),
      _header.container.padding.vertical(12),
      _header.container.color.$white(),
      // Header Flex
      _header.flex.gap(6),
      // Header Leading Icon
      _header.leadingIcon.color.$accent(9),
      _header.leadingIcon.size(18),
      // Header trailing Icon
      _header.trailingIcon.color.$neutral(10),
      _header.trailingIcon.size(18),
      // Header Text
      _header.text.style.fontWeight.w500(),
      _header.text.style.color.$accent(),
      _header.text.style.fontSize(15),
      _iconAnimation(),
    );

Style get _flexStyle => Style(
      _flex.mainAxisSize.min(),
    );

Style get _contentStyle => Style(
      _contentContainer.padding.horizontal(16),
      _contentContainer.padding.vertical(16),
      _contentContainer.color.black.withOpacity(0.05),
      _contentContainer.border.top.width(1),
      _contentContainer.border.top.color.black12(),
    );

Style get _containerStyle => Style(
      _container.shape.roundedRectangle.borderRadius(8),
      _container.color.$white(),
      _container.clipBehavior.antiAlias(),
    );

Style get _textContainerStyle => Style(
      _textContent.style.color.$neutral(1),
      _textContent.style.fontSize(14),
    );

Style _buildAccordionStyle(Style? style) {
  return Style(
    _flexStyle(),
    _containerStyle(),
    _headerStyle(),
    _contentStyle(),
    _textContainerStyle(),
  ).merge(style).animate(
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 150),
      );
}
