import '../../../../../mix.dart';
import '../../../refs/switch_token.dart';

class SwitchXThemeTokens {
  final thumb = SwitchXToken(
    (context) => MixTheme.of(context).headlessThemeData.switchTheme,
  );

  final track = SwitchXToken(
    (context) => MixTheme.of(context).headlessThemeData.switchTheme,
  );
}
