class Item {
  final String? id;
  final String name;
  final num? price;
  final bool? available;
  final String imgUrl;
  final num rating;

  Item({
    required this.id,
    required this.name,
    this.price,
    this.available,
    required this.imgUrl,
    required this.rating,
  });
}

class ItemVM {
  final String id;
  final String title;
  final String imgUrl;
  final String rating;

  ItemVM({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.rating,
  });
}
