import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/generators/mixable_dto_generator.dart';
import 'package:mix_generator/src/generators/mixable_spec_generator.dart';
import 'package:source_gen_test/source_gen_test.dart'
    show
        initializeLibraryReaderForDirectory,
        initializeBuildLogTracking,
        testAnnotatedElements;

Future<void> main() async {
  final readerForSpecCase = await initializeLibraryReaderForDirectory(
    'test/generated_code_test_cases',
    'test_case_spec_basic.dart',
  );
  final readerForDtoCase = await initializeLibraryReaderForDirectory(
    'test/generated_code_test_cases',
    'test_case_dto_basic.dart',
  );

  initializeBuildLogTracking();

  testAnnotatedElements<MixableSpec>(
    readerForSpecCase,
    const MixableSpecGenerator(),
  );

  testAnnotatedElements<MixableDto>(
    readerForDtoCase,
    const MixableDtoGenerator(),
  );
}
