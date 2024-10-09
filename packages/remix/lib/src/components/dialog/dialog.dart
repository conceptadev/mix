import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../helpers/component_builder.dart';
import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'dialog.g.dart';
part 'dialog_style.dart';
part 'dialog_theme.dart';
part 'dialog_widget.dart';

Future<T?> showDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Color barrierColor = const Color(0xcc000000),
  String barrierLabel = '',
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
      transitionBuilder,
  Duration transitionDuration = const Duration(milliseconds: 200),
}) {
  transitionBuilder ??= (context, animation, secondaryAnimation, child) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );

    return FadeTransition(
      opacity: curvedAnimation,
      child: ScaleTransition(
        scale: curvedAnimation.drive(Tween(begin: 0.85, end: 1)),
        child: child,
      ),
    );
  };
  final theme = RemixTheme.maybeOf(context);

  if (theme == null) {
    throw FlutterError.fromParts([
      ErrorSummary('No RemixTheme found in the widget tree.'),
      ErrorDescription('RemixTheme is required to show dialogs.'),
      ErrorHint(
        'Make sure to wrap your app with RemixTheme or use a RemixApp.',
      ),
      ErrorHint('Example with RemixTheme:\n'
          'RemixTheme(\n'
          '  theme: YourRemixTheme,\n'
          '  child: YourAppContent(),\n'
          ')'),
      ErrorHint(
        'Example with RemixApp:\n'
        'RemixApp(\n'
        '  theme: YourRemixTheme,\n'
        '  home: YourHomeWidget(),\n'
        ')',
      ),
    ]);
  }
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => DefaultTextStyle(
      style: const TextStyle(),
      child: RemixTheme(
        theme: theme,
        child: builder(context),
      ),
    ),
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    barrierColor: barrierColor,
    transitionDuration: transitionDuration,
    transitionBuilder: transitionBuilder,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
  );
}

@MixableSpec()
base class DialogSpec extends Spec<DialogSpec>
    with _$DialogSpec, Diagnosticable {
  final BoxSpec container;
  final TextSpec title;
  final TextSpec description;
  final FlexSpec mainFlex;
  final FlexSpec actionsFlex;

  /// {@macro dialog_spec_of}
  static const of = _$DialogSpec.of;

  static const from = _$DialogSpec.from;

  const DialogSpec({
    BoxSpec? container,
    TextSpec? title,
    TextSpec? description,
    FlexSpec? mainFlex,
    FlexSpec? actionsFlex,
    super.modifiers,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        title = title ?? const TextSpec(),
        description = description ?? const TextSpec(),
        mainFlex = mainFlex ?? const FlexSpec(),
        actionsFlex = actionsFlex ?? const FlexSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
