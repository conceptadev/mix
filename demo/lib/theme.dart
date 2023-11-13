import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData _customThemeBuilder(ThemeData theme) {
  return theme
      .copyWith(
        textTheme: GoogleFonts.interTextTheme(theme.textTheme),
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
        checkboxTheme: CheckboxThemeData(
          fillColor: getPropertyForTrack(theme),
        ),
        radioTheme: RadioThemeData(
          fillColor: getPropertyForTrack(theme),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: getPropertyForTrack(theme),
          trackColor: getPropertyForTrack(theme),
        ),
      )
      .copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

MaterialStateProperty<Color?> getPropertyForTrack(ThemeData theme) {
  return MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return null;
    }
    if (states.contains(MaterialState.selected)) {
      return theme.colorScheme.secondary;
    }

    return null;
  });
}

ThemeData get darkTheme {
  return _customThemeBuilder(
    ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: Colors.purpleAccent,
        secondary: Colors.purpleAccent,
        primaryContainer: Colors.purpleAccent,
        secondaryContainer: Colors.purpleAccent.shade100,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.white;
          }

          return Colors.white.withAlpha(230);
        }),
      ),
    ),
  );
}

ThemeData get lightTheme {
  return _customThemeBuilder(
    ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.deepPurpleAccent,
        secondary: Colors.deepPurple,
        primaryContainer: Colors.deepPurpleAccent,
        secondaryContainer: Colors.deepPurpleAccent.shade100,
      ),
    ),
  );
}
