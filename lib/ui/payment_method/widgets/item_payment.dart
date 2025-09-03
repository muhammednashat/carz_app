import 'package:carz_app/data/models/card_payment_model.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';

class ItemPayment extends StatelessWidget {
  const ItemPayment({super.key, required this.card, required this.onTapp, required this.index, required this.isSelected,});

  final CardPaymentModel card;
  final void Function(int) onTapp;
  final int index;
  final bool isSelected; 

  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.accent,
      child: ListTile(
        title: Text(card.numberCard),
        subtitle: Text(card.holderName),
        trailing: Image.asset(
          getIconPath(card.imageName),
          height: 35.0,
          width: 35.0,
        ),
      ),
    );
  }
}
