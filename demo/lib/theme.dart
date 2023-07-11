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
      colorScheme: const ColorScheme.dark().copyWith(
        primary: Colors.purpleAccent,
        secondary: Colors.purpleAccent,
      ),
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
    ),
  );
}
