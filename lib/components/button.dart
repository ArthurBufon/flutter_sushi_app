import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25, bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 150,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(78, 245, 245, 245),
              borderRadius: BorderRadius.circular(35),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text.
                Text(
                  text,
                  style: GoogleFonts.oswald(
                    color: Colors.grey[300],
                    fontSize: 20,
                  ),
                ),
        
                // Icon.
                Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
