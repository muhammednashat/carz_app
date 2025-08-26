import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  const ItemRow({
    super.key,
    required this.imageName,
    required this.label,
    required this.value,
  });

  final String imageName;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: Column(
          children: [
            Image.asset(imageName, height: 25.0, width: 25.0),
            Text(label),
            Text(value),
          ],
        ),
      ),
    );
  }
}
