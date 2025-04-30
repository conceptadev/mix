import 'dart:async';

import 'package:flutter/material.dart';

typedef NakedToastBuilder = Widget Function(
  BuildContext context,
  VoidCallback remove,
);

typedef NakedToastLayerBuilder = Widget Function(
  BuildContext context,
  List<NakedToastEntry> entries,
);

class NakedToastEntry {
  final BuildContext context;
  final NakedToastBuilder toast;
  final Duration duration;
  final DateTime startTime;

  NakedToastEntry({
    required this.context,
    required this.toast,
    this.duration = const Duration(seconds: 2),
  }) : startTime = DateTime.now();

  Widget build(VoidCallback remove) {
    return toast(context, remove);
  }

  @override
  bool operator ==(Object other) {
    return other is NakedToastEntry && startTime == other.startTime;
  }

  @override
  int get hashCode => startTime.hashCode;
}

class _TimerToastEntry {
  final Timer timer;
  final NakedToastEntry entry;

  const _TimerToastEntry({
    required this.timer,
    required this.entry,
  });
}

class NakedToastLayer extends StatefulWidget {
  final Widget child;
  final Alignment alignment;
  final NakedToastLayerBuilder builder;
  final void Function(NakedToastEntry) onRemove;

  const NakedToastLayer({
    super.key,
    required this.child,
    required this.builder,
    this.alignment = Alignment.center,
    required this.onRemove,
  });

  @override
  State<NakedToastLayer> createState() => _NakedToastLayerState();
}

class _NakedToastLayerState extends State<NakedToastLayer> {
  final List<_TimerToastEntry> _toasts = [];

  void addToast(NakedToastEntry toast) {
    final timer = Timer(toast.duration, () {
      widget.onRemove(toast);
    });

    setState(() {
      _toasts.add(
        _TimerToastEntry(
          timer: timer,
          entry: toast,
        ),
      );
    });
  }

  int? removeToast(NakedToastEntry toast) {
    final index = _toasts.indexWhere(
      (e) => e.entry.startTime == toast.startTime,
    );

    final toastExists = index != -1;

    if (toastExists) {
      _toasts[index].timer.cancel();
      setState(() {
        _toasts.removeAt(index);
      });
      return index;
    }

    return null;
  }

  int? indexOf(NakedToastEntry toast) {
    final index = _toasts.indexWhere(
      (e) => e.entry.startTime == toast.startTime,
    );

    return index == -1 ? null : index;
  }

  static _NakedToastLayerState of(BuildContext context) {
    final state = context.findAncestorStateOfType<_NakedToastLayerState>();

    if (state == null) {
      throw Exception('NakedToastLayer not found in context');
    }

    return state;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: widget.alignment,
      children: [
        widget.child,
        widget.builder(
          context,
          _toasts.map((e) => e.entry).toList(),
        ),
      ],
    );
  }
}

void addToast(NakedToastEntry toast) {
  _NakedToastLayerState.of(toast.context).addToast(toast);
}

int? removeToast(NakedToastEntry toast) {
  return _NakedToastLayerState.of(toast.context).removeToast(toast);
}

int? indexOf(NakedToastEntry toast) {
  return _NakedToastLayerState.of(toast.context).indexOf(toast);
}
