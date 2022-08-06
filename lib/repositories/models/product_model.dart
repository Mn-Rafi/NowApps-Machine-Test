class Product {
  final int? id;
  final String? name;
  final String price;
  final String image;
  final String quantity;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
  });

  static Product fromMap(Map<String, Object?> mapFromDB) {
    final int id = mapFromDB['id'] as int;
    final String name = mapFromDB['name'] as String;
    final String price = mapFromDB['price'] as String;
    final String image = mapFromDB['image'] as String;
    final String quantity = mapFromDB['quantity'] as String;

    return Product(
        id: id, name: name, price: price, image: image, quantity: quantity);
  }
}
