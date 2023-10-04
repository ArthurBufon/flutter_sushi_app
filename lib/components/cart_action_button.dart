import 'package:flutter/material.dart';

class CartActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback _onTap;

  const CartActionButton(
    this._onTap, {
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Primary Button Color.
    const buttonPrimaryColor = Color.fromARGB(255, 196, 196, 196);

    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 2,
            color: buttonPrimaryColor,
          ),
        ),
        child: Icon(
          icon,
          color: buttonPrimaryColor,
        ),
      ),
    );
  }
}
