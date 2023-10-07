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
    '.util.dart',
    '.widget.dart',
    '.directive.dart',
    '.variant.dart',
    '.tokens.dart',
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
  final notAdded = <String>[];

  // Traverse the /lib/ directory
  for (final entity in libDirectory.listSync(recursive: true)) {
    if (entity is File &&
        patterns.any((pattern) => entity.path.endsWith(pattern))) {
      // Get the relative path using the path package
      final relativePath = p.relative(entity.path, from: libDirectory.path);
      newExports.add('export \'$relativePath\';');
    } else {
      notAdded.add(entity.path);
    }
  }

  final mergedExports = newExports.toList();
  exportFile.writeAsStringSync(mergedExports.join('\n'));

  final dartFilesNotadded = notAdded.where((path) => path.endsWith('.dart'));

  print('Exports file updated, with ${mergedExports.length} exports.');
  for (String file in dartFilesNotadded) {
    print('Not added: $file');
  }
}
