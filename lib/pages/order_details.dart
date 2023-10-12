import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/controllers/order_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetails extends StatefulWidget {
  final String orderId;

  const OrderDetails(this.orderId, {super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  // Injecting controller.
  final OrderController orderController = OrderController();

  // Firebase instance.
  var db = FirebaseFirestore.instance;

  // Inicializando order.
  late Future<Map<String, dynamic>> future;

  // Retorna lista com todos os alunos.
  Future<Map<String, dynamic>> getOrderById() async {
    return await orderController.getById(widget.orderId);
  }

  @override
  void initState() {
    super.initState();
    future = getOrderById();
  }

  // Returns list with all items inside cart.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'NAKAZAWA',
            style: GoogleFonts.oswald(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Page title
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Order Details',
                    style: GoogleFonts.dmSerifDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),

            // Order details
            FutureBuilder<Map<String, dynamic>>(
                future: future,
                builder:
                    (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  // Order not found.
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  // Stores snapshot in variable.
                  var orderData = snapshot.data!;

                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total price: \$ ${orderData['price'].toStringAsFixed(2)}',
                                  style: GoogleFonts.dmSerifDisplay(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Items title
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Items',
                              style: GoogleFonts.dmSerifDisplay(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Items
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView.builder(
                          itemCount: orderData['items'].length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = orderData['items'][index];

                            // Item
                            return Padding(
                              padding: const EdgeInsets.all(12),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Food description
                                    Text(
                                      '${item['description']} (${item['quantity']})',
                                      style: GoogleFonts.dmSerifDisplay(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),

                                    // Food price
                                    Text(
                                      '\$ ${(item['price'] * item['quantity']).toStringAsFixed(2)}',
                                      style: GoogleFonts.dmSerifDisplay(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
