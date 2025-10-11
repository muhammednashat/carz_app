import 'package:carz_app/config/dependecy/notifire_provider.dart';
import 'package:carz_app/config/dependecy/query_mutation_provider.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/ui/core/ui/loading_indecator.dart';
import 'package:carz_app/ui/payment_method/widgets/item_payment.dart';
import 'package:carz_app/utils/util_funcs.dart';
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
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final userPayments = ref.watch(userPaymentsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Payment Method')),
      body: Stack(
        children: [
          Padding(
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
                Expanded(
                  child: switch (userPayments) {
                    AsyncData(:final value) when value.isEmpty => Center(
                      child: Text("You have not added any method!"),
                    ),

                    AsyncData(:final value) => ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return ItemPayment(
                          card: value[index],
                          onTap: _onPaymentTapped,
                          index: index,
                          isSelected: _selectedItem == index,
                        );
                      },
                    ),

                    AsyncError(:final error) => Center(
                      child: Text(error.toString()),
                    ),
                    _ => Center(child: CircularProgressIndicator()),
                  },
                ),

                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        context.push(Routes.addNewCard).then((value) {
                          ref.invalidate(userPaymentsProvider);
                        });
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

          if (_isLoading) LoadingIndicator(),
        ],
      ),
    );
  }

  _onPaymentTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  _onPressed() async {
    if (_selectedItem == -1) {
      showToast("Select a card that you want to use");
      return;
    }

    setState(() {
      print("loading");
      _isLoading = true;
    });
    final model = ref.read(bookingModelProvider);
    final provier = await ref.read(bookCarProvide(model));

    setState(() {
      print("not  sloading");

      _isLoading = false;

      context.push(Routes.successScreen);
    });
  }
}
