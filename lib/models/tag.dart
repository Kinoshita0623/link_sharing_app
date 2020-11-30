class Tag {

  final String name;

  Tag(this.name);

  factory Tag.fromJson(Map<String, dynamic> json){
    return Tag(json['name']);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tag && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'Tag{name: $name}';
  }
}