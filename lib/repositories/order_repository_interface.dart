import 'package:flutter_sushi_app/models/cart_model.dart';

abstract class IOrderRepository {
  Future<void> insert(Map<String, dynamic> cartData, orderData);
}