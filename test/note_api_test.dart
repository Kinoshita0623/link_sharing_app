import 'package:flutter_test/flutter_test.dart';
import 'package:linksharingapp/api/note_api.dart';
import 'package:linksharingapp/api/page.dart';
import 'package:linksharingapp/models/note.dart';

void main(){

  NoteAPI api;
  setUp((){
    api = NoteAPI(baseUrl: 'http://homestead.test', token: '13|jSAUmpNlJ5qUAOPhiiO6gAMiBEBtFWG7DDhNl9xI');

  });

  test('タイムラインの取得テスト', () async{

    final page = await api.timeline();
    expect(page.data, isNotNull);


  });

  test('タイムラインのページネーションテスト', () async{
    int current = 0;
    PageData page;
    while(page == null || page.nextPageUrl != null){
      page = await api.timeline(page: current + 1);
      expect(page.currentPage, current + 1);
      print(page.currentPage);
      current = page.currentPage;
    }
  });

  /*test('認証エラーテスト', ()  {



    expect(()async => await noAuthAPI.timeline()
    ,  throwsA(AuthenticationException));
  });

   */

  test('タグ検索テスト', () async {
    PageData page = await api.timeline();
    final hasTagsNote = page.data.where((element) => element.tags != null && element.tags.length > 0);
    expect(hasTagsNote, isNotEmpty);
    final ho = hasTagsNote.map((element) async {
      List<String> conditions = element.tags.map((e)=>e.name.toString()).cast<String>().toList();
      print([conditions]);
      final res = await api.searchByTag([conditions]);
      expect(res.data, isNotNull);
      print(res.data);
    });
    for (var value in ho) {
      await value;
    }

  });

  test('投稿テスト＆削除', () async {
    Note res = await api.create(url: 'https://tech.mokelab.com/CrossPlatform/Flutter/http/post.html', text: 'create by Flutter Test');
    expect(res, isNotNull);
    print(res);

    final deleteResponse = await api.delete(res.id);
    expect(res.id, deleteResponse);
  });
}