import "package:flutter/material.dart";

abstract class _MixStateController extends ChangeNotifier {
  static T ofType<T extends _MixStateController>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_MixStateModel<T>>()!
        .controller;
  }

  static T? maybeOfType<T extends _MixStateController>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_MixStateModel<T>>()
        ?.controller;
  }
}

abstract class MixStateEnumController<T> extends _MixStateController {
  @visibleForTesting
  Set<T> value = {};

  void update(T key, bool add) {
    final valueHasChanged = add ? value.add(key) : value.remove(key);

    if (valueHasChanged) {
      notifyListeners();
    }
  }

  void updateAll(List<(T, bool)> updates) {
    var valueHasChanged = false;
    for (final update in updates) {
      final key = update.$1;
      final add = update.$2;
      if (add) {
        valueHasChanged |= value.add(key);
      } else {
        valueHasChanged |= value.remove(key);
      }
    }

    if (valueHasChanged) {
      notifyListeners();
    }
  }

  bool has(T key) => value.contains(key);
}

class _MixStateModel<T> extends InheritedWidget {
  const _MixStateModel({
    super.key,
    required super.child,
    required this.controller,
  });

  final T controller;

  @override
  bool updateShouldNotify(_MixStateModel<T> oldWidget) {
    return oldWidget.controller != controller;
  }
}

class MixStateBuilder<T extends MixStateController> extends StatefulWidget {
  const MixStateBuilder({
    super.key,
    this.controller,
    this.controllers = const [],
    required this.builder,
  });

  final T? controller;
  final List<T> controllers;

  final Widget Function(BuildContext context) builder;

  @override
  State createState() => _MixStateControllerBuilder<T>();
}

class _MixStateControllerBuilder<T extends MixStateController>
    extends State<MixStateBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    final controllers = [
      if (widget.controller != null) widget.controller!,
      ...widget.controllers,
    ];
    Widget current = ListenableBuilder(
      listenable: Listenable.merge(controllers),
      builder: (context, _) => widget.builder(context),
    );

    for (final controller in controllers) {
      current = _MixStateModel(controller: controller, child: current);
    }

    return current;
  }
}

class MixStateProvider<T extends MixStateController> extends StatelessWidget {
  const MixStateProvider({
    super.key,
    required this.controller,
    required this.child,
  });

  final Widget child;
  final T controller;

  @override
  Widget build(BuildContext context) {
    return _MixStateModel<T>(controller: controller, child: this.child);
  }
}
