import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/components/action_button.dart';
import 'package:flutter_sushi_app/components/button.dart';
import 'package:flutter_sushi_app/models/cart_model.dart';
import 'package:flutter_sushi_app/models/item_model.dart';
import 'package:flutter_sushi_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodDetails extends StatefulWidget {
  final Item item;

  const FoodDetails({
    super.key,
    required this.item,
  });

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {

  // Initializing item quantity.
  int itemQuantity = 0;

  // Increments item quantity.
  void incrementQuantity() {
    setState(() {
      itemQuantity += 1;
    });
  }

  // Decrements item quantity.
  void decrementQuantity() {
    setState(() {
      // If quantity >= 1, increments counter.
      if (itemQuantity >= 1) {
        itemQuantity -= 1;
      }
      // If quantity = 0, returns null.
      else {
        return;
      }
    });
  }

  // Adds item to cart.
  addItemToCart(BuildContext context, Item item) {
    var cartModel = context.read<CartModel>();
    cartModel.add(item);

    // cartController.add(item);
    // Navigates to cart page.
    Navigator.pushNamed(context, '/cart');
    print('Added successfully!');
  }

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
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Food image.
                Center(
                  child: SizedBox(
                    width: 180,
                    child: Image.asset(widget.item.image),
                  ),
                ),

                const SizedBox(height: 25),

                // Food rating.
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.yellow[700],
                    ),
                    Text(
                      widget.item.rating.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Food Name.
                Text(
                  widget.item.description,
                  style: GoogleFonts.dmSerifDisplay(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),

                const SizedBox(height: 15),

                // Food description.
                Text(
                  'Description',
                  style: GoogleFonts.dmSerifDisplay(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Sushi is a beloved and iconic Japanese culinary creation that has captivated palates worldwide. At its heart, sushi is a delicate and artful fusion of vinegared rice, meticulously selected seafood, and a medley of fresh ingredients, all expertly crafted into bite-sized, visually stunning morsels. Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum.',
                  style: GoogleFonts.openSans(
                      fontSize: 15, color: Colors.grey[600], height: 2),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Manage item.
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              height: 100,
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
                    children: [
                      Text(
                        "\$ ${widget.item.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 270),

                      // Remove item.
                      ActionButton(
                        () => decrementQuantity(),
                        icon: Icons.remove,
                      ),

                      // ItemQuantity
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                        ),
                        child: Text(
                          itemQuantity.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // Add item.
                      ActionButton(
                        () => incrementQuantity(),
                        icon: Icons.add,
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Add to cart.
                  MyButton(
                    text: 'Add to Cart',
                    // Adds item to cart.
                    onTap: () {
                      addItemToCart(context, widget.item);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
