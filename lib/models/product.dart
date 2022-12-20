// ignore_for_file: non_constant_identifier_names

class Product {
  final String id;
  final String category_id;
  final String name;
  final String description;
  final String image_url;
  final double price;
  final String unit;
  final int stock;
  final int unit_quantity;
  Product({
    required this.id,
    required this.category_id,
    required this.name,
    required this.description,
    required this.image_url,
    required this.price,
    required this.unit,
    required this.stock,
    required this.unit_quantity,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'category_id': category_id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'image_url': image_url});
    result.addAll({'price': price});
    result.addAll({'unit': unit});
    result.addAll({'stock': stock});
    result.addAll({'unit_quantity': unit_quantity});

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      category_id: map['category_id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image_url: map['image_url'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      unit: map['unit'] ?? '',
      stock: map['stock']?.toInt() ?? 0,
      unit_quantity: map['unit_quantity']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, category_id: $category_id, name: $name, description: $description, image_url: $image_url, price: $price, unit: $unit, stock: $stock, unit_quantity: $unit_quantity)';
  }
}
