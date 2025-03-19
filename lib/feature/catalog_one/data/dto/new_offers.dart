class NewOffers {
  final String title;
  final String? price;
  final String? image;
  final double? stars;
  final int? reviews;

  NewOffers({
    required this.title,
    this.price,
    this.image,
    this.stars,
    this.reviews,
  });

  factory NewOffers.fromMap(Map<String, dynamic> json) => NewOffers(
      title: json["title"],
      price: json["price"],
      image: json["image"],
      stars: json["stars"],
      reviews: json["reviews"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "price": price,
        "image": image,
        "stars": stars,
        "reviews": reviews,
      };
}
