import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

extension WidgetTesterExt on WidgetTester {
  Future<void> pumpRxComponent(
    Widget widget, {
    MixThemeData? data,
  }) async {
    await pumpWidget(
      MaterialApp(
        home: RemixTokens(
          data: data ?? RemixTokens.light,
          child: widget,
        ),
      ),
    );
  }
}
