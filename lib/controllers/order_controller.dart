import 'package:flutter_sushi_app/models/cart_model.dart';
import 'package:flutter_sushi_app/repositories/order_repository.dart';

class OrderController {

  // Repository.
  final repository = OrderRepository();

  // Stores order in database.
  void store(CartModel cartData) {
    print(cartData);
    repository.insert(cartData);
  }
}
