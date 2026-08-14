import 'dart:io';

import 'package:mix_chart_protocol/src/mix_chart_inventory.dart';

import '../../mix_protocol/tool/styler_surface.dart' as inventory;

void main() {
  final surface = inventory.collectStylerSurface(
    sourceRoot: Directory('../mix_chart/lib/src'),
  );
  final vocabularySource = File(
    'lib/src/mix_chart_vocabulary.dart',
  ).readAsStringSync();
  final vocabularyTypes = RegExp(
    r'MixProtocolStylerBranch<([^>]+)>',
  ).allMatches(vocabularySource).map((match) => match.group(1)!).toSet();
  final missingBranches = surface.stylerNames.difference(vocabularyTypes);
  final staleBranches = vocabularyTypes.difference(surface.stylerNames);
  final fieldDrift = <String>{};
  for (final styler in {
    ...surface.stylerNames,
    ...mixChartStylerInventory.keys,
  }) {
    if (!_sameSet(
      surface.fieldsByStyler[styler],
      mixChartStylerInventory[styler],
    )) {
      fieldDrift.add(styler);
    }
  }

  if (missingBranches.isEmpty && staleBranches.isEmpty && fieldDrift.isEmpty) {
    stdout.writeln(
      'mix_chart vocabulary inventory ok: ${surface.stylerNames.length} stylers',
    );

    return;
  }

  stderr.writeln('mix_chart vocabulary inventory drift detected');
  if (missingBranches.isNotEmpty) {
    stderr.writeln('Missing branches: ${missingBranches.toList()..sort()}');
  }
  if (staleBranches.isNotEmpty) {
    stderr.writeln('Stale branches: ${staleBranches.toList()..sort()}');
  }
  if (fieldDrift.isNotEmpty) {
    stderr.writeln('Field drift: ${fieldDrift.toList()..sort()}');
  }
  exitCode = 1;
}

bool _sameSet(Set<String>? left, Set<String>? right) {
  return left != null &&
      right != null &&
      left.length == right.length &&
      left.containsAll(right);
}
