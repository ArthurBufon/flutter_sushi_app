import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartItemsPage extends StatefulWidget {
  const CartItemsPage({super.key});

  @override
  State<CartItemsPage> createState() => _CartItemsPageState();
}

class _CartItemsPageState extends State<CartItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Text('Total price: ${cart.items}');
      },
    );
  }
}
