#!/usr/bin/env dart

import 'dart:io';

import 'package:path/path.dart' as p;

void main() {
  final libDirectory = Directory('lib');
  final exportFilePath = p.join('lib', 'exports.dart');
  const indicatorComment = '// @exportRequired';

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
    if (entity is File && entity.path.endsWith('.dart')) {
      final lines = entity.readAsLinesSync();

      // Check if the file has the indicator comment at the top
      if (lines.isNotEmpty && lines.first.trim() == indicatorComment) {
        // Get the relative path using the path package
        final relativePath = p.relative(entity.path, from: libDirectory.path);

        newExports.add('export \'$relativePath\';');
      }
    }
  }

  final mergedExports = newExports.toList();
  exportFile.writeAsStringSync(mergedExports.join('\n'));

  print('Exports updated.');
}
