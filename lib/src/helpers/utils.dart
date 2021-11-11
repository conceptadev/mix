import 'package:flutter/material.dart';

import '../attributes/attribute.dart';

/// Attribute params to list
List<Attribute> paramsToAttributes([
  Attribute? p1,
  Attribute? p2,
  Attribute? p3,
  Attribute? p4,
  Attribute? p5,
  Attribute? p6,
  Attribute? p7,
  Attribute? p8,
  Attribute? p9,
  Attribute? p10,
  Attribute? p11,
  Attribute? p12,
]) {
  final attributes = <Attribute>[];

  if (p1 != null) {
    attributes.add(p1);
  }
  if (p2 != null) {
    attributes.add(p2);
  }
  if (p3 != null) {
    attributes.add(p3);
  }
  if (p4 != null) {
    attributes.add(p4);
  }
  if (p5 != null) {
    attributes.add(p5);
  }
  if (p6 != null) {
    attributes.add(p6);
  }
  if (p7 != null) {
    attributes.add(p7);
  }
  if (p8 != null) {
    attributes.add(p8);
  }
  if (p9 != null) {
    attributes.add(p9);
  }
  if (p10 != null) {
    attributes.add(p10);
  }
  if (p11 != null) {
    attributes.add(p11);
  }
  if (p12 != null) {
    attributes.add(p12);
  }
  return _spreadNestedMix(attributes);
}

_spreadNestedMix(List<Attribute> props) {
  final spreaded = [...props];
  for (final attr in props) {
    if (attr is NestedAttributes) {
      spreaded.addAll(attr.attributes);
    } else {
      spreaded.add(attr);
    }
  }

  return spreaded;
}

/// Turns 4 positional args into a list
List<T> positionalToList<T>([
  T? p1,
  T? p2,
  T? p3,
  T? p4,
]) {
  final params = <T>[];
  if (p1 != null) {
    params.add(p1);
  }
  if (p2 != null) {
    params.add(p2);
  }
  if (p3 != null) {
    params.add(p3);
  }
  if (p4 != null) {
    params.add(p4);
  }

  return params;
}

/// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
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
