import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/components/button.dart';
import 'package:flutter_sushi_app/models/item_model.dart';
import 'package:flutter_sushi_app/pages/food_details.dart';
import 'package:flutter_sushi_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // List of items.
  final List<Item> itemsList = <Item>[
    Item(
        image: 'lib/images/sake_nigiri.png',
        description: 'Sake Nigiri',
        price: 16.50,
        rating: 7.5),
    Item(
        image: 'lib/images/sashimi.png',
        description: 'Sashimi',
        price: 10.70,
        rating: 9.1),
    Item(
        image: 'lib/images/surimi_nigiri.png',
        description: 'Surimi Nigiri',
        price: 23.00,
        rating: 8.3),
    Item(
        image: 'lib/images/rolls.png',
        description: 'Rolls',
        price: 32.50,
        rating: 9.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu),
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
      body: Column(
        children: [
          // Redeem promo.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 25),
                                Text(
                                  'Get 24% promo',
                                  style: GoogleFonts.sourceSerif4(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            MyButton(text: 'Redeem', onTap: () {})
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Center(
                            child: SizedBox(
                              width: 130,
                              child: Image.asset('lib/images/rolls.png'),
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

          const SizedBox(height: 20),

          // Search here.
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Title food menu
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  'Food Menu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),

          // Listview Food Menu
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 10),
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: itemsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigates to menu.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FoodDetails(item: itemsList[index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 25, top: 25, right: 25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image.
                              Center(
                                child: SizedBox(
                                  width: 130,
                                  child: Image.asset(itemsList[index].image),
                                ),
                              ),
            
                              const SizedBox(height: 15),
            
                              // Description.
                              Text(
                                itemsList[index].description,
                                style: GoogleFonts.dmSerifDisplay(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
            
                              const SizedBox(height: 15),
            
                              // Price and rating.
                              Row(
                                children: [
                                  Text(
                                    "\$ ${itemsList[index].price}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  const SizedBox(width: 70),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.yellow[700],
                                  ),
                                  Text(
                                    itemsList[index].rating.toString(),
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: SizedBox(
              height: 120,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Image.
                    SizedBox(
                      child: Image.asset('lib/images/surimi_nigiri.png'),
                    ),

                    const SizedBox(width: 20),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Surimi Nigiri',
                          style: GoogleFonts.dmSerifDisplay(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "\$ 23.00",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 120),

                    // Fav Icon.
                    const Icon(Icons.favorite_border, size: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
