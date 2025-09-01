import 'package:flutter/material.dart';

class ItemFeature extends StatelessWidget {
  const ItemFeature({
    super.key,
    required this.title,
    required this.iconLeading,
    required this.trailingText,
  });
  final IconData iconLeading;
  final String title;
  final String trailingText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconLeading),
      title: Text(title),
      trailing: Text(
        trailingText,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
