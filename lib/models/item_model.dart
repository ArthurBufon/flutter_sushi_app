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
}
