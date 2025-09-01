import 'package:carz_app/ui/core/theme/app_theme.dart';
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
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
          child: Column(
            children: [
              Image.asset(imageName, height: 25.0, width: 25.0),
              SizedBox(height: 12.0),
              Text(label),
              SizedBox(height: 4.0),

              Text(value, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
