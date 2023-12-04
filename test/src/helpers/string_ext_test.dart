import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/helpers/string_ext.dart';

void main() {
  group('StringExt', () {
    test('words work properly', () {
      String input = 'helloWorld';

      expect(input.words, ['hello', 'World']);

      input = 'hello_world';
      expect(input.words, ['hello', 'world']);

      input = 'hello-world';
      expect(input.words, ['hello', 'world']);

      input = 'hello world';
      expect(input.words, ['hello', 'world']);

      input = 'HelloWorld';
      expect(input.words, ['Hello', 'World']);

      input = 'HELLO_WORLD';
      expect(input.words, ['HELLO', 'WORLD']);

      input = 'HELLO-WORLD';
      expect(input.words, ['HELLO', 'WORLD']);

      input = 'HELLO WORLD';
      expect(input.words, ['HELLO', 'WORLD']);
    });

    test('isUpperCase work properly', () {
      String input = 'HELLO';
      expect(input.isUpperCase, true);

      input = 'hello';
      expect(input.isUpperCase, false);

      input = 'Hello';
      expect(input.isUpperCase, false);
    });

    test('isLowerCase work properly', () {
      String input = 'hello';
      expect(input.isLowerCase, true);

      input = 'HELLO';
      expect(input.isLowerCase, false);

      input = 'Hello';
      expect(input.isLowerCase, false);
    });

    test('camelCase work properly', () {
      String input = 'hello_world';
      expect(input.camelCase, 'helloWorld');

      input = 'hello-world';
      expect(input.camelCase, 'helloWorld');

      input = 'Hello World';
      expect(input.camelCase, 'helloWorld');
    });

    test('pascalCase work properly', () {
      String input = 'hello_world';
      expect(input.pascalCase, 'HelloWorld');

      input = 'hello-world';
      expect(input.pascalCase, 'HelloWorld');

      input = 'Hello World';
      expect(input.pascalCase, 'HelloWorld');
    });

    test('capitalize work properly', () {
      String input = 'hello';
      expect(input.capitalize, 'Hello');

      input = 'HELLO';
      expect(input.capitalize, 'Hello');

      input = 'hello world';
      expect(input.capitalize, 'Hello world');
    });

    test('constantCase work properly', () {
      String input = 'hello_world';
      expect(input.constantCase, 'HELLO_WORLD');

      input = 'hello-world';
      expect(input.constantCase, 'HELLO_WORLD');

      input = 'Hello World';
      expect(input.constantCase, 'HELLO_WORLD');
    });

    test('snakeCase work properly', () {
      String input = 'HelloWorld';
      expect(input.snakeCase, 'hello_world');

      input = 'hello-world';
      expect(input.snakeCase, 'hello_world');

      input = 'Hello World';
      expect(input.snakeCase, 'hello_world');
    });

    test('paramCase work properly', () {
      String input = 'HelloWorld';
      expect(input.paramCase, 'hello-world');

      input = 'hello_world';
      expect(input.paramCase, 'hello-world');

      input = 'Hello World';
      expect(input.paramCase, 'hello-world');
    });

    test('titleCase work properly', () {
      String input = 'HELLO_WORLD';
      expect(input.titleCase, 'Hello World');

      input = 'hello-world';
      expect(input.titleCase, 'Hello World');

      input = 'hello world';
      expect(input.titleCase, 'Hello World');
    });
  });

  group('ListStringExt', () {
    test('lowercase work properly', () {
      var input = ['HELLO', 'WORLD'];
      expect(input.lowercase, ['hello', 'world']);

      input = ['Hello', 'World'];
      expect(input.lowercase, ['hello', 'world']);
    });

    test('uppercase work properly', () {
      var input = ['hello', 'world'];
      expect(input.uppercase, ['HELLO', 'WORLD']);

      input = ['Hello', 'World'];
      expect(input.uppercase, ['HELLO', 'WORLD']);
    });
  });
}
