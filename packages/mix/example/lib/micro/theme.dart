import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

const $page = ColorToken('micro.page');
const $card = ColorToken('micro.card');
const $playground = ColorToken('micro.playground');
const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $track = ColorToken('micro.track');
const $trackOn = ColorToken('micro.trackOn');
const $hover = ColorToken('micro.hover');
const $accent = ColorToken('micro.accent');
const $like = ColorToken('micro.like');
const $success = ColorToken('micro.success');
const $danger = ColorToken('micro.danger');
const $warning = ColorToken('micro.warning');

const $radiusXs = RadiusToken('micro.radius.xs');
const $radiusSm = RadiusToken('micro.radius.sm');
const $radiusMd = RadiusToken('micro.radius.md');
const $radiusLg = RadiusToken('micro.radius.lg');
const $radiusXl = RadiusToken('micro.radius.xl');
const $radius2xl = RadiusToken('micro.radius.2xl');
const $radiusCheck = RadiusToken('micro.radius.check');

Map<ColorToken, Color> microColors() => {
  $page: const Color(0xFF07070B),
  $card: const Color(0xFF121218),
  $playground: const Color(0xFF0C0C12),
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
  $track: const Color(0xFF27272F),
  $trackOn: const Color(0xFFF5F5F5),
  $hover: const Color(0xFF32323C),
  $accent: const Color(0xFF7C6AF7),
  $like: const Color(0xFFFF4D6D),
  $success: const Color(0xFF3DD68C),
  $danger: const Color(0xFFFF5C7A),
  $warning: const Color(0xFFF5C542),
};

Map<RadiusToken, Radius> microRadii() => {
  $radiusXs: const Radius.circular(8),
  $radiusSm: const Radius.circular(10),
  $radiusMd: const Radius.circular(12),
  $radiusLg: const Radius.circular(14),
  $radiusXl: const Radius.circular(16),
  $radius2xl: const Radius.circular(20),
  $radiusCheck: const Radius.circular(6),
};

ThemeData microMaterialTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7C6AF7),
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF07070B),
    useMaterial3: true,
  );
}

/// Mix `.scale()` and `.translate()` both write `Box.transform`, so the last
/// call wins. Compose them as separate modifiers, which Mix can lerp independently.
WidgetModifierConfig microPlace({
  double x = 0,
  double y = 0,
  double scale = 1,
  double scaleX = 1,
  double scaleY = 1,
}) {
  return WidgetModifierConfig.translate(x: x, y: y)
      .scale(scale * scaleX, scale * scaleY)
      .orderOfModifiers(const [TranslateModifier, ScaleModifier]);
}

/// Live pointer tracking must not fight a spring. Snap while dragging, spring
/// once the gesture ends — Mix's documented implicit-animation pattern.
AnimationConfig microFollow({required bool live}) {
  return live ? .linear(1.ms) : .spring(320.ms, bounce: 0.18);
}

FlexBoxStyler microRow({double spacing = 10}) => FlexBoxStyler()
    .spacing(spacing)
    .crossAxisAlignment(.center)
    .mainAxisSize(.min);

TextStyler microTitle() =>
    TextStyler().color($ink()).fontSize(16).fontWeight(FontWeight.w700);

TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

TextStyler microMuted([double size = 12]) =>
    TextStyler().color($muted()).fontSize(size).fontWeight(FontWeight.w500);
