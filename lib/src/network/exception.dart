class CustomException implements Exception {
  final _message;
  final _prefix;

  // Las [] => Permiten obviar los errores al Extends en una clase.
  CustomException([this._message, this._prefix]);

  String toString() {
    return '$_message $_prefix';
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message])
      : super(message, '❌Error during communicating: ');
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, '❌Invalid request: ');
}

class UnauthorizedException extends CustomException {
  UnauthorizedException([message]) : super(message, '❌👨🏻‍💻Unauthorized: ');
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super(message, '❌Invalid input: ');
}
