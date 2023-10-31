import '../attributes/constraints_attribute.dart';

BoxConstraintsAttribute boxConstraints({
  double? minWidth,
  double? maxWidth,
  double? minHeight,
  double? maxHeight,
}) {
  return BoxConstraintsAttribute(
    minWidth: minWidth,
    maxWidth: maxWidth,
    minHeight: minHeight,
    maxHeight: maxHeight,
  );
}

BoxConstraintsAttribute minWidth(double width) =>
    boxConstraints(minWidth: width);

BoxConstraintsAttribute maxWidth(double width) =>
    boxConstraints(maxWidth: width);

BoxConstraintsAttribute minHeight(double height) =>
    boxConstraints(minHeight: height);

BoxConstraintsAttribute maxHeight(double height) =>
    boxConstraints(maxHeight: height);
