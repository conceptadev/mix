// import 'package:example/remix/helpers.dart';
// import 'package:example/remix/theme_provider.dart';
// import 'package:flutter/material.dart';

// enum RemixThemeButtonType { primary, secondary, tertiary }

// typedef ThemeButtons = Map<RemixThemeButtonType, RemixThemeButton>;

// extension ContextExtension on BuildContext {
//   RemixTheme get remix => RemixProvider.of(this).theme;
// }

// class RemixTheme {
//   final RemixThemeColors colors;
//   final RemixThemeColors darkColors;
//   final RemixThemeFonts fonts;
//   final RemixThemeFontSizes fontSizes;
//   final RemixThemeFontWeights fontWeights;
//   final RemixThemeLineHeights lineHeights;

//   final ThemeButtons buttons;
//   final RemixThemeShadows shadows;
//   final RemixThemeSpacing spacing;

//   static RemixTheme defaultTheme() => RemixTheme(
//         colors: RemixThemeColors(
//           text: Colors.black,
//           background: Colors.white,
//           primary: Color.fromRGBO(30, 144, 255, 1),
//           secondary: Color.fromRGBO(17, 95, 251, 1),
//           muted: Color.fromRGBO(33, 33, 33, 1),
//           shadowColor: Color.fromRGBO(30, 144, 255, 1),
//           tertiary: Color.fromRGBO(30, 144, 255, 1),
//           success: Color.fromRGBO(24, 169, 87, 1),
//           warning: Color.fromRGBO(255, 187, 56, 1),
//           error: Color.fromRGBO(223, 22, 66, 1),
//         ),
//         darkColors: RemixThemeColors(
//           text: Colors.black,
//           background: Colors.white,
//           primary: Color.fromRGBO(30, 144, 255, 1),
//           secondary: Color.fromRGBO(17, 95, 251, 1),
//           muted: Color.fromRGBO(33, 33, 33, 1),
//           shadowColor: Color.fromRGBO(30, 144, 255, 1),
//           tertiary: Color.fromRGBO(30, 144, 255, 1),
//           success: Color.fromRGBO(24, 169, 87, 1),
//           warning: Color.fromRGBO(255, 187, 56, 1),
//           error: Color.fromRGBO(223, 22, 66, 1),
//         ),
//         fonts: RemixThemeFonts(
//           body: isApple ? '.SF UI Display' : 'Roboto',
//           heading: isApple ? '.SF UI Text' : 'Roboto',
//         ),
//         fontSizes: RemixThemeFontSizes(),
//         fontWeights: RemixThemeFontWeights(
//           body: FontWeight.normal,
//           heading: FontWeight.w700,
//           bold: FontWeight.bold,
//         ),
//         lineHeights: RemixThemeLineHeights(
//           body: 1.5,
//           heading: 1.125,
//         ),
//         buttons: {
//           RemixThemeButtonType.primary: RemixThemeButton(
//             color: Colors.white,
//             bg: Color.fromRGBO(30, 144, 255, 1),
//           ),
//           RemixThemeButtonType.secondary: RemixThemeButton(
//             color: Colors.white,
//             bg: Color.fromRGBO(17, 95, 251, 1),
//           ),
//           RemixThemeButtonType.tertiary: RemixThemeButton(
//             color: Colors.white,
//             bg: Color.fromRGBO(30, 144, 255, 1),
//           ),
//         },
//         shadows: RemixThemeShadows(),
//         spacing: RemixThemeSpacing(),
//       );

//   RemixTheme({
//     required this.colors,
//     required this.darkColors,
//     required this.fonts,
//     required this.fontSizes,
//     required this.fontWeights,
//     required this.lineHeights,
//     required this.buttons,
//     required this.shadows,
//     required this.spacing,
//   });
// }

// class RemixThemeColors {
//   /// Body foreground color
//   final Color text;

//   /// Body background color
//   final Color background;

//   /// Primary brand color for links, buttons, etc.
//   final Color primary;

//   /// A secondary brand color for alternative styling
//   final Color secondary;

//   /// A faint color for backgrounds, borders, and accents that do not require high contrast with the background color
//   final Color muted;

//   /// Customization of Theme UI
//   /// Shadow color
//   final Color shadowColor;

//   /// Tertiary color
//   final Color tertiary;

//   /// Success color
//   final Color success;

//   /// Warning color
//   final Color warning;

//   /// Error color
//   final Color error;

//   const RemixThemeColors({
//     required this.text,
//     required this.background,
//     required this.primary,
//     required this.secondary,
//     required this.muted,
//     required this.shadowColor,
//     required this.tertiary,
//     required this.success,
//     required this.warning,
//     required this.error,
//   });
// }

// class RemixThemeFonts {
//   /// Default body font family
//   final String body;

//   /// Default heading font family
//   final String heading;

//   const RemixThemeFonts({
//     required this.body,
//     required this.heading,
//   });
// }

// class RemixThemeFontWeights {
//   /// body font weight
//   final FontWeight body;

//   /// default heading font weight
//   final FontWeight heading;

//   /// default bold font weight
//   final FontWeight bold;

//   const RemixThemeFontWeights({
//     required this.body,
//     required this.heading,
//     required this.bold,
//   });
// }

// // class RemixThemeLetterSpacings {
// //   /// Body letter spacing
// //   final double body;

// //   /// All caps letter spacing
// //   final double caps;

// //   const RemixThemeLetterSpacings({
// //     required this.body,
// //     required this.caps,
// //   });
// // }

// class RemixThemeLineHeights {
//   /// body line height
//   final double body;

//   /// default heading line height
//   final double heading;

//   const RemixThemeLineHeights({
//     required this.body,
//     required this.heading,
//   });
// }

// class RemixThemeButton {
//   final Color color;
//   final Color bg;

//   const RemixThemeButton({
//     required this.color,
//     required this.bg,
//   });
// }

// class RemixThemeSpacing {
//   final List<double> _scale;

//   static const _defaultScale = <double>[0, 4, 6, 8, 12, 24, 32, 64];
//   RemixThemeSpacing([List<double>? scale])
//       : _scale = _mergeScale(scale, _defaultScale);

//   double get xs => _scale[0];
//   double get sm => _scale[1];
//   double get md => _scale[2];
//   double get lg => _scale[3];
//   double get xl => _scale[4];
//   double get xxl => _scale[5];
//   double get threeXl => _scale[6];
//   double get fourXl => _scale[7];
// }

// class MxShadow {
//   final Offset? offset;
//   final double? blurRadius;
//   final double? spreadRadius;

//   const MxShadow({
//     this.offset,
//     this.blurRadius,
//     this.spreadRadius,
//   });
// }

// class RemixThemeShadows {
//   final List<MxShadow> _scale;

//   static const _defaultScale = <MxShadow>[
//     MxShadow(blurRadius: 3, offset: Offset(0, 1)),
//     MxShadow(blurRadius: 4, offset: Offset(0, 2)),
//     MxShadow(blurRadius: 8, offset: Offset(0, 4)),
//     MxShadow(blurRadius: 16, offset: Offset(0, 8)),
//     MxShadow(blurRadius: 24, offset: Offset(0, 16)),
//   ];
//   RemixThemeShadows([List<MxShadow>? scale])
//       : _scale = _mergeScale(scale, _defaultScale);

//   MxShadow get xs => _scale[0];
//   MxShadow get sm => _scale[1];
//   MxShadow get md => _scale[2];
//   MxShadow get lg => _scale[3];
//   MxShadow get xl => _scale[4];
//   MxShadow get xxl => _scale[5];
// }

// class RemixThemeFontSizes {
//   final List<double> _scale;

//   static const _defaultScale = <double>[12, 14, 16, 20, 24, 32, 48, 64];

//   RemixThemeFontSizes([List<double>? scale])
//       : _scale = _mergeScale(scale, _defaultScale);

//   double get xs => _scale[0];
//   double get sm => _scale[1];
//   double get md => _scale[2];
//   double get lg => _scale[3];
//   double get xl => _scale[4];
//   double get xxl => _scale[5];
//   double get threeXl => _scale[6];
//   double get fourXl => _scale[7];
// }

// class RemixThemeRadius {
//   final List<double> _scale;

//   static const _defaultScale = <double>[0, 2, 4, 6, 8, 12, 16, 1000];

//   RemixThemeRadius([List<double>? scale])
//       : _scale = _mergeScale(scale, _defaultScale);

//   double get none => _scale[0];
//   double get xs => _scale[1];
//   double get sm => _scale[2];
//   double get md => _scale[3];
//   double get lg => _scale[4];
//   double get xl => _scale[5];
//   double get xxl => _scale[6];
//   double get circle => _scale[7];
// }

// List<T> _mergeScale<T>(List<T>? scale, List<T> defaultScale) {
//   if (scale == null || scale.isEmpty) {
//     return defaultScale;
//   }
//   final mergedScale = <T>[];
//   for (var i = 0; i < defaultScale.length; i++) {
//     // Check if index exists
//     if (scale.asMap().containsKey(i)) {
//       mergedScale[i] = scale[i];
//     } else {
//       mergedScale[i] = defaultScale[i];
//     }
//   }

//   return mergedScale;
// }
