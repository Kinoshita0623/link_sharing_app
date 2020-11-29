typedef T ParseData<T>(Map<String, dynamic> json);

class PageData<T>{

  final int currentPage;
  final List<T> data;
  final String firstPageUrl;
  final int from;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final String prevPageUrl;
  final int to;

  PageData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to
  });

  factory PageData.fromJson(Map<String, dynamic> json, ParseData<T> dataParser){
    List<T> data = (json['data'] as List<Map<String, dynamic>>).map((e) => dataParser(e));
    PageData<T> page = PageData(
      currentPage: json['current_page'],
      data: data,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to']
    );
    return page;
  }
  

}