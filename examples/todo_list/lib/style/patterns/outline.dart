import 'package:mix/mix.dart';
import 'package:todo_list/style/design_tokens.dart';

Style outlinePattern = Style(
  $box.border.width(2),
  $box.border.color.ref($token.color.outline),
);
