import 'package:flutter/material.dart';

class ReassembleListener extends StatefulWidget {
  const ReassembleListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  static List<StatelessElement> hotReloadElements = [];

  @override
  _ReassembleListenerState createState() => _ReassembleListenerState();
}

class _ReassembleListenerState extends State<ReassembleListener> {
  @override
  void reassemble() {
    super.reassemble();
    rebuildAllDependencies(context);
  }

  void rebuildAllDependencies(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    // (context as Element).visitChildren(rebuild);
    ReassembleListener.hotReloadElements.forEach(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
