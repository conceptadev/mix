import 'package:mix/mix.dart';

extension BoxSpecUtilityX<T extends Attribute> on BoxSpecUtility<T> {
  T size(double value) => only(height: value, width: value);
}
