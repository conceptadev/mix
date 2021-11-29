import 'package:mix/src/attributes/common/attribute.dart';

List<T> spreadNestedAttributes<T extends Attribute>(List<T> attributes) {
  final spreaded = <T>[];
  var hasNested = false;
  for (final attr in attributes) {
    if (attr is NestedAttribute<T>) {
      spreaded.addAll(attr.attributes);
      hasNested = true;
    } else {
      spreaded.add(attr);
    }
  }

  /// Recursive check for nested attributes
  if (hasNested) {
    return spreadNestedAttributes(spreaded);
  } else {
    return spreaded;
  }
}

String capitalize(String string) {
  final current = string;
  if (current.isEmpty) {
    return string;
  }

  return current[0].toUpperCase() + current.substring(1);
}

String titleCase(String string) {
  const separator = ' ';
  final current = string;
  List<String> words =
      current.split(separator).map((word) => capitalize(word)).toList();

  return words.join(separator);
}

String sentenceCase(String string) {
  const separator = ' ';
  final current = string;
  List<String> words = current.split(separator);

  if (words.isNotEmpty) {
    capitalize(words[0]);
  }

  return words.join(separator);
}

bool nullToBoolean(dynamic value) {
  if (value == null || value == false) {
    return false;
  } else {
    return true;
  }
}
