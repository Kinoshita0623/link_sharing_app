import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:linksharingapp/api/util.dart';
import 'package:linksharingapp/models/note.dart';
import 'package:linksharingapp/api/page.dart';

class NoteAPI{

  final String baseUrl;


  NoteAPI({ @required this.baseUrl });

  Future<PageData<Note>> timeline({ @required String token, int page = 1}) async{
    final response = await http.get('$baseUrl/api/notes?page=$page', headers: createAuthHeader(token));
    toException(response);
    return PageData<Note>.fromJson(jsonDecode(response.body), (m)=> Note.fromJson(m));
  }

  Future<Note> create({ @required String token, @required String url, @required String text, List<String> tags}) async{
    final body = {
      'url': url, 'text': text, 'tags': tags
    };
    final j = json.encode(body);
    print(j);
    final response = await http.post('$baseUrl/api/notes', headers: createHeader(token: token), body: j);
    toException(response);
    return Note.fromJson(jsonDecode(response.body));
  }

  Future<int> delete(String token, int noteId) async {
    final response = await http.delete('$baseUrl/api/notes/$noteId', headers: createHeader(token: token));
    toException(response);
    return noteId;
  }

  Future<PageData<Note>> searchByTag(List<List<String>> tags, { String token, int page = 1}) async {
    final conditions = jsonEncode({ 'conditions' :tags});
    print(conditions);
    final response = await http.post('$baseUrl/api/notes/search-by-tag?page=$page', headers: createHeader(token: token), body: conditions);
    toException(response);
    return PageData<Note>.fromJson(jsonDecode(response.body), (m)=>Note.fromJson(m));
  }

  Future<Note> get(int noteId, { String token }) async{
    final response = await http.get('$baseUrl/api/notes/$noteId', headers:createHeader(token: token));
    toException(response);
    return Note.fromJson(jsonDecode(response.body));
  }

}