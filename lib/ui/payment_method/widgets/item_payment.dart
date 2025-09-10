import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/config/dependecy/notifire_provider.dart';
import 'package:carz_app/data/models/card_payment_model.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemPayment extends ConsumerStatefulWidget {
  const ItemPayment({super.key, required this.card, required this.onTapp, required this.index, required this.isSelected,});

  final CardPaymentModel card;
  final void Function(int) onTapp;
  final int index;
  final bool isSelected; 

  @override
  ConsumerState<ItemPayment> createState() => _ItemPaymentState();
}

class _ItemPaymentState extends ConsumerState<ItemPayment> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("onTapped");
        ref.read(bookingModelProvider.notifier).setCardNumber(widget.card.numberCard);
        widget.onTapp(widget.index);
      },
      child: Card(
        color: (widget.isSelected) ? AppTheme.accent : Colors.amberAccent,
        child: ListTile(
          title: Text(widget.card.numberCard, style:Theme.of(context).textTheme.titleMedium),
          subtitle: Text(widget.card.holderName),
          trailing: Image.asset(
            getIconPath(widget.card.imageName),
            height: 35.0,
            width: 35.0,
          ),
        ),
      ),
    );
  }
}
