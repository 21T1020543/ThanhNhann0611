class MyProduct {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  MyProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  factory MyProduct.fromJson(Map<String, dynamic> json) {
    return MyProduct(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(), // Đảm bảo chuyển đổi sang double
      count: json['count'] as int, // Kiểu int đã đúng
    );
  }
}
