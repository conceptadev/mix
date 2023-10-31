import '../attributes/data_attributes.dart';
import '../core/dto/constraints_dto.dart';

BoxConstraintsAttribute boxConstraints({
  double? minWidth,
  double? maxWidth,
  double? minHeight,
  double? maxHeight,
}) {
  return BoxConstraintsData(
    minWidth: minWidth,
    maxWidth: maxWidth,
    minHeight: minHeight,
    maxHeight: maxHeight,
  ).toAttribute();
}

BoxConstraintsAttribute minWidth(double width) =>
    boxConstraints(minWidth: width);

BoxConstraintsAttribute maxWidth(double width) =>
    boxConstraints(maxWidth: width);

BoxConstraintsAttribute minHeight(double height) =>
    boxConstraints(minHeight: height);

BoxConstraintsAttribute maxHeight(double height) =>
    boxConstraints(maxHeight: height);
