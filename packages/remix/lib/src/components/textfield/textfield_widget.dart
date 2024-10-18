part of 'textfield.dart';

class TextField extends StatefulWidget {
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

  final TapRegionCallback? onTapOutside;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final ScrollBehavior? scrollBehavior;
  final SpellCheckConfiguration? spellCheckConfiguration;

  final UndoHistoryController? undoController;
  final Style style;

  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;

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
    this.onTapOutside,
    this.scrollBehavior,
    this.undoController,
    this.magnifierConfiguration,
    this.spellCheckConfiguration,
    this.contextMenuBuilder,
    required this.style,
  });

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> with RestorationMixin {
  RestorableTextEditingController? _controller;
  TextEditingController get _effectiveController =>
      widget.controller ?? _controller!.value;

  @override
  String? get restorationId => widget.restorationId;

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    if (_controller != null) {
      _registerController();
    }
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  /// Toggle the toolbar when a selection handle is tapped.
  void _handleSelectionHandleTapped() {
    if (_effectiveController.selection.isCollapsed) {
      _editableText!.toggleToolbar();
    }
  }

  // void _handleSelectionChanged(
  //     TextSelection selection, SelectionChangedCause? cause) {
  //   final bool willShowSelectionHandles = _shouldShowSelectionHandles(cause);
  //   if (willShowSelectionHandles != _showSelectionHandles) {
  //     setState(() {
  //       _showSelectionHandles = willShowSelectionHandles;
  //     });
  //   }

  //   switch (Theme.of(context).platform) {
  //     case TargetPlatform.iOS:
  //     case TargetPlatform.macOS:
  //     case TargetPlatform.linux:
  //     case TargetPlatform.windows:
  //     case TargetPlatform.fuchsia:
  //     case TargetPlatform.android:
  //       if (cause == SelectionChangedCause.longPress) {
  //         _editableText?.bringIntoView(selection.extent);
  //       }
  //   }

  //   switch (Theme.of(context).platform) {
  //     case TargetPlatform.iOS:
  //     case TargetPlatform.fuchsia:
  //     case TargetPlatform.android:
  //       break;
  //     case TargetPlatform.macOS:
  //     case TargetPlatform.linux:
  //     case TargetPlatform.windows:
  //       if (cause == SelectionChangedCause.drag) {
  //         _editableText?.hideToolbar();
  //       }
  //   }
  // }

  EditableTextState? get _editableText => editableTextKey.currentState;
  @override
  final GlobalKey<EditableTextState> editableTextKey =
      GlobalKey<EditableTextState>();

  @override
  void initState() {
    super.initState();
    // _selectionGestureDetectorBuilder =
    //     _TextFieldSelectionGestureDetectorBuilder(state: this);
    if (widget.controller == null) {
      _createLocalController();
    }
    // _effectiveFocusNode.canRequestFocus = widget.canRequestFocus && _isEnabled;
    // _effectiveFocusNode.addListener(_handleFocusChanged);
    // _initStatesController();
  }

  @override
  void didUpdateWidget(TextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null && oldWidget.controller != null) {
      _createLocalController(oldWidget.controller!.value);
    } else if (widget.controller != null && oldWidget.controller == null) {
      unregisterFromRestoration(_controller!);
      _controller!.dispose();
      _controller = null;
    }

    // if (widget.focusNode != oldWidget.focusNode) {
    //   (oldWidget.focusNode ?? _focusNode)?.removeListener(_handleFocusChanged);
    //   (widget.focusNode ?? _focusNode)?.addListener(_handleFocusChanged);
    // }

    // _effectiveFocusNode.canRequestFocus = _canRequestFocus;

    // if (_effectiveFocusNode.hasFocus &&
    //     widget.readOnly != oldWidget.readOnly &&
    //     _isEnabled) {
    //   if (_effectiveController.selection.isCollapsed) {
    //     _showSelectionHandles = !widget.readOnly;
    //   }
    // }

    // if (widget.statesController == oldWidget.statesController) {
    //   _statesController.update(WidgetState.disabled, !_isEnabled);
    //   _statesController.update(WidgetState.hovered, _isHovering);
    //   _statesController.update(
    //       WidgetState.focused, _effectiveFocusNode.hasFocus);
    //   _statesController.update(WidgetState.error, _hasError);
    // } else {
    //   oldWidget.statesController?.removeListener(_handleStatesControllerChange);
    //   if (widget.statesController != null) {
    //     _internalStatesController?.dispose();
    //     _internalStatesController = null;
    //   }
    //   _initStatesController();
    // }
  }

  @override
  void dispose() {
    // _effectiveFocusNode.removeListener(_handleFocusChanged);
    // _focusNode?.dispose();
    _controller?.dispose();
    // _statesController.removeListener(_handleStatesControllerChange);
    // _internalStatesController?.dispose();
    super.dispose();
  }

  // @override
  // final GlobalKey<EditableTextState> editableTextKey =
  //     GlobalKey<EditableTextState>();

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: widget.style,
      builder: (context) {
        final spec = TextFieldSpec.of(context);

        return spec.container(
          child: EditableText(
            // key: editableTextKey,
            controller: _effectiveController,
            // possui logica propria
            focusNode: widget.focusNode ?? FocusNode(),
            style: spec.style,
            strutStyle: spec.strutStyle,
            cursorColor: spec.cursorColor,
            backgroundCursorColor: spec.backgroundCursorColor,
            selectionColor: spec.selectionColor,
            // assert
            keyboardType: widget.keyboardType,
            // assert
            textInputAction: widget.textInputAction,
            // Logica de assert
            textCapitalization: widget.textCapitalization,
            textAlign: spec.textAlign,
            textDirection: widget.textDirection,
            // possui logicas relacionadas
            readOnly: widget.readOnly,
            showCursor: widget.showCursor,
            // Logica de assert
            obscuringCharacter: widget.obscuringCharacter,
            obscureText: widget.obscureText,
            autocorrect: widget.autocorrect,
            // para ambos os smarts tem logica de assert
            smartDashesType: widget.smartDashesType,
            smartQuotesType: widget.smartQuotesType,
            enableSuggestions: widget.enableSuggestions,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            expands: widget.expands,
            autofocus: widget.autofocus,
            // Depende do sistema operacional
            selectionControls: widget.selectionControls,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            onSubmitted: widget.onSubmitted,
            // Possui logica propria
            inputFormatters: widget.inputFormatters,
            cursorWidth: spec.cursorWidth,
            cursorHeight: spec.cursorHeight,
            // Depende do sistema operacional
            cursorRadius: spec.cursorRadius,
            scrollPadding: spec.scrollPadding,
            scrollPhysics: widget.scrollPhysics,
            // keyboardAppearance: keyboardAppearance ?? Brightness.dark,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            scrollController: widget.scrollController,
            clipBehavior: widget.clipBehavior,
            restorationId: 'editable',
            scribbleEnabled: widget.scribbleEnabled,
            enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
            // Possui logica propria
            showSelectionHandles: widget.showSelectionHandles,
            rendererIgnoresPointer: true,
            // depende do sistema operacional
            autocorrectionTextRectColor: spec.autocorrectionTextRectColor,
            // implementa um AutofillClient
            autofillClient: widget.autofillClient,
            // Material possui logica propria
            autofillHints: widget.autofillHints,
            contentInsertionConfiguration: widget.contentInsertionConfiguration,
            // Depende do sistema operacional
            cursorOffset: spec.cursorOffset,
            // Depende do sistema operacional
            cursorOpacityAnimates: widget.cursorOpacityAnimates,
            dragStartBehavior: widget.dragStartBehavior,
            // Nao tem no material
            forceLine: widget.forceLine,
            groupId: widget.groupId,
            // No material nao tem
            locale: widget.locale,
            // mouseCursor: mouseCursor,
            onAppPrivateCommand: widget.onAppPrivateCommand,
            // Material tem função propria para reagir ao selection
            onSelectionChanged: widget.onSelectionChanged,
            onSelectionHandleTapped: _handleSelectionHandleTapped,

            onTapOutside: widget.onTapOutside,
            // No material depende do sistema operacional
            paintCursorAboveText: spec.paintCursorAboveText,
            // Nao tem no material
            scrollBehavior: widget.scrollBehavior,
            // selectionHeightStyle: spec.selectionHeightStyle,
            // selectionWidthStyle: spec.selectionWidthStyle,
            textHeightBehavior: spec.textHeightBehavior,
            // Nao tem no material
            textScaler: spec.textScaler ?? MediaQuery.textScalerOf(context),
            // Nao tem no material
            textWidthBasis: spec.textWidthBasis,
            undoController: widget.undoController,
            contextMenuBuilder: widget.contextMenuBuilder,
            spellCheckConfiguration: widget.spellCheckConfiguration,
            magnifierConfiguration: widget.magnifierConfiguration ??
                m.TextMagnifier.adaptiveMagnifierConfiguration,
          ),
        );
      },
    );
  }
}
