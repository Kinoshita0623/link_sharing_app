import 'package:flutter/cupertino.dart';
import 'package:linksharingapp/models/note.dart';
import 'package:linksharingapp/models/user.dart';

class Favorite{
  final int id;
  final Note note;
  final User user;
  final DateTime createdAt;
  final DateTime updatedAt;
  Favorite({
    @required this.id,
    @required this.note,
    @required this.user,
    @required this.createdAt,
    @required this.updatedAt
  });

  factory Favorite.fromJson(Map<String, dynamic> json){
    return Favorite(
      id: json['id'],
      note: Note.fromJson(json['note']),
      user: User.fromJson(json['user']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at'])

    );
  }
}