
import 'package:flutter/cupertino.dart';
import 'package:linksharingapp/models/summary.dart';
import 'package:linksharingapp/models/tag.dart';
import 'package:linksharingapp/models/user.dart';

class Note{

  final Summary summary;
  final User author;
  final String text;
  final List<Tag> tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  Note({@required this.summary, @required this.author, @required this.text, this.tags, this.createdAt, this.updatedAt});


  factory Note.fromJson(Map<String, dynamic> json){
    if(json == null || json.isEmpty){
      return null;
    }
    List<dynamic> tagsJson = json['tags'];
    List<Tag> tags = tagsJson.map((tag) => Tag.fromJson(tag));
    final createdAt = DateTime.parse(json['created_at']);
    final updatedAt = DateTime.parse(json['updated_at']);
    return Note(
      summary: Summary.fromJson(json['summary']),
      author: User.fromJson(json['author']),
      text: json['text'],
      tags: tags,
      createdAt: createdAt,
      updatedAt: updatedAt

    );
  }

  /*Map<String, dynamic> toJson()=>{
    'summary': summary
  };*/
}