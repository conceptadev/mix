import 'visible_attribute.dart';

VisibleAttribute show([bool condition = true]) {
  return VisibleAttribute(condition);
}

VisibleAttribute hide([bool condition = true]) {
  return VisibleAttribute(!condition);
}
