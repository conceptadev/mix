import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
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
            style: Theme.of(context).textTheme.button?.copyWith(
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
    final style = Mix(
      height(100),
      animated(),
      marginY(10),
      elevation(10),
      rounded(10),
      bgColor(MaterialTokens.colorScheme.primary),
      textStyle(MaterialTokens.textTheme.button),
      textColor(MaterialTokens.colorScheme.onPrimary),
      onHover(
        elevation(2),
        padding(20),
        bgColor(MaterialTokens.colorScheme.secondary),
        textColor(MaterialTokens.colorScheme.onSecondary),
      ),
    );
    return Box(
      mix: style,
      child: const TextMix('Custom Widget'),
    );
  }
}
