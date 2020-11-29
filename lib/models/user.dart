
class User {
  final int id;
  final String email;
  final String userName;
  final String avatarUrl;
  final bool isFollower;
  final bool isFollowing;
  final int favoritedNotesCount;
  final int followersCount;
  final int followingsCount;
  final int notesCount;

  User({
    this.id,
    this.email,
    this.userName,
    this.avatarUrl,
    this.isFollower,
    this.isFollowing,
    this.favoritedNotesCount,
    this.followersCount,
    this.followingsCount,
    this.notesCount
  });

  factory User.fromJson(Map<String, dynamic> json){
    if(json == null || json.isEmpty){
      return null;
    }

    return User(
      id: json['id'],
      email: json['email'],
      userName: json['user_name'],
      avatarUrl: json['avatar_url'],
      isFollower: json['is_follower'],
      isFollowing: json['is_following'],
      favoritedNotesCount: json['favorited_notes_count'],
      followersCount: json['followers_count'],
      followingsCount: json['followings_count'],
      notesCount: json['notes_count']
    );
  }



  /*Map<String, dynamic> toJson() =>
      {
        'id': this.id,
        'email': this.email,
        'user_name': this.userName,
        'is_follower': this.isFollower,
        'is_following': this.isFollowing,
        'favorited_notes_count': this.favoritedNotesCount,
        'followers_count': this.followersCount,
        'followings_count': this.followingsCount,
        'notes_count': this.notesCount,
        'avatar_url': this.avatarUrl
      };*/
}