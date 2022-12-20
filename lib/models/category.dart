class Category {
  final String id;
  final String name;
  Category({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  @override
  String toString() => 'Category(id: $id, name: $name)';
}
