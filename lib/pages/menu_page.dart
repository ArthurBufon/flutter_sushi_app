import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/components/button.dart';
import 'package:flutter_sushi_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
          const SizedBox(height: 15),

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

          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              decoration: InputDecoration(
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

          // Title food menu
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 32),
                child: Text(
                  'Food Menu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 100, 100, 100),
                  ),
                ),
              ),
            ],
          ),

          // Listview Food Menu
          Expanded(
            child: SizedBox(
              height: 25,
              child: ListView(
                padding: const EdgeInsets.all(9.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
