#!/usr/bin/env dart

import 'dart:developer';
import 'dart:io';

final _namespaces = [
  'spec',
  'attribute',
  'dto',
  'util',
  'token',
  'widget',
  'modifier',
];

final _dirNamespace = ['core', 'material'];

final _libDirectory = Directory('lib');
final _mixFile = File(_joinPaths(_libDirectory.path, 'mix.dart'));

final _namespaceAlias = {'core': 'foundation', 'util': 'utilities'};
final _exportDir = Directory(_joinPaths(
  _libDirectory.path,
  'src',
  'exports',
));

Future<void> main() async {
  if (!_libDirectory.existsSync()) {
    log('The lib directory was not found.');

    return;
  }

  await Future.wait(_namespaces
      .map((e) => _exportNamespace(e, exportName: _namespaceAlias[e])));
  await Future.wait(_dirNamespace.map((e) =>
      _exportNamespace(e, isDirectory: true, exportName: _namespaceAlias[e])));

  _libraryExport();
}

void _libraryExport() {
  if (_mixFile.existsSync()) {
    _mixFile.deleteSync();
  }
  final outputString = StringBuffer();

  outputString
      .writeln('/// This file is generated by the update_exports.dart script.');
  outputString.writeln('/// DO NOT MODIFY MANUALLY');
  outputString.writeln('');
  outputString.writeln('library mix;');
  outputString.writeln('');

  for (final libName in [..._namespaces, ..._dirNamespace]) {
    final libFile = File(_joinPaths(_exportDir.path, '$libName.dart'));

    if (!libFile.existsSync()) {
      log('The $libName.dart file was not found.');
      continue;
    }

    final relativePath = _getRelativePath(libFile.path, _libDirectory.path);

    outputString.writeln('export \'$relativePath\';');
  }

  outputString.writeln('// Automated file exports');

  final filesList = _libDirectory.listSync(recursive: true);

  // Order the files alphabetically
  filesList.sort((a, b) => a.path.compareTo(b.path));

  // Traverse the /lib/ directory
  for (final entity in filesList) {
    // Get the relative path using the path package

    if (_isInternal(entity.path) ||
        !_isDartFile(entity.path) ||
        _isGeneratedFile(entity.path) ||
        _hasAnyLibSuffix(entity.path)) {
      continue;
    }

    if (_dirNamespace.any((e) => entity.path.contains('/$e/'))) {
      continue;
    }

    final relativePath = _getRelativePath(entity.path, _libDirectory.path);

    if (entity.path == _mixFile.path) {
      continue;
    }

    outputString.writeln('export \'$relativePath\';');
  }

  _mixFile.writeAsStringSync(outputString.toString());

  log('Exports file updated with ${outputString.length} exports.');
}

bool _isInternal(String path) {
  return path.contains('/internal/');
}

bool _isDartFile(String path) {
  return path.endsWith('.dart');
}

bool _isGeneratedFile(String path) {
  return path.endsWith('.g.dart');
}

String _joinPaths(String path1, String path2, [String? path3, String? path4]) {
  return [path1, path2, path3, path4]
      .where((e) => e != null)
      .join(Platform.pathSeparator);
}

String _getRelativePath(String filePath, String fromPath) {
  // Normalize both paths to use the POSIX path separator
  final String normalizedFilePath = filePath.replaceAll('\\', '/');
  final String normalizedFromPath = fromPath.replaceAll('\\', '/');

  // Split the paths into components
  final List<String> fileComponents = normalizedFilePath.split('/');
  final List<String> fromComponents = normalizedFromPath.split('/');

  // Find the common prefix between the paths
  int commonPrefixLength = 0;
  while (commonPrefixLength < fileComponents.length &&
      commonPrefixLength < fromComponents.length &&
      fileComponents[commonPrefixLength] ==
          fromComponents[commonPrefixLength]) {
    commonPrefixLength++;
  }

  // Build the relative path
  final List<String> relativePath = [];

  // Add '..' for each remaining component in fromPath
  for (int i = commonPrefixLength; i < fromComponents.length; i++) {
    relativePath.add('..');
  }

  // Add the remaining components from filePath
  for (int i = commonPrefixLength; i < fileComponents.length; i++) {
    relativePath.add(fileComponents[i]);
  }

  // Join the relative path components
  return relativePath.join('/');
}

Future<void> _exportNamespace(
  String namespace, {
  /// Is the namespace a directory
  bool isDirectory = false,
  String? exportName,
}) async {
  final outputString = StringBuffer();

  outputString
      .writeln('/// This file is generated by the update_exports.dart script.');
  outputString.writeln('/// DO NOT MODIFY MANUALLY');
  outputString.writeln('');

  outputString.writeln('// Automated file exports');

  final filesList = await _getFilesInDirectory(_libDirectory);

  // Order the files alphabetically
  filesList.sort((a, b) => a.compareTo(b));

  for (final filePath in filesList) {
    if (!_isDartFile(filePath)) {
      continue;
    }
    if (_isInternal(filePath)) {
      continue;
    }

    if (_isGeneratedFile(filePath)) {
      continue;
    }

    if (!_hasNamespaceSuffix(filePath, namespace) && !isDirectory) {
      continue;
    }

    if (isDirectory && !filePath.contains('/$namespace/')) {
      continue;
    }

    final relativePath = _getRelativePath(filePath, _exportDir.path);

    outputString.writeln('export \'$relativePath\';');
  }

  final fileName = '${exportName ?? '${namespace}s'}.dart';

  if (!_exportDir.existsSync()) {
    _exportDir.createSync();
  }
  final namespaceFile = File(_joinPaths(_exportDir.path, fileName));
  await namespaceFile.writeAsString(outputString.toString());
}

bool _hasNamespaceSuffix(String path, String namespace) {
  final validSuffixes = ['_$namespace.dart', '_$namespace.g.dart'];

  return validSuffixes.any(path.endsWith);
}

Future<List<String>> _getFilesInDirectory(Directory directory) async {
  final List<String> filePaths = [];

  await for (final FileSystemEntity entity in directory.list(recursive: true)) {
    if (entity is File) {
      filePaths.add(entity.path);
    }
  }

  return filePaths;
}

bool _hasAnyLibSuffix(String path) {
  final validSuffixes = _namespaces.map((e) => '_$e.dart');

  // Also exports generated files
  final validSuffixGenerated =
      validSuffixes.map((e) => e.replaceAll('.dart', '.g.dart'));

  return [...validSuffixes, ...validSuffixGenerated].any(path.endsWith);
}
