import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // ignore: unused_field
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Store order.
  Future<String> storeOrder(Map<String, dynamic> orderData) async {
    return await _db
        .collection("orders")
        .add(orderData)
        .then((documentSnapshot) {
      return documentSnapshot.id;
    });
  }

  // Gets order by id.
  Future<Map<String, dynamic>> getById(String orderId) async {
    // Reference to order document.
    final docRef = _db.collection("orders").doc(orderId);

    // Returns order data.
    return await docRef.get().then(
      (DocumentSnapshot doc) {
        // Converts snapshot to map.
        final orderData = doc.data() as Map<String, dynamic>;
        
        // Returns orderData.
        return orderData;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
