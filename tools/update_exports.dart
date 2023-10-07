#!/usr/bin/env dart

import 'dart:io';

import 'package:path/path.dart' as p;

void main() {
  final libDirectory = Directory('lib');
  final exportFilePath = p.join('lib', 'exports.dart');

  // List of suffixes and file names to check
  final patterns = [
    '.attribute.dart',
    '.dto.dart',
    '.utilities.dart',
    'util.dart',
    'widget.dart',
  ];

  if (!libDirectory.existsSync()) {
    print('The lib directory was not found.');

    return;
  }

  final exportFile = File(exportFilePath);
  if (exportFile.existsSync()) {
    exportFile.deleteSync();
  }

  final newExports = <String>{};

  // Traverse the /lib/ directory
  for (final entity in libDirectory.listSync(recursive: true)) {
    if (entity is File &&
        patterns.any((pattern) => entity.path.endsWith(pattern))) {
      // Get the relative path using the path package
      final relativePath = p.relative(entity.path, from: libDirectory.path);
      newExports.add('export \'$relativePath\';');
    }
  }

  final mergedExports = newExports.toList();
  exportFile.writeAsStringSync(mergedExports.join('\n'));

  print('Exports updated.');
}
