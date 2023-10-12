import 'package:flutter_sushi_app/repositories/order_repository_interface.dart';
import 'package:flutter_sushi_app/services/database_service.dart';

class OrderRepository implements IOrderRepository {

  // Database service.
  final service = DatabaseService();

  // Store order.
  @override
  Future<void> insert(Map<String, dynamic> orderData, orderItems) async {
    service.storeOrder(orderData, orderItems);
  }
}
