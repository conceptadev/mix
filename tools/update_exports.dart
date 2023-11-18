#!/usr/bin/env dart

import 'dart:io';

import 'package:path/path.dart' as p;

void main() {
  final libDirectory = Directory('lib');
  final exportFilePath = p.join('lib', 'exports.dart');

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
    // Get the relative path using the path package
    final relativePath = p.relative(entity.path, from: libDirectory.path);
    // Exclude files from the core directory
    if (!relativePath.startsWith(p.join('src', 'core')) &&
        relativePath.endsWith('.dart')) {
      newExports.add('export \'$relativePath\';');
    }
  }

  exportFile.writeAsStringSync(newExports.join('\n'));

  print('Exports file updated with ${newExports.length} exports.');
}
