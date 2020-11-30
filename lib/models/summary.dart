class Summary{

  final String url;
  final String title;
  final String imageUrl;
  final String description;

  Summary({
    this.url,
    this.title,
    this.imageUrl,
    this.description
  });

  Summary.fromJson(Map<String, dynamic> json):
      url = json['url'],
      title = json['title'],
      imageUrl = json['image'],
      description = json['description']
  ;

  @override
  String toString() {
    return 'Summary{url: $url, title: $title, imageUrl: $imageUrl, description: $description}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Summary &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          title == other.title &&
          imageUrl == other.imageUrl &&
          description == other.description;

  @override
  int get hashCode =>
      url.hashCode ^ title.hashCode ^ imageUrl.hashCode ^ description.hashCode;

/*Map<String, dynamic> toJson() => {
    'url': url,
    'title': title,
    'imageUrl': imageUrl,
    'description': description
  };*/
}