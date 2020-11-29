import 'package:http/http.dart';
import 'package:linksharingapp/api/errors.dart';

Map<String, String> createAuthHeader(String token){
  return {
    'Authorization': 'Bearer $token',
    'Accept': 'application/json'
  };
}


void toException(Response response){
  if(response.statusCode == 200){
    return;
  }else if(response.statusCode == 401){
    throw AuthenticationException();
  }else if(response.statusCode == 422){
    print(response.body);
    throw ValidationException();
  }else if(response.statusCode >= 500 && response.statusCode < 600){
    print(response.body);
    throw InternalServerException();
  }else{
    throw Exception(['code:${response.statusCode}', 'body:${response.body}']);
  }
}