import 'dart:developer';
import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    log('Please provide a component name as an argument.');

    return;
  }

  final componentName = arguments[0];

  generateSpecFile(componentName);
  generateWidgetFile(componentName);
  generateStyleFile(componentName);
  generateVariantsFile(componentName);

  log('Files generated successfully!');
}

void generateSpecFile(String componentName) {
  final directory = 'lib/components/$componentName';
  final fileName = '$directory/${componentName}_spec.dart';
  const content = '';

  Directory(directory).createSync(recursive: true);
  File(fileName).writeAsStringSync(content);
}

void generateWidgetFile(String componentName) {
  final directory = 'lib/components/$componentName';
  final fileName = '$directory/${componentName}_widget.dart';
  const content = '';

  Directory(directory).createSync(recursive: true);
  File(fileName).writeAsStringSync(content);
}

void generateStyleFile(String componentName) {
  final directory = 'lib/components/$componentName';
  final fileName = '$directory/$componentName.style.dart';
  const content = '';

  Directory(directory).createSync(recursive: true);
  File(fileName).writeAsStringSync(content);
}

void generateVariantsFile(String componentName) {
  final directory = 'lib/components/$componentName';
  final fileName = '$directory/$componentName.variants.dart';
  const content = '';

  Directory(directory).createSync(recursive: true);
  File(fileName).writeAsStringSync(content);
}
