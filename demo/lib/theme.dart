import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData _customThemeBuilder(ThemeData theme) {
  return theme
      .copyWith(
        textTheme: GoogleFonts.interTextTheme(theme.textTheme),
        toggleableActiveColor: theme.colorScheme.secondary,
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: theme.colorScheme.surface.withAlpha(50),
          unselectedIconTheme: theme.iconTheme.copyWith(
            color: theme.colorScheme.onSurface.withAlpha(50),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: theme.colorScheme.secondary,
          unselectedItemColor: theme.colorScheme.onSurface.withAlpha(50),
        ),
      )
      .copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

ThemeData get darkTheme {
  return _customThemeBuilder(
    ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark().copyWith(
        primary: Colors.purpleAccent,
        secondary: Colors.purpleAccent,
      ),
      extensions: <ThemeExtension<dynamic>>[
        const MyColors(
          brandColor: Color(0xFF90CAF9),
          danger: Color(0xFFEF9A9A),
        ),
      ],
    ),
  );
}

ThemeData get lightTheme {
  return _customThemeBuilder(
    ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.deepPurpleAccent,
        secondary: Colors.deepPurple,
      ),
      extensions: <ThemeExtension<dynamic>>[
        const MyColors(
          brandColor: Color(0xFF1E88E5),
          danger: Color(0xFFE53935),
        ),
      ],
    ),
  );
}

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.brandColor,
    required this.danger,
  });

  final Color brandColor;
  final Color danger;

  @override
  MyColors copyWith({Color? brandColor, Color? danger}) {
    return MyColors(
      brandColor: brandColor ?? this.brandColor,
      danger: danger ?? this.danger,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      brandColor: Color.lerp(brandColor, other.brandColor, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $brandColor, danger: $danger)';
}
