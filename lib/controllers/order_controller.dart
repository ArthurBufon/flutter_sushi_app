import 'package:flutter_sushi_app/repositories/order_repository.dart';

class OrderController {

  // Repository.
  final repository = OrderRepository();

  // Stores order in database.
  Future<String> store(Map<String, dynamic> orderData) async{
    return await repository.insert(orderData);
  }

  // Stores order in database.
  Future<Map<String, dynamic>> getById(String orderId) async{
    return await repository.getById(orderId);
  }
}
