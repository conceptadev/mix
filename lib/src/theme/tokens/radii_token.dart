import 'package:flutter/material.dart';

import 'mix_token.dart';

class RadiiToken extends TokenRef with WithReferenceMixin {
  const RadiiToken(super.name);
}

typedef MixRadiiTokens = TokenReferenceMap<RadiiToken, Radius>;
