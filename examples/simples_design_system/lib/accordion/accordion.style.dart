part of 'accordion.dart';

final _c = AccordionSpecUtility.self;
Style get _accordionStyle => Style(
      _mainContainer(),
      _contentContainer(),
      _headerContainer(),
    );

Style get _mainContainer => Style(
      _c.container.chain
        ..flex.mainAxisSize.min()
        ..flex.mainAxisAlignment.start()
        ..flex.crossAxisAlignment.start()
        ..color.white()
        ..border.color.grey.shade300()
        ..border.width(1)
        ..shape.roundedRectangle.borderRadius(8)
        ..clipBehavior.hardEdge()
        ..shape.roundedRectangle.side.color.grey.shade300()
        ..constraints.minWidth(200),
    );

Style get _contentContainer => Style(
      _c.contentContainer.chain
        ..color.grey.shade50()
        ..border.top.width(1)
        ..border.top.color.grey.shade300()
        ..padding(12),
    );

Style get _headerContainer => Style(
      _c.headerContainer.chain
        ..color.transparent()
        ..padding(12),
    );
