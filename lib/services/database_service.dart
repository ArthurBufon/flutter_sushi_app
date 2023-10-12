import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // ignore: unused_field
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Store order.
  storeOrder(Map<String, dynamic> orderData, orderItems) async {
    print(orderData['items'].runtimeType);
    await _db.collection("orders").add(orderData).then((documentSnapshot) {
      print(documentSnapshot.id);
      // storeOrderItems(documentSnapshot.id, orderItems);
    });
  }

  // Store Order Items
  storeOrderItems(String orderDoc, Map<String, dynamic> orderItems) {

    print(orderItems.runtimeType);

      print(orderItems);

    for (var item in orderItems.values) {

      print(item);

      // _db
      //     .collection("orders")
      //     .doc(orderDoc)
      //     .collection("items")
      //     .add(itemJson);
    }
  }
}
