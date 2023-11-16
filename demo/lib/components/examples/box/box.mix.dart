import 'package:mix/mix.dart';

StyleMix get button {
  return StyleMix(
    textStyle.as($textStyles.bodyMedium),
    bold(),
    textStyle(fontSize: 16.0),
    backgroundColor($colors.primary),
    onHover(
      backgroundColor($colors.secondary),
    ),
    padding.horizontal(15.0),
    padding.vertical(8.0),
    borderRadius(5),
  );
}
