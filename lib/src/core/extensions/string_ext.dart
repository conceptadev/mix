const _snakeCaseSeparator = '_';
const _paramCaseSeparator = '-';
const _spaceSeparator = ' ';

final _upperAlphaRegex = RegExp(r'[_-\sA-Z]');

final _symbolSet = {
  _snakeCaseSeparator,
  _paramCaseSeparator,
  _spaceSeparator,
};

extension StringExt on String {
  List<String> get words {
    final sb = StringBuffer();
    final words = <String>[];
    final isAllCaps = toUpperCase() == this;

    for (int i = 0; i < length; i++) {
      final char = this[i];
      final nextChar = i + 1 == length ? null : this[i + 1];

      if (_symbolSet.contains(char)) {
        continue;
      }

      sb.write(char);

      final isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          _symbolSet.contains(nextChar);

      if (isEndOfWord) {
        words.add(sb.toString());
        sb.clear();
      }
    }

    return words;
  }

  bool get isUpperCase => toUpperCase() == this;

  bool get isLowerCase => toLowerCase() == this;

  String get camelCase {
    final wordList = words.map((word) => word.capitalize).toList();
    if (wordList.isNotEmpty) {
      wordList[0] = wordList.first.toLowerCase();
    }

    return wordList.join();
  }

  String get pascalCase => words.map((word) => word.capitalize).join();

  String get capitalize {
    if (isEmpty) return this;
    final firstRune = runes.first;
    final restRunes = runes.skip(1);

    return String.fromCharCode(firstRune).toUpperCase() +
        restRunes.map((rune) => String.fromCharCode(rune).toLowerCase()).join();
  }

  String get constantCase => words.uppercase.join(_snakeCaseSeparator);

  String get snakeCase => words.lowercase.join(_snakeCaseSeparator);

  String get paramCase => words.lowercase.join(_paramCaseSeparator);

  String get titleCase =>
      words.map((word) => word.capitalize).join(_spaceSeparator);

  String get sentenceCase {
    final wordList = [...words];
    if (wordList.isEmpty) return this;

    wordList[0] = wordList.first.capitalize;

    return wordList.join(_spaceSeparator);
  }
}

extension ListStringExt on List<String> {
  List<String> get lowercase => map((e) => e.toLowerCase()).toList();
  List<String> get uppercase => map((e) => e.toUpperCase()).toList();
}
