part of 'button.dart';

enum ButtonTypeVariant {
  primary(Variant('primary')),
  secondary(Variant('secondary')),
  destructive(Variant('destructive'));

  const ButtonTypeVariant(this.value);

  final Variant value;
}

enum ButtonSizeVariant {
  sm(Variant('sm')),
  md(Variant('md')),
  lg(Variant('lg'));

  const ButtonSizeVariant(this.value);

  final Variant value;

  String get name => value.name;
}

final _b = ButtonSpecUtility.self;

final _sm = ButtonSizeVariant.sm.value;
final _md = ButtonSizeVariant.md.value;
final _lg = ButtonSizeVariant.lg.value;

final _primary = ButtonTypeVariant.primary.value;
final _secondary = ButtonTypeVariant.secondary.value;
final _destructive = ButtonTypeVariant.destructive.value;

Style get _buttonStyle => Style(
      _container(),
      _label(),
      _icon(),
      _color(),
    ).animate(
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );

Style get _container => Style(
      _b.container.chain
        ..flex.mainAxisSize.min()
        ..flex.gap(8)
        ..borderRadius.all(8),
      _sm(
        _b.container.chain
          ..padding.horizontal(12)
          ..padding.vertical(8),
      ),
      _md(
        _b.container.chain
          ..padding.horizontal(16)
          ..padding.vertical(10),
      ),
      _lg(
        _b.container.chain
          ..padding.horizontal(32)
          ..padding.vertical(12),
      ),
    );

Style get _label => Style(
      _b.chain
        ..label.fontSize(14)
        ..label.fontWeight(FontWeight.w500),
    );

Style get _icon => Style(
      _b.icon.chain..size(16),
    );

Style get _color => Style(
      _primary(
        _b.container.color.blueAccent(),
        _b.icon.color.white(),
        _b.label.color.white(),
        $on.hover(
          _b.container.color.blueAccent.shade700(),
        ),
      ),
      _secondary(
        _b.container.color.grey.shade200(),
        _b.icon.color.black(),
        _b.label.color.black(),
        $on.hover(
          _b.container.color.grey.shade300(),
        ),
      ),
      _destructive(
        _b.container.color.redAccent.shade400(),
        _b.icon.color.white(),
        _b.label.color.white(),
        $on.hover(
          _b.container.color.redAccent.shade700(),
        ),
      ),
      _b.container.wrap.opacity(1),
      $on.disabled(
        _b.container.wrap.opacity(0.5),
      ),
    );
