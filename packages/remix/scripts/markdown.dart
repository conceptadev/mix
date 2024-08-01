#!/usr/bin/env dart

import 'dart:developer';
import 'dart:io';

void main() {
  final rootDirectory = Directory.current;
  final contextFile = File('context.md');

  contextFile.exists().then((exists) {
    if (exists) {
      contextFile.deleteSync();
    }
  });

  void processDirectory(Directory directory) {
    for (var fileOrDir in directory.listSync()) {
      if (fileOrDir is File &&
          fileOrDir.path.endsWith('.dart') &&
          !fileOrDir.path.endsWith('.g.dart') &&
          fileOrDir.path.contains('components')) {
        final fileName = fileOrDir.path.split('/').last;
        final fileContent = fileOrDir.readAsStringSync();

        contextFile.writeAsStringSync('# $fileName\n', mode: FileMode.append);
        contextFile.writeAsStringSync('```dart\n', mode: FileMode.append);
        contextFile.writeAsStringSync(fileContent, mode: FileMode.append);
        contextFile.writeAsStringSync('\n```\n', mode: FileMode.append);
      } else if (fileOrDir is Directory) {
        processDirectory(fileOrDir);
      }
    }
  }

  contextFile.writeAsStringSync('# Dart Files\n');
  processDirectory(rootDirectory);
  log('context.md file generated successfully.');
}
