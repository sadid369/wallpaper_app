// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyException implements Exception {
  String title;
  String body;
  MyException({
    required this.title,
    required this.body,
  });

  String myToString() {
    return "$title: $body";
  }
}

class FetchDataException extends MyException {
  FetchDataException({required String body})
      : super(title: 'Data Communication Error', body: body);
}

class BadRequestException extends MyException {
  BadRequestException({required String body})
      : super(title: 'Invalid Request Error', body: body);
}

class UnAuthorizedException extends MyException {
  UnAuthorizedException({required String body})
      : super(title: 'UnAuthorized Error', body: body);
}

class InvalidInputException extends MyException {
  InvalidInputException({required String body})
      : super(title: 'Invalid Input Error', body: body);
}
