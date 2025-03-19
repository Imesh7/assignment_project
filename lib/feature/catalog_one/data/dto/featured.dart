

class Featured {
  final String title;
  final String? price;
  final String? image;

  Featured({
    required this.title,
    this.price,
    this.image,
  });

  factory Featured.fromMap(Map<String, dynamic> json) => Featured(
      title: json["title"], price: json["price"], image: json["image"]);

  Map<String, dynamic> toMap() => {
        "title": title,
        "price": price,
        "image": image,
      };
}
