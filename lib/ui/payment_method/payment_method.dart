import 'package:carz_app/config/dependeces.dart';
import 'package:carz_app/data/models/booking_car_model.dart';
import 'package:carz_app/data/models/card_payment_model.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/ui/payment_method/widgets/item_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final cards = [
  CardPaymentModel(
    holderName: 'Mohammed Nashat',
    numberCard: '1234 1452 8566 9854',
    imageName: 'visa_card.png',
  ),
  CardPaymentModel(
    holderName: 'Nashat Mohammed',
    numberCard: '1234 1452 1234 1452',
    imageName: 'master_card.png',
  ),
  CardPaymentModel(
    holderName: 'Ahmed Jaber',
    numberCard: '9854 1452 8566 9854',
    imageName: 'master_card.png',
  ),
];

class PaymentMethodScreen extends ConsumerStatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  ConsumerState<PaymentMethodScreen> createState() =>
      _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends ConsumerState<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Method')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Saved Cards'),
                TextButton(onPressed: () {}, child: Text('Edit')),
              ],
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return ItemPayment(card: cards[index]);
                },
              ),
            ),

            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.push(Routes.addNewCard);
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 18.0),

            CustomElevatedButton(onPressed: _onPressed, text: 'Pay Now'),
            SizedBox(height: 18.0),
          ],
        ),
      ),
    );
  }

  _onPressed() async {
    final model = BookingCarModel(
      cardNumber: "cardNumber",
      address: "address",
      car: "car",
      userId: "31",
    );
    final provier = await ref.watch(bookingRepoProvider);
    final res = await provier.bookCar(model);
    setState(() {
      
    });
  }
}
