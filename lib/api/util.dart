import 'dart:convert';

import 'package:http/http.dart';
import 'package:linksharingapp/api/errors.dart';

Map<String, String> createAuthHeader(String token){
  final base = createBaseHeader();
  base['Authorization'] = 'Bearer $token';
  return base;
}

Map<String, String> createBaseHeader(){
  return {
    'Accept': 'application/json',
    "Content-Type": "application/json"
  };
}

Map<String, String> createHeader({ String token }){
  if(token !=null && token.isNotEmpty){
    return createAuthHeader(token);
  }else{
    return createBaseHeader();
  }
}

void toException(Response response){
  if(response.statusCode == 200){
    return;
  }else if(response.statusCode == 401){
    throw AuthenticationException();
  }else if(response.statusCode == 422){
    print(response.body);
    Map<String, dynamic> json = jsonDecode(response.body);
    throw ValidationException.fromJson(json);
  }else if(response.statusCode >= 500 && response.statusCode < 600){
    print(response.body);
    throw InternalServerException();
  }else if(response.statusCode == 404){
    print(response.body);
    throw NotFoundException();
  }else{
    throw Exception(['code:${response.statusCode}', 'body:${response.body}']);
  }
}