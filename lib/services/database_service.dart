import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sushi_app/models/cart_model.dart';

class DatabaseService {
  // ignore: unused_field
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  storeOrder(CartModel cartData) async {
    await _db.collection("orders").add(cartData.toJson()).then(
        (documentSnapshot) =>
            print("Added Data with ID: ${documentSnapshot.id}"));
  }
}
