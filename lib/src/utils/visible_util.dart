import '../core/visible_attribute.dart';

const show = _show;
const hide = _hide;

VisibleAttribute _show([bool condition = true]) {
  return VisibleAttribute(condition);
}

VisibleAttribute _hide([bool condition = true]) => _show(!condition);
