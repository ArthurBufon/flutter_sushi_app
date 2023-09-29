import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/models/item_model.dart';

class CartModel extends ChangeNotifier {
  // Items of the Cart
  final List<Item> _items = [];

  // Gets unmodifiable list of all items in the Cart.
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // Adds new item to the Cart.
  void add(Item item, int quantity) {
    // If item already exists.
    if (_items.contains(item)) {
      item.quantity += quantity;
    }
    // Item does not exist.
    else {
      // Sets quantity.
      item.quantity = quantity;

      // Adds Item.
      _items.add(item);
    }

    // Notifying that CartModel changed.
    notifyListeners();
  }

  // Removes item from the Cart.
  void remove(Item item) {
    _items.remove(item);

    // Notifying that CartModel changed.
    notifyListeners();
  }
}
