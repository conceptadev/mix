#!/usr/bin/env dart

import 'dart:io';

import 'package:path/path.dart' as p;

void main() {
  final dir = Directory('./lib'); // Starting directory
  const searchPattern =
      '.utils.dart'; // The part of the filename you want to search for (including extension)
  const replacement =
      '.utility.dart'; // The string with which you want to replace the searchPattern (including extension)

  // 1. Recursively get all the Dart files
  final allDartFiles = dir.listSync(recursive: true).where((entity) {
    return entity is File && entity.path.endsWith('.dart');
  }).cast<File>();

  // 2. Identify and rename matching files
  final renamedFiles = <String, String>{}; // oldName : newName
  for (final file in allDartFiles) {
    final filename = p.basename(file.path);
    if (filename.contains(searchPattern)) {
      final newFilename = filename.replaceAll(searchPattern, replacement);
      final newPath = p.join(p.dirname(file.path), newFilename);

      file.renameSync(newPath);
      renamedFiles[file.path] = newPath;
    }
  }

  // 3. Update all imports in all Dart files
  for (final file in allDartFiles) {
    var content = file.readAsStringSync();
    bool hasChanges = false;

    for (final oldPath in renamedFiles.keys) {
      final oldImport = p.basename(oldPath);
      final newImport = p.basename(renamedFiles[oldPath]!);

      // Use the search pattern without the extension when updating imports
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
  }

  print('File renaming and import updates completed.');
}
