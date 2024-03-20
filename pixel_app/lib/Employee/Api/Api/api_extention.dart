class ApiException implements Exception {
  final String? message;
  final String? prefix;

  ApiException({this.message, this.prefix});

  String toString() {
    return 'Message : $message & Prefix : $prefix';
  }
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([String? msg])
      : super(message: msg, prefix: 'UnAuthorized Request:');
}

class ServerException extends ApiException {
  ServerException([String? msg])
      : super(message: msg, prefix: 'Page not fount in Server:');
}

class BadRequestException extends ApiException {
  BadRequestException([String? msg])
      : super(message: msg, prefix: 'Invalid Request:');
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? msg])
      : super(message: msg, prefix: 'Invalid Input');
}

class FetchDataException extends ApiException {
  FetchDataException([String? msg])
      : super(message: msg, prefix: 'Error During Communication:');
}
