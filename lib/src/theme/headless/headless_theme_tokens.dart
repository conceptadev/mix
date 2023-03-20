import '../../../mix.dart';
import '../refs/switch_token.dart';

class HeadlessThemeTokens {
  final switchX = SwitchXToken(
    (context) => MixTheme.of(context).headlessThemeData.switchTheme,
  );
}
