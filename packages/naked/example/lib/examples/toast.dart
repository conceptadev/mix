import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:naked/naked.dart';

class ToastLayer extends StatefulWidget {
  final Widget child;

  const ToastLayer({
    super.key,
    required this.child,
  });

  @override
  State<ToastLayer> createState() => _ToastLayerState();
}

class _ToastLayerState extends State<ToastLayer> {
  static final listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return NakedToastLayer(
      alignment: Alignment.bottomCenter,
      onRemove: (entry) => removeAnimatedToast(entry),
      builder: (context, entries) => KeyedSubtree(
        key: const ValueKey('toast-layer'),
        child: AnimatedList(
          shrinkWrap: true,
          key: listKey,
          initialItemCount: entries.length,
          itemBuilder: (context, index, animation) => KeyedSubtree(
            key: ValueKey(entries[index].startTime),
            child: _AnimationTransformer(
              animation: animation,
              alignment: Alignment.bottomCenter,
              child: entries[index].build(
                () => removeAnimatedToast(entries[index]),
              ),
            ),
          ),
        ),
      ),
      child: widget.child,
    );
  }
}

void addAnimatedToast(NakedToastEntry entry) {
  addToast(entry);
  _ToastLayerState.listKey.currentState!.insertItem(0);
}

void removeAnimatedToast(NakedToastEntry entry) {
  final index = indexOf(entry);

  if (index == null) return;
  _ToastLayerState.listKey.currentState?.removeItem(
    index,
    (context, animation) => KeyedSubtree(
      key: ValueKey(entry.startTime),
      child: _AnimationTransformer(
        animation: animation,
        alignment: Alignment.bottomCenter,
        child: entry.build(
          () => (),
        ),
      ),
    ),
  );

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    removeToast(entry);
  });
}

class _AnimationTransformer extends AnimatedWidget {
  const _AnimationTransformer({
    required Animation<double> animation,
    required this.alignment,
    required this.child,
  }) : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  final AlignmentGeometry alignment;

  final Widget child;
  @override
  Widget build(BuildContext context) {
    const AlignmentDirectional axisAlign = AlignmentDirectional(-1.0, 0);

    final alignment = this.alignment.resolve(Directionality.of(context));

    final slideInAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: const Interval(
          0,
          0.6,
          curve: Curves.easeInOut,
        ),
      ),
    );

    final targetAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: const Interval(
          0.3,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );

    return Align(
      alignment: axisAlign,
      heightFactor: math.max(slideInAnimation.value, 0.0),
      child: DefaultToastificationTransition(
        animation: targetAnimation,
        alignment: alignment,
        child: child,
      ),
    );
  }
}

class DefaultToastificationTransition extends AnimatedWidget {
  const DefaultToastificationTransition({
    super.key,
    required Animation<double> animation,
    required this.alignment,
    this.child,
  }) : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  final AlignmentGeometry alignment;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final alignment = this.alignment.resolve(Directionality.of(context));

    final isCenter = alignment.x == 0;

    final slideOffset = isCenter
        ? alignment.y >= 0
            ? const Offset(0, 1)
            : const Offset(0, -1)
        : alignment.x >= 0
            ? const Offset(1, 0)
            : const Offset(-1, 0);

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: slideOffset,
          end: const Offset(0, 0),
        ).animate(animation),
        child: child,
      ),
    );
  }
}
