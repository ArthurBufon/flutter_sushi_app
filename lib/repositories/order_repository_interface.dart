abstract class IOrderRepository {
  Future<String> insert(Map<String, dynamic> cartData);
  Future<Map<String, dynamic>> getById(String orderId);
}