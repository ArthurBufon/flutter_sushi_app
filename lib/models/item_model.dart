class Item {
  // Attributes of Item.
  String image;
  String description;
  double price;
  double rating;
  int quantity;

  // Constructor of Item.
  Item({
    this.quantity = 1,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
  });

  // Turns item into json.
  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = description;
    data['price'] = price;
    data['rating'] = rating;
    data['quantity'] = quantity;
    return data;
  }
}
