import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'custom_builder.dart';

Builder customBuilder(BuilderOptions _) =>
    LibraryBuilder(const CustomBuilder());
