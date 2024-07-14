class Product {
  final String title;
  final String description;
  final String thumbnail;
  final double price;
  final double rating;

  Product({
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
    );
  }
}
