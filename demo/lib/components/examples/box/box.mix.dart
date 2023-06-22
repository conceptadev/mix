import 'package:mix/mix.dart';

StyleMix get button {
  return StyleMix(
    textStyle(as: $M3Text.bodyMedium),
    bold(),
    textStyle(fontSize: 16.0),
    animation(),
    backgroundColor($M3Color.primary),
    onHover(
      backgroundColor($M3Color.secondary),
    ),
    paddingHorizontal(15.0),
    paddingVertical(8.0),
    rounded(5),
  );
}
