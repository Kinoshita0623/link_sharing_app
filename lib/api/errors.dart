

class AuthenticationException implements Exception{

  String toString()=> "AuthenticationException";
}


class ValidationException implements Exception{

  String toString()=>"ClientException";
}

class InternalServerException implements Exception{
  String toString()=>"InternalServerException";
}

class NotFoundException implements Exception{
  String toString()=>"NotFoundException";
}