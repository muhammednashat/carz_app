import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/config/dependecy/reposotry_provider.dart';
import 'package:carz_app/data/models/user_model.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewCardScreen extends ConsumerStatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  ConsumerState<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends ConsumerState<AddNewCardScreen> {
  final _controllers = List.generate(4, (index) {
    return TextEditingController();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Card')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.0),
            Text("Card Number"),
            SizedBox(height: 4.0),
            TextFormField(
              controller: _controllers[0],
              decoration: InputDecoration(prefixIcon: Icon(Icons.credit_card)),
            ),
            SizedBox(height: 24.0),
            Text("Card Holder Name"),
            SizedBox(height: 4.0),
            TextFormField(
              controller: _controllers[1],
              decoration: InputDecoration(prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(height: 24.0),

            SizedBox(height: 24.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controllers[2],
                    decoration: InputDecoration(hintText: 'Expiry Date'),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    controller: _controllers[3],
                    decoration: InputDecoration(hintText: 'CVV'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 23.0),
            CustomElevatedButton(onPressed: _onPressed, text: 'Save'),
          ],
        ),
      ),
    );
  }

  _onPressed() async {
    print("iam here");
    final userBox = await ref.watch(userBoxProvider.future);
    final user = userBox.get(Constants.user) as UserModel;
    ref
        .watch(paymentMethodsRepoProvider)
        .addPaymentMethod(
          user.id,
          _controllers[1].text,
          _controllers[2].text,
          "12",
          "12",
          "visa",
        );
  }
}
