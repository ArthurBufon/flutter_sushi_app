import 'package:flutter_sushi_app/repositories/order_repository_interface.dart';
import 'package:flutter_sushi_app/services/database_service.dart';

class OrderRepository implements IOrderRepository {

  // Database service.
  final service = DatabaseService();

  // Store order.
  @override
  Future<String> insert(Map<String, dynamic> orderData) async {
    return await service.storeOrder(orderData);
  }

  // Gets order by id.
  @override
  Future<Map<String, dynamic>> getById(String orderId) async {
    return await service.getById(orderId);
  }
}
