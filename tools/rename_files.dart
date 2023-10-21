#!/usr/bin/env dartimport 'dart:io';

import 'dart:io';

import 'package:path/path.dart' as p;

void main() {
  final dir = Directory('./lib');
  const searchPattern = '.attributes.dart';
  const replacement = '_attribute.dart';

  // 1. Recursively get all the Dart files
  final allDartFiles = dir
      .listSync(recursive: true)
      .where((entity) => entity is File && entity.path.endsWith('.dart'))
      .cast<File>();

  // Initialize renamedFiles map
  final renamedFiles = <String, String>{};

  // 2. Loop over each Dart file to update its import statements
  for (final file in allDartFiles) {
    var content = file.readAsStringSync();
    bool hasChanges = false;

    // Try updating imports in the current file based on previously renamed files
    for (final oldPath in renamedFiles.keys) {
      final oldImport = p.basename(oldPath);
      final newImport = p.basename(renamedFiles[oldPath]!);
      final oldImportWithoutExtension =
          oldImport.replaceAll(p.extension(searchPattern), '');

      if (content.contains('import \'$oldImportWithoutExtension.dart\'')) {
        content = content.replaceAll(
          'import \'$oldImportWithoutExtension.dart\'',
          'import \'$newImport\'',
        );
        hasChanges = true;
      }
    }

    if (hasChanges) {
      file.writeAsStringSync(content);
    }

    // Rename the file if its name contains the search pattern
    final filename = p.basename(file.path);
    if (filename.contains(searchPattern)) {
      final newFilename = filename.replaceAll(searchPattern, replacement);
      final newPath = p.join(p.dirname(file.path), newFilename);

      file.renameSync(newPath);
      renamedFiles[file.path] = newPath;
    }
  }

  print('File renaming and import updates completed.');
}
