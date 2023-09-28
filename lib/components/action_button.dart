import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback _onTap;

  const ActionButton(
    this._onTap, {
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(71, 250, 250, 250),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
