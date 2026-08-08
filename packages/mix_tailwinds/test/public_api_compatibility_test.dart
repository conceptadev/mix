import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mix_tailwinds/mix_tailwinds.dart';

void main() {
  test('public barrel keeps the supported runtime surface', () {
    const diagnostic = TwDiagnostic(
      token: 'group-hover:bg-red-500',
      code: TwDiagnosticCode.contextVariantIgnored,
      reason: 'Selector-relative state is unavailable.',
      workaround: 'Share state explicitly.',
    );
    final config = TwConfig.standard();
    final parser = TwParser(config: config);

    expect(diagnostic.token, 'group-hover:bg-red-500');
    expect(diagnostic.code, TwDiagnosticCode.contextVariantIgnored);
    expect(config.breakpoints, contains('md'));
    expect(parser.parseBox('p-4'), isNotNull);
    expect(
      TwGradientStrategy.values,
      contains(TwGradientStrategy.cssAngleRect),
    );
    expect(const Div(classNames: 'p-4'), isNotNull);
    expect(const Button(classNames: 'p-4', onPressed: null), isNotNull);
  });

  test('public barrel does not export the removed semantic registry', () {
    final barrel = File('lib/mix_tailwinds.dart').readAsStringSync();

    expect(barrel, isNot(contains('tw_semantic.dart')));
  });
}
