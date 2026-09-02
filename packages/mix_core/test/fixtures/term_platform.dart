// The fake terminal platform shared by mix_core's tests: the context type,
// token type, an interaction-state variant, and two string node modifiers.
// This is the smallest complete platform binding; the reference test
// (`reference_binding_test.dart`) builds a full style on top of it.

import 'package:mix_core/mix_core.dart';

/// The platform's resolution context: token scope, interaction state, size.
class TermContext {
  final TokenStore<TermContext> tokens;
  final Set<String> states;
  final int columns;

  const TermContext({
    this.tokens = const TokenStore(null),
    this.states = const {},
    this.columns = 80,
  });

  bool get focused => states.contains('focused');
}

/// Tokens resolve through the context-carried token table.
class TermToken<T> extends MixToken<TermContext, T> {
  const TermToken(super.name);

  @override
  T resolve(TermContext context) => context.tokens.getToken(this, context);
}

/// A concrete interaction-state variant (mix's `WidgetStateVariant` shape).
class TermStateVariant extends ContextVariant<TermContext> {
  final String state;

  TermStateVariant(this.state)
    : super('state_$state', (c) => c.states.contains(state));

  @override
  Set<Object> get stateDependencies => {state};

  @override
  bool operator ==(Object other) =>
      other is TermStateVariant && other.state == state;

  @override
  int get hashCode => state.hashCode;
}

/// A context variant over terminal width.
ContextVariant<TermContext> wideVariant([int minColumns = 120]) =>
    ContextVariant('wide_$minColumns', (c) => c.columns >= minColumns);

class PadNode implements NodeModifier<String> {
  @override
  String build(String child) => ' $child ';
}

class BorderNode implements NodeModifier<String> {
  @override
  String build(String child) => '|$child|';
}
