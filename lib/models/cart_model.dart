import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/models/item_model.dart';

class CartModel extends ChangeNotifier {
  // List of items inside the Cart
  final List<Item> itemsList = [];

  // Gets all items from the Cart.
  UnmodifiableListView<Item> get items => UnmodifiableListView(itemsList);

  // Adds new item to the Cart.
  void add(Item item) {
    itemsList.add(item);
  }

  // Removes item from the Cart.
  void remove(Item item) {
    itemsList.remove(item);
  }
}
