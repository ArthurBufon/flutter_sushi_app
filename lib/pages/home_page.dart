import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 132, 51, 41),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // App name.
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0),
            child: Text(
              'NAKAZAWA',
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Image
          Center(
            child: SizedBox(
              height: 250,
              child: Image.asset('lib/images/sashimi.png'),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0),
            child: Text(
              'THE REAL TASTE OF SUSHI',
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),

          // Description
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Unroll the Flavor, Savor the Art: Nakazawa Sushi Delights!',
              style: GoogleFonts.oswald(
                color: Colors.grey[300],
                fontSize: 18,
              ),
            ),
          ),

          // Button
          MyButton(
            text: 'Get Started',
            onTap: () {
              // Navigates to menu.
              Navigator.pushNamed(context, '/menupage');
            },
          ),
        ],
      ),
    );
  }
}
