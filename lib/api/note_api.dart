import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:linksharingapp/api/util.dart';
import 'package:linksharingapp/models/note.dart';
import 'package:linksharingapp/api/page.dart';

class NoteAPI{

  final String token;
  final String baseUrl;

  Map<String, String> _headers;

  NoteAPI({ @required this.baseUrl, this.token }){
    this._headers = createAuthHeader(token);
  }

  Future<PageData<Note>> timeline({int page = 1}) async{
    final response = await http.get('$baseUrl/api/notes?page=$page', headers: _headers);
    toException(response);
    return PageData<Note>.fromJson(jsonDecode(response.body), (m)=> Note.fromJson(m));
  }

  Future<Note> create({ @required String url, @required String text, List<String> tags}) async{
    final response = await http.post('$baseUrl/api/notes', headers: _headers, body: {
      'url': url, 'text': text, tags: tags
    });
    toException(response);
    return Note.fromJson(jsonDecode(response.body));
  }

  Future<int> delete(int noteId) async {
    final response = await http.delete('$baseUrl/api/notes/$noteId', headers: _headers);
    toException(response);
    return noteId;
  }

  Future<PageData<Note>> searchByTag(List<List<String>> tags, { int page = 1}) async {
    final response = await http.post('$baseUrl/api/notes/search-by-tag?page=$page', headers: _headers, body: {
      'conditions': tags
    });
    toException(response);
    return PageData<Note>.fromJson(jsonDecode(response.body), (m)=>Note.fromJson(m));
  }

  Future<Note> get(int noteId) async{
    final response = await http.get('$baseUrl/api/notes/$noteId', headers: _headers);
    toException(response);
    return Note.fromJson(jsonDecode(response.body));
  }

}