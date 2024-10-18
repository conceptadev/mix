part of 'textfield.dart';

class TextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;

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

  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Clip clipBehavior;
  final String? restorationId;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;

  final bool showSelectionHandles;
  final bool rendererIgnoresPointer;

  final AutofillClient? autofillClient;
  final Iterable<String>? autofillHints;
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  final bool cursorOpacityAnimates;
  final DragStartBehavior dragStartBehavior;
  final bool forceLine;
  final Object groupId;
  final Locale? locale;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final SelectionChangedCallback? onSelectionChanged;
  final VoidCallback? onSelectionHandleTapped;
  final TapRegionCallback? onTapOutside;

  final ScrollBehavior? scrollBehavior;

  final UndoHistoryController? undoController;
  final Style style;

  const TextField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.textDirection,
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
    this.autofillClient,
    this.autofillHints,
    this.contentInsertionConfiguration,
    this.cursorOpacityAnimates = false,
    this.dragStartBehavior = DragStartBehavior.start,
    this.forceLine = true,
    this.groupId = EditableText,
    this.locale,
    this.onAppPrivateCommand,
    this.onSelectionChanged,
    this.onSelectionHandleTapped,
    this.onTapOutside,
    this.scrollBehavior,
    this.undoController,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: style,
      builder: (context) {
        final spec = TextFieldSpec.of(context);

        return EditableText(
          controller: controller ?? TextEditingController(),
          focusNode: focusNode ?? FocusNode(),
          style: spec.style,
          strutStyle: spec.strutStyle,
          cursorColor: spec.cursorColor,
          backgroundCursorColor: spec.backgroundCursorColor,
          selectionColor: spec.selectionColor,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          textAlign: spec.textAlign,
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
          cursorWidth: spec.cursorWidth,
          cursorHeight: spec.cursorHeight,
          cursorRadius: spec.cursorRadius,
          scrollPadding: spec.scrollPadding,
          scrollPhysics: scrollPhysics,
          // keyboardAppearance: keyboardAppearance ?? Brightness.dark,
          enableInteractiveSelection: enableInteractiveSelection,
          scrollController: scrollController,
          clipBehavior: clipBehavior,
          restorationId: restorationId,
          scribbleEnabled: scribbleEnabled,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          showSelectionHandles: showSelectionHandles,
          rendererIgnoresPointer: rendererIgnoresPointer,
          autocorrectionTextRectColor: spec.autocorrectionTextRectColor,
          autofillClient: autofillClient,
          autofillHints: autofillHints,
          contentInsertionConfiguration: contentInsertionConfiguration,
          cursorOffset: spec.cursorOffset,
          cursorOpacityAnimates: cursorOpacityAnimates,
          dragStartBehavior: dragStartBehavior,
          forceLine: forceLine,
          groupId: groupId,
          locale: locale,
          // mouseCursor: mouseCursor,
          onAppPrivateCommand: onAppPrivateCommand,
          onSelectionChanged: onSelectionChanged,
          onSelectionHandleTapped: onSelectionHandleTapped,
          onTapOutside: onTapOutside,
          paintCursorAboveText: spec.paintCursorAboveText,
          scrollBehavior: scrollBehavior,
          // selectionHeightStyle: spec.selectionHeightStyle,
          // selectionWidthStyle: spec.selectionWidthStyle,
          textHeightBehavior: spec.textHeightBehavior,
          textScaler: spec.textScaler ?? MediaQuery.textScalerOf(context),
          textWidthBasis: spec.textWidthBasis,
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
