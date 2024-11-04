import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RemixApp(
      home: Scaffold(body: SelectPage()),
    );
  }
}

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  String? value;
  final items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 200,
            child: Select(
              style: const SelectOnceUI(),
              value: value,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              },
              button: (spec) => spec(
                text: value ?? 'Select an Item',
              ),
              items: items
                  .map(
                    (e) => SelectMenuItem(
                      value: e,
                      childBuilder: (spec) => spec(
                        title: e,
                        subtitle: 'Subtitle',
                        // leadingWidgetBuilder: (spec) =>
                        //     spec(m.Icons.ac_unit_rounded),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(width: 32),
          SizedBox(
            width: 200,
            child: Select(
              value: value,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              },
              button: (spec) => spec(
                text: value ?? 'Select an Item',
              ),
              items: items
                  .map(
                    (e) => SelectMenuItem(
                      value: e,
                      childBuilder: (spec) => spec(
                        title: e,
                        subtitle: 'Subtitle',
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectOnceUI extends SelectStyle {
  const SelectOnceUI();

  @override
  Style makeStyle(SpecConfiguration<SelectSpecUtility> spec) {
    final $ = spec.utilities;
    final on = spec.on;

    final button = Style.create([
      $.button.container.chain
        ..padding(16)
        ..borderRadius(16)
        ..border.width(1)
        ..border.color.grey.shade300()
        ..color.grey.shade100(),
    ]);

    final menu = Style.create([
      $.menu.container.chain
        ..color.white()
        ..shadow.blurRadius.zero()
        ..borderRadius(16),
    ]);

    final item = Style.create([
      $.item.outerContainer.chain
        ..padding.horizontal(12)
        ..padding.vertical(10)
        ..borderRadius(12),
      on.selected(
        $.item.outerContainer.chain..color.grey.shade200(),
      ),
    ]);

    final onHover = Style.create([
      on.hover(
        $.item.outerContainer.chain..color.grey.shade300(),
        $.button.container.chain..color.grey.shade300(),
      )
    ]);

    return Style(
      super.makeStyle(spec).call(),
      button(),
      menu(),
      item(),
      onHover(),
    ).animate();
  }
}
