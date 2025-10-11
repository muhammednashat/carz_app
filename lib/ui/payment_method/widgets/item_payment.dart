import 'package:carz_app/config/dependecy/notifire_provider.dart';
import 'package:carz_app/data/models/card_payment_model.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/ui/payment_method/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemPayment extends ConsumerWidget {
  const ItemPayment({
    super.key,
    required this.card,
    required this.onTap,
    required this.index,
    required this.isSelected,
  });

  final CardPaymentModel card;
  final void Function(int) onTap;
  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconImage = getCardIcon(card.cardType);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        ref.read(bookingModelProvider.notifier).setCardNumber(card.last4Digits);
        onTap(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accent : Colors.grey.shade900,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppTheme.accent.withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(iconImage, height: 40, width: 40),
            const SizedBox(height: 18),
            Center(
              child: Text(
                "**** **** **** ${card.last4Digits}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CardInfo(label: 'Holder name', value: card.cardHolderName),
                _CardInfo(
                  label: 'Expiry',
                  value: "${card.expiryMonth}/${card.expiryYear}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CardInfo extends StatelessWidget {
  const _CardInfo({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
