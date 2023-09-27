import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;

  const ActionButton({
    required this.onTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
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
