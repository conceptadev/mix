part of 'textfield.dart';

class TextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Clip clipBehavior;
  final String? restorationId;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;
  final StrutStyle? strutStyle;
  final bool showSelectionHandles;
  final bool rendererIgnoresPointer;
  final Color? autocorrectionTextRectColor;
  final AutofillClient? autofillClient;
  final Iterable<String>? autofillHints;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final Offset cursorOffset;
  final bool cursorOpacityAnimates;
  final DragStartBehavior dragStartBehavior;
  final bool forceLine;
  final Object groupId;
  final Locale? locale;
  final MouseCursor? mouseCursor;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final SelectionChangedCallback? onSelectionChanged;
  final VoidCallback? onSelectionHandleTapped;
  final TapRegionCallback? onTapOutside;
  final bool paintCursorAboveText;
  final ScrollBehavior? scrollBehavior;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final TextHeightBehavior? textHeightBehavior;
  final TextScaler? textScaler;
  final TextWidthBasis textWidthBasis;
  final UndoHistoryController? undoController;
  final Style mixStyle;

  const TextField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance = Brightness.light,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.scrollController,
    this.scrollPhysics,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.showSelectionHandles = false,
    this.rendererIgnoresPointer = false,
    this.autocorrectionTextRectColor,
    this.autofillClient,
    this.autofillHints,
    this.contentInsertionConfiguration,
    this.cursorOffset = Offset.zero,
    this.cursorOpacityAnimates = false,
    this.dragStartBehavior = DragStartBehavior.start,
    this.forceLine = true,
    this.groupId = EditableText,
    this.locale,
    this.mouseCursor,
    this.onAppPrivateCommand,
    this.onSelectionChanged,
    this.onSelectionHandleTapped,
    this.onTapOutside,
    this.paintCursorAboveText = false,
    this.scrollBehavior,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis = TextWidthBasis.parent,
    this.undoController,
    required this.mixStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: mixStyle,
      builder: (context) {
        final spec = TextFieldSpec.of(context);

        return EditableText(
          controller: controller ?? TextEditingController(),
          focusNode: focusNode ?? FocusNode(),
          style: spec.style,
          strutStyle: strutStyle,
          cursorColor: cursorColor ?? m.Theme.of(context).colorScheme.primary,
          backgroundCursorColor: m.Colors.grey,
          selectionColor:
              m.Theme.of(context).colorScheme.primary.withOpacity(0.4),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          textAlign: textAlign,
          textDirection: textDirection,
          readOnly: readOnly,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          autofocus: autofocus,
          selectionControls: selectionControls,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          inputFormatters: inputFormatters,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          scrollPadding: scrollPadding,
          scrollPhysics: scrollPhysics,
          keyboardAppearance: keyboardAppearance ?? Brightness.dark,
          enableInteractiveSelection: enableInteractiveSelection,
          scrollController: scrollController,
          clipBehavior: clipBehavior,
          restorationId: restorationId,
          scribbleEnabled: scribbleEnabled,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          showSelectionHandles: showSelectionHandles,
          rendererIgnoresPointer: rendererIgnoresPointer,
          autocorrectionTextRectColor:
              autocorrectionTextRectColor ?? m.Colors.transparent,
          autofillClient: autofillClient,
          autofillHints: autofillHints,
          contentInsertionConfiguration: contentInsertionConfiguration,
          cursorOffset: cursorOffset,
          cursorOpacityAnimates: cursorOpacityAnimates,
          dragStartBehavior: dragStartBehavior,
          forceLine: forceLine,
          groupId: groupId,
          locale: locale,
          mouseCursor: mouseCursor,
          onAppPrivateCommand: onAppPrivateCommand,
          onSelectionChanged: onSelectionChanged,
          onSelectionHandleTapped: onSelectionHandleTapped,
          onTapOutside: onTapOutside,
          paintCursorAboveText: paintCursorAboveText,
          scrollBehavior: scrollBehavior,
          selectionHeightStyle: selectionHeightStyle,
          selectionWidthStyle: selectionWidthStyle,
          textHeightBehavior: textHeightBehavior,
          textScaler: textScaler ?? MediaQuery.textScalerOf(context),
          textWidthBasis: textWidthBasis,
          undoController: undoController,
          contextMenuBuilder: (context, editableTextState) {
            return m.AdaptiveTextSelectionToolbar.editableText(
              editableTextState: editableTextState,
            );
          },
          spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
          magnifierConfiguration: TextMagnifierConfiguration.disabled,
        );
      },
    );
  }
}
