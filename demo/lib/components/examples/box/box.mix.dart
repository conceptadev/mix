import 'package:mix/mix.dart';

StyleMix get button {
  return StyleMix(
    textStyle(as: MaterialTextStyles.bodyMedium),
    bold(),
    textStyle(fontSize: 16.0),
    backgroundColor($M3Color.primary),
    onHover(
      backgroundColor($M3Color.secondary),
    ),
    paddingHorizontal(15.0),
    paddingVertical(8.0),
    rounded(5),
  );
}
