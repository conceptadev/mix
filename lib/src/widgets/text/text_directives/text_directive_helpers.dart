// ignore_for_file: avoid-unsafe-collection-methods

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
  List<String> words = current.split(separator).map(capitalize).toList();

  return words.join(separator);
}

String sentenceCase(String string) {
  const separator = ' ';
  final current = string;
  List<String> words = current.split(separator);

  if (words.isNotEmpty) {
    // ignore: avoid-unsafe-collection-methods - We need 3.0.0 compatibility
    words[0] = capitalize(words.first);
  }

  return words.join(separator);
}
