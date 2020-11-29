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

  /*Map<String, dynamic> toJson() => {
    'url': url,
    'title': title,
    'imageUrl': imageUrl,
    'description': description
  };*/
}