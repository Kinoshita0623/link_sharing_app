import 'package:flutter/cupertino.dart';
import 'package:linksharingapp/models/note.dart';
import 'package:linksharingapp/models/user.dart';
import 'package:linksharingapp/models/favorite.dart';

class Notification{

  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User publisher;


  Notification({
    @required this.id,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.publisher,


  });

  factory Notification.fromJson(Map<String, dynamic> json){
    if(json['type'] == 'follow'){
      return FollowNotification.fromJson(json);
    }else if(json['type'] == 'favorite'){
      return FavoriteNotification.fromJson(json);
    }else if(json['type'] == 'comment'){
      return CommentNotification.fromJson(json);
    }
    return Notification(
        id: json['id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        publisher: User.fromJson(json['publisher'])
    );
  }
}

class FavoriteNotification extends Notification{

  final Favorite favorite;

  FavoriteNotification({
    @required int id,
    @required DateTime createdAt,
    @required DateTime updatedAt,
    @required User publisher,
    @required this.favorite
  }) : super(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    publisher: publisher
  );

  factory FavoriteNotification.fromJson(Map<String, dynamic> json){
    return FavoriteNotification(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      publisher: User.fromJson(json['publisher']),
      favorite: Favorite.fromJson(json['favorite'])
    );
  }
}

class FollowNotification extends Notification{
  FollowNotification({
    @required int id,
    @required DateTime createdAt,
    @required DateTime updatedAt,
    @required User publisher
  }) : super(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      publisher: publisher
  );

  factory FollowNotification.fromJson(Map<String, dynamic> json){
    return FollowNotification(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        publisher: User.fromJson(json['publisher'])
    );
  }
}

class CommentNotification extends Notification{
  CommentNotification({
    @required int id,
    @required DateTime createdAt,
    @required DateTime updatedAt,
    @required User publisher
  }) : super(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      publisher: publisher
  );

  factory CommentNotification.fromJson(Map<String, dynamic> json){
    return CommentNotification(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        publisher: User.fromJson(json['publisher'])
    );
  }
}