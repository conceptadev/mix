import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'DropdownMenu Component',
  type: DropdownMenu,
)
Widget buildDropdownMenu(BuildContext context) {
  return const Scaffold(
    body: Center(
      child: DropdownMenuDemo(),
    ),
  );
}

class DropdownMenuDemo extends StatefulWidget {
  const DropdownMenuDemo({
    super.key,
  });

  @override
  State<DropdownMenuDemo> createState() => _DropdownMenuDemoState();
}

enum MenuItem {
  home,
  profile,
}

class _DropdownMenuDemoState extends State<DropdownMenuDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownMenu(
        trigger: (action) => IconButton(
          m.Icons.menu,
          onPressed: action,
        ),
        items: [
          const DropdownMenuItem(
            text: 'Features',
            variants: [
              DropdownMenuStyle.itemLabel,
            ],
          ),
          DropdownMenuItem(
            text: 'home',
            onPress: () {
              showToast(
                context: context,
                entry: ToastEntry(
                  builder: (context, actions) => const Toast(
                    title: 'home was selected',
                  ),
                ),
              );
            },
          ),
          DropdownMenuItem(
            text: 'profile',
            onPress: () {
              showToast(
                context: context,
                entry: ToastEntry(
                  builder: (context, actions) => const Toast(
                    title: 'profile was selected',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
