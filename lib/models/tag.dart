class Tag {

  final String name;

  Tag(this.name);

  factory Tag.fromJson(Map<String, dynamic> json){
    return Tag(json['name']);
  }
}