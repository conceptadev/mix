import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('package manifest remains independently publishable as a beta', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final changelog = File('CHANGELOG.md').readAsStringSync();

    expect(pubspec, contains(RegExp(r'^name: mix_markdown$', multiLine: true)));
    expect(
      pubspec,
      contains(RegExp(r'^version: 0\.0\.1-beta\.0$', multiLine: true)),
    );
    expect(changelog, startsWith('## 0.0.1-beta.0\n'));
    expect(
      pubspec,
      isNot(contains('publish_to: none')),
      reason: 'mix_markdown is released by the repository publish workflow.',
    );
    expect(
      RegExp(r'^  mix: \^2\.2\.0-beta\.5$', multiLine: true).hasMatch(pubspec),
      isTrue,
      reason: 'Published packages must use the hosted Mix dependency.',
    );
    expect(
      RegExp(
        r'^  mix_annotations: \^2\.2\.0-beta\.1$',
        multiLine: true,
      ).hasMatch(pubspec),
      isTrue,
      reason: 'Published packages must use hosted annotations.',
    );
    expect(
      RegExp(r'^  markdown: \^7\.3\.0$', multiLine: true).hasMatch(pubspec),
      isTrue,
    );

    final screenshotPaths = RegExp(
      r'^    path: (example/screenshots/\S+)$',
      multiLine: true,
    ).allMatches(pubspec).map((match) => match.group(1)!);
    expect(screenshotPaths, hasLength(2));
    expect(
      screenshotPaths,
      everyElement(
        predicate<String>(
          (path) => File(path).existsSync(),
          'references an existing screenshot',
        ),
      ),
    );
  });

  test('the public barrel exports every public library', () {
    final barrel = File('lib/mix_markdown.dart').readAsStringSync();
    const expected = [
      'src/parsing/markdown_syntax.dart',
      'src/specs/markdown_alert_spec.dart',
      'src/specs/markdown_alert_type.dart',
      'src/specs/markdown_alert_type_spec.dart',
      'src/specs/markdown_spec.dart',
      'src/widgets/mix_markdown.dart',
    ];

    for (final path in expected) {
      expect(barrel, contains("export '$path';"));
    }
  });
}
