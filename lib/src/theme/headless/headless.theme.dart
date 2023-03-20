import 'switch/switch.theme.dart';

class HeadlessThemeData {
  final SwitchXThemeData switchTheme;

  const HeadlessThemeData.raw({
    required this.switchTheme,
  });

  HeadlessThemeData({
    SwitchXThemeData? switchTheme,
  }) : this.raw(
          switchTheme: switchTheme ?? SwitchXThemeData(),
        );

  factory HeadlessThemeData.switchTheme({
    SwitchXThemeData? switchTheme,
  }) {
    switchTheme ??= SwitchXThemeData();

    return HeadlessThemeData.raw(
      switchTheme: switchTheme,
    );
  }
}
