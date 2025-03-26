import 'package:test/test.dart';
import 'package:mix_generator/src/core/utils/string_utils.dart';

void main() {
  //----------------------------------------------------------------------------
  // STRING EXTENSIONS TESTS
  //----------------------------------------------------------------------------
  group('String Extensions', () {
    test('capitalize works correctly', () {
      expect('hello'.capitalize, equals('Hello'));
      expect(''.capitalize, equals(''));
      expect('a'.capitalize, equals('A'));
      expect('Hello'.capitalize, equals('Hello'));
    });

    test('lowercaseFirst works correctly', () {
      expect('Hello'.lowerCaseFirst, equals('hello'));
      expect(''.lowerCaseFirst, equals(''));
      expect('a'.lowerCaseFirst, equals('a'));
      expect('hello'.lowerCaseFirst, equals('hello'));
    });

    test('snakeCase works correctly', () {
      expect('helloWorld'.snakeCase, equals('hello_world'));
      expect('HelloWorld'.snakeCase, equals('hello_world'));
      expect('hello'.snakeCase, equals('hello'));
      expect(''.snakeCase, equals(''));
    });

    test('camelCase works correctly', () {
      expect('hello_world'.camelCase, equals('helloWorld'));
      expect('hello-world'.camelCase, equals('helloWorld'));
      expect('HelloWorld'.camelCase, equals('helloWorld'));
      expect(''.camelCase, equals(''));
    });

    test('pascalCase works correctly', () {
      expect('hello_world'.pascalCase, equals('HelloWorld'));
      expect('hello-world'.pascalCase, equals('HelloWorld'));
      expect('helloWorld'.pascalCase, equals('HelloWorld'));
      expect(''.pascalCase, equals(''));
    });

    test('constantCase works correctly', () {
      expect('helloWorld'.constantCase, equals('HELLO_WORLD'));
      expect('HelloWorld'.constantCase, equals('HELLO_WORLD'));
      expect('hello_world'.constantCase, equals('HELLO_WORLD'));
      expect(''.constantCase, equals(''));
    });

    test('kebabCase works correctly', () {
      expect('helloWorld'.kebabCase, equals('hello-world'));
      expect('HelloWorld'.kebabCase, equals('hello-world'));
      expect('hello_world'.kebabCase, equals('hello-world'));
      expect(''.kebabCase, equals(''));
    });
  });
}
