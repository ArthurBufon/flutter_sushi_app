import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Returns list with all items inside cart.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = cart.items[index];

                    return ListTile(
                      title: Text('${item.description} (${item.quantity})'),
                    );
                  },
                ),
              );
              // return Text(cart.items.length.toString());
            },
          ),
        ],
      ),
    );
  }
}
