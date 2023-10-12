import 'package:flutter_sushi_app/repositories/order_repository.dart';

class OrderController {

  // Repository.
  final repository = OrderRepository();

  // Stores order in database.
  void store(Map<String, dynamic> orderData, orderItems) {
    repository.insert(orderData, orderItems);
  }
}
