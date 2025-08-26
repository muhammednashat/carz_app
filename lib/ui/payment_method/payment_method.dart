import 'package:carz_app/ui/payment_method/widgets/item_payment.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Method')),
      body: Column(children: [
        SizedBox(height: 32.0,),
        Row(
          children: [
           Text('Saved Cards')
          ],
        ),
        SizedBox(height: 32.0,),
        
        ItemPayment()]),
    );
  }
}
