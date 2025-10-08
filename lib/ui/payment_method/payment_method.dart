import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/config/dependecy/notifire_provider.dart';
import 'package:carz_app/config/dependecy/query_mutation_provider.dart';
import 'package:carz_app/data/models/card_payment_model.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/ui/payment_method/widgets/item_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodScreen extends ConsumerStatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  ConsumerState<PaymentMethodScreen> createState() =>
      _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends ConsumerState<PaymentMethodScreen> {
  int _selectedItem = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Method')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saved Cards',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: cards.length,
            //     itemBuilder: (context, index) {
            //       return ItemPayment(
            //         card: cards[index],
            //         onTapp: _onPaymentTapped,
            //         index: index,
            //         isSelected: _selectedItem == index,
            //       );
            //     },
            //   ),
            // ),
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

  _onPaymentTapped(int index) {
    print("+onPaymentTapped");
    setState(() {
      _selectedItem = index;
    });
  }

  _onPressed() async {
    print("_onPressed");
    final model = ref.read(bookingModelProvider);
    print(model.toString());

    final provier = await ref.read(bookCarProvide(model));

    setState(() {});
  }
}
