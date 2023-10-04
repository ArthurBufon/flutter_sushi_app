import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/components/cart_action_button.dart';
import 'package:flutter_sushi_app/models/cart_model.dart';
import 'package:flutter_sushi_app/models/item_model.dart';
import 'package:flutter_sushi_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Updates item quantity
  updateItemQuantity(BuildContext context, Item item, int itemQuantity) {
    // Gets the cart.
    var cartModel = context.read<CartModel>();

    // Adds the item.
    cartModel.updateItemQuantity(item, itemQuantity);
    print('Added successfully!');
  }

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
              // Cart is empty.
              if (cart.items.isEmpty) {
                return Center(
                  child: Text(
                    'Consider adding items to your order :)',
                    style: GoogleFonts.oswald(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                );
              }

              // List of items.
              return Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView.builder(
                        itemCount: cart.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = cart.items[index];

                          // Item
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Image
                                  SizedBox(
                                    width: 120,
                                    child: Image.asset(item.image),
                                  ),

                                  Column(
                                    children: [
                                      // Food description
                                      Text(
                                        item.description,
                                        style: GoogleFonts.dmSerifDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      // Food price
                                      Text(
                                        '\$ ${(item.price * item.quantity).toStringAsFixed(2)}',
                                        style: GoogleFonts.dmSerifDisplay(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),

                                  FittedBox(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            // CartActionButton item.
                                            CartActionButton(
                                              () {
                                                // Impede usuário de colocar quantidade negativa.
                                                if (item.quantity - 1 < 0) {
                                                  return;
                                                }
                                                // Diminui quantidade.
                                                else {
                                                  updateItemQuantity(context,
                                                      item, item.quantity - 1);
                                                }
                                              },
                                              icon: Icons.remove,
                                            ),

                                            // ItemQuantity
                                            SizedBox(
                                              width: 35,
                                              child: Center(
                                                child: Text(
                                                  item.quantity.toString(),
                                                  style: GoogleFonts
                                                      .dmSerifDisplay(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            // Add item.
                                            CartActionButton(
                                              () => updateItemQuantity(context,
                                                  item, item.quantity + 1),
                                              icon: Icons.add,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Manage item.
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Total Price
                                Text(
                                  'Total Price:',
                                  style: GoogleFonts.dmSerifDisplay(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 2,
                                  ),
                                ),

                                // $
                                Text(
                                  '\$ ${cart.totalPrice.toStringAsFixed(2)}',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ],
                            ),

                            const SizedBox(height: 40),

                            // Checkout
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, top: 20, right: 25, bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              78, 245, 245, 245),
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        padding: const EdgeInsets.all(20),
                                        child: // Text.
                                            Center(
                                          child: Text(
                                            'Checkout',
                                            style: GoogleFonts.oswald(
                                              color: Colors.grey[300],
                                              fontSize: 20,
                                              letterSpacing: 1.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
