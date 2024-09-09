part of 'divider.dart';

class XProgressVariants extends Variant {
  static const horizontal = XProgressVariants._('horizontal');
  static const vertical = XProgressVariants._('vertical');
  static const values = [horizontal, vertical];

  const XProgressVariants._(super.name);
}

final _container = $divider.container;
final _whenHorizontal = XProgressVariants.horizontal;
final _whenVertical = XProgressVariants.vertical;

class XDividerStyle {
  static Style get base => Style(_containerStyle());
}

Style get _containerStyle => Style(
      _container.chain
        ..color.black12()
        ..borderRadius(99),
      _whenHorizontal(_container.height(1)),
      _whenVertical(_container.width(1)),
    );
