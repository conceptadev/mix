import 'package:code_builder/code_builder.dart';

extension MethodExt on Method {
  Method override() {
    return rebuild((builder) {
      builder.annotations.add(refer('override'));
    });
  }
}

//  Constructor((builder) {
//   builder.constant = isConst;
//   builder.optionalParameters.addAll(fields.constructorParams);
//   builder.docs.addAll([
//     '/// Creates a [$specClassName] with the given fields',
//     '///',
//     '// All parameters are optional',
//   ]);
// }),

// Instead of the above

// I wouild like to do this
// Constructor().isConst().withParams(fields.constructorParams).withDocs([]);
extension ConstructorExt on Constructor {
  Constructor withIsConst() {
    return rebuild((builder) {
      builder.constant = true;
    });
  }

  Constructor withOptionalParams(List<Parameter> params) {
    return rebuild((builder) {
      builder.optionalParameters.addAll(params);
    });
  }

  Constructor withComments(String comments) {
    return rebuild((builder) {
      builder.docs.add(comments);
    });
  }
}

class GenConstructor {
  final List<String> _comments;
  final List<Parameter> _params;
  final bool _isConst;

  const GenConstructor({
    List<String> comments = const [],
    List<Parameter> params = const [],
    bool isConst = false,
  })  : _comments = comments,
        _params = params,
        _isConst = isConst;

  Constructor call() {
    return Constructor((builder) {
      builder.constant = _isConst;
      builder.optionalParameters.addAll(_params);
      builder.docs.addAll(_comments);
    });
  }
}
