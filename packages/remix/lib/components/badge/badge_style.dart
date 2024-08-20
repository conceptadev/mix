// ignore_for_file: camel_case_types

part of 'badge.dart';

final _badge = BadgeSpecUtility.self;
final _container = _badge.container;
final _label = _badge.label;

Style get _baseStyle {
  return Style(_label.style.fontWeight.w500());
}

Style get _solidVariant {
  return Style(_container.color.$accent(), _label.style.color.$neutral(1));
}

Style get _softVariant {
  return Style(
    _container.color.$accentAlpha(3),
    _label.style.color.$accentAlpha(11),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.color.$accentAlpha(2),
    _label.style.color.$accentAlpha(11),
  );
}

Style get _outlineVariant {
  return Style(
    _container.color.transparent(),
    _container.border.width(1),
    _container.border.color.$accentAlpha(8),
    _label.style.color.$accentAlpha(11),
  );
}

Style get _smallSize {
  return Style(
    _container.padding.vertical.$space(1),
    _container.padding.horizontal.$space(2),
    _label.style.$text(1),
    _label.style.height(1.1),
  );
}

Style get _mediumSize {
  return Style(
    _container.padding.vertical.$space(1),
    _container.padding.horizontal.$space(3),
    _label.style.$text(2),
    _label.style.height(1.1),
  );
}

Style get _largeSize {
  return Style(
    _container.padding.vertical.$space(2),
    _container.padding.horizontal.$space(4),
    _label.style.$text(3),
    _label.style.height(1.1),
  );
}

Style get _radiusNone => Style(_container.borderRadius.all(0));
Style get _radiusSmall => Style(_container.borderRadius.all(4));
Style get _radiusMedium => Style(_container.borderRadius.all(8));
Style get _radiusLarge => Style(_container.borderRadius.all(12));
Style get _radiusFull => Style(_container.borderRadius.all(99));

Style badgeStyle(Style? style, List<IBadgeVariant> variants) {
  return Style(
    _baseStyle(),

    /// Size Variants
    BadgeSize.small(_smallSize()),
    BadgeSize.medium(_mediumSize()),
    BadgeSize.large(_largeSize()),

    // Radius variants
    BadgeRadius.none(_radiusNone()),
    BadgeRadius.small(_radiusSmall()),
    BadgeRadius.medium(_radiusMedium()),
    BadgeRadius.large(_radiusLarge()),
    BadgeRadius.full(_radiusFull()),

    // Type variants
    BadgeVariant.solid(_solidVariant()),
    BadgeVariant.soft(_softVariant()),
    BadgeVariant.surface(_surfaceVariant()),
    BadgeVariant.outline(_outlineVariant()),
  ).merge(style).applyVariants(variants);
}
