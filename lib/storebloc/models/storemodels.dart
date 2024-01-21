class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;

  const Product(
      {
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
    );
  }
}
