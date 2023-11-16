import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

// import '../specs/stack_spec.dart';
// import 'container_widget.dart';
// import 'styled_widget.dart';

// class StyledStack extends StyledWidget {
//   const StyledStack({
//     this.children = const <Widget>[],
//     super.inherit,
//     super.key,
//     super.style,
//   });

//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) {
//     return buildWithStyle(context, (data) {
//       final spec = StackSpec.resolve(data);

//       const fallback = Stack();

//       return Stack(
//         alignment: spec.alignment ?? fallback.alignment,
//         fit: spec.fit ?? fallback.fit,
//         clipBehavior: spec.clipBehavior ?? fallback.clipBehavior,
//         children: children,
//       );
//     });
//   }
// }

// class ZBox extends StyledWidget {
//   const ZBox({
//     this.children = const <Widget>[],
//     super.inherit,
//     super.key,
//     super.style,
//   });

//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) {
//     return buildWithStyle(context, (data) {
//       return StyledContainer(
//         inherit: true,
//         child: StyledStack(inherit: true, children: children),
//       );
//     });
//   }
// }

void main() {
  testWidgets('Stack', (tester) async {
    final style = StyleMix(
      stackFit.expand(),
      alignment.topCenter(),
      clip.antiAlias(),
      textDirection.ltr(),
    );
    await tester.pumpMaterialApp(
      StyledStack(
        style: style,
        children: [
          Container(
            height: 100,
            width: 100,
            color: const Color(0xFF000000),
          ),
          Container(
            height: 50,
            width: 50,
            color: const Color(0xFF0000FF),
          ),
        ],
      ),
    );

    final stack = tester.widget<Stack>(find.byType(Stack));

    expect(find.byType(Stack), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(2));
    expect(stack.alignment, Alignment.topCenter);
    expect(stack.fit, StackFit.expand);
    expect(stack.clipBehavior, Clip.antiAlias);
    expect(stack.textDirection, TextDirection.ltr);
  });

  testWidgets('ZBox', (tester) async {
    final style = StyleMix(
      stackFit.expand(),
      alignment.topCenter(),
      clip(Clip.antiAlias),
      textDirection(TextDirection.ltr),
      backgroundColor(Colors.red),
    );

    await tester.pumpMaterialApp(
      ZBox(
        style: style,
        children: const [],
      ),
    );

    final stack = tester.widget<Stack>(find.byType(Stack));
    final container = tester.widget<Container>(find.byType(Container));

    expect(find.byType(Stack), findsOneWidget);

    expect(find.byType(StyledContainer), findsOneWidget);

    expect((container.decoration as BoxDecoration).color, Colors.red);

    expect(stack.alignment, Alignment.topCenter);
    expect(stack.fit, StackFit.expand);
    expect(stack.clipBehavior, Clip.antiAlias);
    expect(stack.textDirection, TextDirection.ltr);
  });
}
