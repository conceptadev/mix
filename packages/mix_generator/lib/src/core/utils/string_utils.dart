/// Extensions to provide common string transformations
extension StringUtils on String {
  /// Converts a string to camelCase
  String get camelCase {
    if (isEmpty) return this;

    // First normalize by replacing hyphens with underscores
    final normalized = replaceAll('-', '_');

    // Split by underscores or spaces
    final parts = normalized.split(RegExp(r'[_\s]'));

    if (parts.length == 1) {
      // If it's a single word, just lowercase the first letter
      return parts[0].lowerCaseFirst;
    }

    // Join with first part lowercased and the rest capitalized
    return parts.first.lowerCaseFirst +
        parts.skip(1).map((part) => part.capitalize).join('');
  }

  /// Converts a string to PascalCase
  String get pascalCase {
    if (isEmpty) return this;

    // First normalize by replacing hyphens with underscores
    final normalized = replaceAll('-', '_');

    // Split by underscores or spaces
    final parts = normalized.split(RegExp(r'[_\s]'));

    // Capitalize each part and join
    return parts.map((part) => part.capitalize).join('');
  }

  /// Converts a string to snake_case
  String get snakeCase {
    if (isEmpty) return this;

    // First normalize by replacing hyphens with underscores and spaces with underscores
    final normalized = replaceAll('-', '_').replaceAll(' ', '_');

    // Handle camelCase or PascalCase to snake_case
    return normalized.replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => match.start == 0
          ? match.group(0)!.toLowerCase()
          : '_${match.group(0)!.toLowerCase()}',
    );
  }

  /// Converts a string to kebab-case
  String get kebabCase {
    if (isEmpty) return this;

    // First convert to snake_case
    final snakeCased = snakeCase;

    // Then replace underscores with hyphens
    return snakeCased.replaceAll('_', '-');
  }

  String get lowerCaseFirst {
    if (isEmpty) return this;

    return this[0].toLowerCase() + substring(1);
  }

  String get capitalize {
    if (isEmpty) return this;

    return this[0].toUpperCase() + substring(1);
  }

  /// Converts a string to CONSTANT_CASE
  String get constantCase {
    if (isEmpty) return this;

    // First convert to snake_case
    final snakeCased = snakeCase;

    // Then uppercase everything
    return snakeCased.toUpperCase();
  }
}
