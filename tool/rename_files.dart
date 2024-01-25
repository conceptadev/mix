import 'dart:io';

import 'package:path/path.dart' as p;

void main() {
  final dir = Directory('./lib'); // Starting directory
  const searchPattern = '.dto.dart';
  const replacement = '_dto.dart';

  // 1. Update imports in all Dart files
  final allDartFiles = dir.listSync(recursive: true).where((entity) {
    return entity is File && entity.path.endsWith('.dart');
  }).cast<File>();

  for (final file in allDartFiles) {
    String content = file.readAsStringSync();

    content = content.replaceAll(searchPattern, replacement);

    file.writeAsStringSync(content);
  }

  // 2. Rename matching files
  for (final file in allDartFiles) {
    final filename = p.basename(file.path);
    if (filename.contains(searchPattern)) {
      final newFilename = filename.replaceAll(searchPattern, replacement);
      final newPath = p.join(p.dirname(file.path), newFilename);
      file.renameSync(newPath);
    }
  }

  print('Import updates and file renaming completed.');
}
