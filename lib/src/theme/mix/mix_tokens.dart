import 'package:meta/meta.dart';

import '../tokens/color_token.dart';
import '../tokens/radius_token.dart';
import '../tokens/space_token.dart';
import '../tokens/text_style_token.dart';

@immutable
class MixTokens {
  final color = const _MixColorTokens();
  final textStyle = const _MixTextStyles();
  final space = const _MixSpaces();
  final radius = const _MixRadii();

  const MixTokens();
}

@immutable
class _MixColorTokens {
  final primary = const ColorToken('mix.color.primary');
  final secondary = const ColorToken('mix.color.secondary');
  final tertiary = const ColorToken('mix.color.tertiary');
  final surface = const ColorToken('mix.color.surface');
  final background = const ColorToken('mix.color.background');
  final error = const ColorToken('mix.color.error');

  final onPrimary = const ColorToken('mix.color.on.primary');
  final onSecondary = const ColorToken('mix.color.on.secondary');
  final onTertiary = const ColorToken('mix.color.on.tertiary');
  final onSurface = const ColorToken('mix.color.on.surface');
  final onBackground = const ColorToken('mix.color.on.background');
  final onError = const ColorToken('mix.color.on.error');

  const _MixColorTokens();
}

@immutable
class _MixTextStyles {
  final displayLarge = const TextStyleToken('mix.text.theme.display.large');
  final displayMedium = const TextStyleToken(
    'mix.text.theme.display.medium',
  );
  final displaySmall = const TextStyleToken('mix.text.theme.display.small');
  final headlineLarge = const TextStyleToken(
    'mix.text.theme.headline.large',
  );
  final headlineMedium = const TextStyleToken(
    'mix.text.theme.headline.medium',
  );
  final headlineSmall = const TextStyleToken(
    'mix.text.theme.headline.small',
  );

  final titleLarge = const TextStyleToken('mix.text.theme.title.large');
  final titleMedium = const TextStyleToken('mix.text.theme.title.medium');
  final titleSmall = const TextStyleToken('mix.text.theme.title.small');
  final bodyLarge = const TextStyleToken('mix.text.theme.body.large');
  final bodyMedium = const TextStyleToken('mix.text.theme.body.medium');
  final bodySmall = const TextStyleToken('mix.text.theme.body.small');
  final labelLarge = const TextStyleToken('mix.text.theme.label.large');
  final labelMedium = const TextStyleToken('mix.text.theme.label.medium');
  final labelSmall = const TextStyleToken('mix.text.theme.label.small');

  const _MixTextStyles();
}

@immutable
class _MixSpaces {
  final large = const SpaceToken('mix.space.large');
  final medium = const SpaceToken('mix.space.medium');
  final small = const SpaceToken('mix.space.small');

  const _MixSpaces();
}

@immutable
class _MixRadii {
  final small = const RadiusToken('mix.radius.small');
  final medium = const RadiusToken('mix.radius.medium');
  final large = const RadiusToken('mix.radius.large');

  const _MixRadii();
}
