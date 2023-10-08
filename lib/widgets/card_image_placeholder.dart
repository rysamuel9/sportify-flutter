import 'package:flutter/material.dart';

class CardImagePlaceholder extends StatelessWidget {
  const CardImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.credit_card,
          size: 60,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
