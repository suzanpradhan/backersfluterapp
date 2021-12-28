import 'dart:async';

class LoginFormValidationBloc {
  final _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream;

  dispose() {
    _textController.close();
  }

  passwordValidate(String? text) {
    (text == null || text == "" || text.length < 6)
        ? _textController.sink
            .addError("Password must have at least 6 characters.")
        : _textController.sink.add(text);
  }

  usernameValidate(String? text) {
    if (text == null || text == "") {
      _textController.sink
          .addError("Username must have at least 8 characters.");
    } else if (text.startsWith(RegExp(r'[A-Z]'))) {
      _textController.sink.addError("Username must start with lowercase.");
    } else if (text.startsWith(RegExp(r'[0-9]'))) {
      _textController.sink.addError("Username must start with a alphabet.");
    } else if (text.length < 8) {
      _textController.sink
          .addError("Username must have at least 8 characters.");
    } else {
      _textController.sink.add(text);
    }
  }
}
