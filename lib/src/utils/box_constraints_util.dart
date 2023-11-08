import '../attributes/constraints_attribute.dart';

const boxConstraints = BoxConstraintsAttribute.new;

BoxConstraintsAttribute minWidth(double width) =>
    BoxConstraintsAttribute(minWidth: width);

BoxConstraintsAttribute maxWidth(double width) =>
    BoxConstraintsAttribute(maxWidth: width);

BoxConstraintsAttribute minHeight(double height) =>
    BoxConstraintsAttribute(minHeight: height);

BoxConstraintsAttribute maxHeight(double height) =>
    BoxConstraintsAttribute(maxHeight: height);
