import 'package:code_builder/code_builder.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';

class PrivateMethodHelper {
  const PrivateMethodHelper._();

  static final lerpDoubleRef = refer('_lerpDouble');

  static final lerpTextStyleRef = refer('_lerpTextStyle');
  static final lerpStrutStyleRef = refer('_lerpStrutStyle');

  static final mergeListTRef = refer('_mergeListT');

  static final mergeListT = Method((b) {
    b.name = mergeListTRef.symbol;
    b.types.add(TypeReference((b) => b.symbol = 'T'));
    b.returns = refer('List<T>').nullable;
    b.requiredParameters.add(Parameter((b) {
      b.name = 'a';
      b.type = refer('List<T>').nullable;
    }));
    b.requiredParameters.add(Parameter((b) {
      b.name = 'b';
      b.type = refer('List<T>').nullable;
    }));
    b.body = Code('''
      if (b == null) return a ?? [];
      if (a == null) return b;

      final mergedList = [...a];
      for (int i = 0; i < b.length; i++) {
        if (i < mergedList.length) {
          mergedList[i] = b[i] ?? mergedList[i];
        } else {
          mergedList.add(b[i]);
        }
      }

      return mergedList;
    ''');
  });

  static final lerpDouble = Method((b) {
    b.name = lerpDoubleRef.symbol;
    b.returns = refer('double').nullable;
    b.requiredParameters.add(Parameter((b) {
      b.name = 'a';
      b.type = refer('num').nullable;
    }));
    b.requiredParameters.add(Parameter((b) {
      b.name = 'b';
      b.type = refer('num').nullable;
    }));
    b.requiredParameters.add(Parameter((b) {
      b.name = 't';
      b.type = refer('double');
    }));
    b.body = Code('''
      if (a == b || (a?.isNaN ?? false) && (b?.isNaN ?? false)) {
        return a?.toDouble();
      }
      a ??= 0.0;
      b ??= 0.0;
      return a * (1.0 - t) + b * t;
    ''');
  });

  static final lerpStrutStyle = Method((b) {
    b.name = lerpStrutStyleRef.symbol;
    b.returns = refer('StrutStyle').nullable;
    b.requiredParameters.add(Parameter((b) {
      b.name = 'a';
      b.type = refer('StrutStyle').nullable;
    }));
    b.requiredParameters.add(Parameter((b) {
      b.name = 'b';
      b.type = refer('StrutStyle').nullable;
    }));
    b.requiredParameters.add(Parameter((b) {
      b.name = 't';
      b.type = refer('double');
    }));

    b.body = Code('''
      if (a == null && b == null) return null;
      if (a == null) return b;
      if (b == null) return a;

      return StrutStyle(
        fontFamily: t < 0.5 ? a.fontFamily : b.fontFamily,
        fontFamilyFallback: t < 0.5 ? a.fontFamilyFallback : b.fontFamilyFallback,
        fontSize: _lerpDouble(a.fontSize, b.fontSize, t),
        height: _lerpDouble(a.height, b.height, t),
        leading: _lerpDouble(a.leading, b.leading, t),
        fontWeight: FontWeight.lerp(a.fontWeight, b.fontWeight, t),
        fontStyle: t < 0.5 ? a.fontStyle : b.fontStyle,
        forceStrutHeight: t < 0.5 ? a.forceStrutHeight : b.forceStrutHeight,
        debugLabel: a.debugLabel ?? b.debugLabel,
        leadingDistribution:
            t < 0.5 ? a.leadingDistribution : b.leadingDistribution,
      );
    ''');
  });

  static final lerpTextStyle = Method((b) {
    b.name = lerpTextStyleRef.symbol;
    b.returns = refer('TextStyle').nullable;
    b.requiredParameters.add(Parameter((b) {
      b.name = 'a';
      b.type = refer('TextStyle').nullable;
    }));
    b.requiredParameters.add(Parameter((b) {
      b.name = 'b';
      b.type = refer('TextStyle').nullable;
    }));
    b.requiredParameters.add(Parameter((b) {
      b.name = 't';
      b.type = refer('double');
    }));

    b.body = Code('''
        return TextStyle.lerp(a, b, t)?.copyWith(shadows: Shadow.lerpList(a?.shadows, b?.shadows, t));
        ''');
  });
}
