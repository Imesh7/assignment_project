class Attraction {
  final String title;
  final String? price;
  final String? image;
  final int? beds;
  final int? bathRooms;
  final double? stars;
  final int? reviews;

  Attraction(
      {required this.title,
      this.price,
      this.image,
      this.stars,
      this.reviews,
      this.bathRooms,
      this.beds});

  factory Attraction.fromMap(Map<String, dynamic> json) => Attraction(
        title: json["title"],
        price: json["price"],
        image: json["image"],
        stars: json["stars"],
        beds: json["beds"],
        bathRooms: json["bathrooms"],
        reviews: json["reviews"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "price": price,
        "image": image,
        "stars": stars,
        "reviews": reviews,
        "beds": beds,
        "bathrooms": bathRooms
      };
}
