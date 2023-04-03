import 'package:mix/mix.dart';

Mix get button {
  return Mix(
    textStyle(as: MaterialTokens.textTheme.bodyText2),
    bold(),
    fontSize(16.0),
    animated(),
    bgColor(MaterialTokens.colorScheme.primary),
    onHover(
      bgColor(MaterialTokens.colorScheme.secondary),
    ),
    paddingHorizontal(15.0),
    paddingVertical(8.0),
    rounded(5),
  );
}
