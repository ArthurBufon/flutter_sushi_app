import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/models/item_model.dart';

class CartModel extends ChangeNotifier {
  // Items of the Cart
  final List<Item> _items = [];

  // Gets unmodifiable list of all items in the Cart.
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // The current total price of all items.
  double get totalPrice => items.fold(
      0, (total, current) => total + current.price * current.quantity);

  // Turns order into json.
  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = totalPrice;
    data['items'] = _items.map((e) => e.toJson()).toList();
    return data;
  }

  // Turns order items into json.
  Map<String, dynamic> itemsToJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = jsonEncode(_items.map((e) => e.toJson()).toList());
    return data;
  }

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

  // Adds new item to the Cart.
  void updateItemQuantity(Item item, int quantity) {
    // Updates the quantity.
    item.quantity = quantity;

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
