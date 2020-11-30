

import 'package:flutter_test/flutter_test.dart';
import 'package:linksharingapp/api/user_api.dart';
import 'package:linksharingapp/models/user.dart';

void main(){

  UserAPI userAPI = UserAPI('http://homestead.test');

  String token = '13|jSAUmpNlJ5qUAOPhiiO6gAMiBEBtFWG7DDhNl9xI';

  test('ユーザー取得テスト', () async{
    User user = await userAPI.get(userId: 2, token: token);
    expect(user, isNotNull);
    expect(user.id, 2);
  });

  test('ユーザー取得＆フォロー＆アンフォロー', () async {
    User user = await userAPI.get(userId: 2, token: token);
    expect(user, isNotNull);
    expect(user.id, 2);
    Future toggleFollowOrUnfollow() async{
      if(user.isFollowing){
        user = await userAPI.unfollow(token: token, userId: 2);
        expect(user.isFollowing, false);
      }else{
        user = await userAPI.follow(token: token, userId: 2);
        expect(user.isFollowing, true);
      }
    }
    
    await toggleFollowOrUnfollow();

    await toggleFollowOrUnfollow();

    
  });

  test('フォロー取得', () async {
    final page = await userAPI.followings(userId: 1);
    expect(page.data, isNotEmpty);
  });

  test('フォロワー取得', () async {
    final page = await userAPI.followers(userId: 1);
    expect(page.data, isNotEmpty);
  });

  

}