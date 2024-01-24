import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool _isHover = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (event) {
        setState(() => _isHover = true);
      },
      onExit: (event) {
        setState(() => _isHover = false);
      },
      child: Material(
        elevation: _isHover ? 2 : 10,
        child: AnimatedContainer(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 100),
          height: 100,
          padding:
              _isHover ? const EdgeInsets.all(20) : const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: _isHover ? colorScheme.secondary : colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Custom Widget',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: _isHover
                      ? colorScheme.onSecondary
                      : colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}

class CustomMixWidget extends StatelessWidget {
  const CustomMixWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Style(
      box.height(100),
      box.margin.vertical(10),
      box.elevation(10),
      box.borderRadius(10),
      box.color($md.colorScheme.primary()),
      text.style.of($md.textTheme.bodyMedium),
      text.style(color: $md.colorScheme.onPrimary()),
      onHover(
        box.elevation(2),
        box.padding(20),
        box.color.of($md.colorScheme.secondary),
        text.style.color.of($md.colorScheme.onSecondary),
      ),
    );

    return Box(
      style: style,
      child: const StyledText('Custom Widget'),
    );
  }
}
