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
    List list = json['data'];

    List<T> data = list.map((j)=>dataParser(j)).toList();
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageData &&
          runtimeType == other.runtimeType &&
          currentPage == other.currentPage &&
          data == other.data &&
          firstPageUrl == other.firstPageUrl &&
          from == other.from &&
          nextPageUrl == other.nextPageUrl &&
          path == other.path &&
          perPage == other.perPage &&
          prevPageUrl == other.prevPageUrl &&
          to == other.to;

  @override
  int get hashCode =>
      currentPage.hashCode ^
      data.hashCode ^
      firstPageUrl.hashCode ^
      from.hashCode ^
      nextPageUrl.hashCode ^
      path.hashCode ^
      perPage.hashCode ^
      prevPageUrl.hashCode ^
      to.hashCode;

  @override
  String toString() {
    return 'PageData{currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to}';
  }
}