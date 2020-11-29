

class AuthenticationException implements Exception{

  String toString()=> "AuthenticationException";
}


class ValidationException implements Exception{
  final String message;
  final Map<String, String> errors;
  ValidationException({this.message, this.errors});

  factory ValidationException.fromJson(Map<String, dynamic> json){
    Map<String, List<String>> errors = json['errors'];
    return ValidationException(
      message: json['message'],
      errors: errors.map((key, value) => MapEntry(key, value.first))
    );
  }
  String toString()=>"ClientException";
}

class InternalServerException implements Exception{
  String toString()=>"InternalServerException";
}

class NotFoundException implements Exception{
  String toString()=>"NotFoundException";
}