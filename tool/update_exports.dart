#!/usr/bin/env dart

import 'dart:io';

import 'package:path/path.dart' as p;

void main() {
  final libDirectory = Directory('lib');
  final exportFilePath = p.join('lib', 'mix.dart');

  if (!libDirectory.existsSync()) {
    print('The lib directory was not found.');

    return;
  }

  final exportFile = File(exportFilePath);
  if (exportFile.existsSync()) {
    exportFile.deleteSync();
  }

  final outputString = <String>{};

  outputString.add('library mix;');
  outputString.add('');
  outputString.add('export \'src/deprecations.dart\';');
  outputString.add('');

  // Traverse the /lib/ directory
  for (final entity in libDirectory.listSync(recursive: true)) {
    // Get the relative path using the path package
    final relativePath = p.relative(entity.path, from: libDirectory.path);

    if (relativePath.startsWith(p.join('src', 'helpers'))) {
      continue;
    }

    if (!relativePath.endsWith('.dart')) {
      continue;
    }

    if (relativePath.startsWith('mix.dart')) {
      continue;
    }

    outputString.add('export \'$relativePath\';');
  }

  exportFile.writeAsStringSync(outputString.join('\n'));

  print('Exports file updated with ${outputString.length} exports.');
}
