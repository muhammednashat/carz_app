import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Card')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 32.0),
            TextFormField(decoration: InputDecoration(hintText: 'Card Number')),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(hintText: 'Card Holder Name'),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'Expiry Date'),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'CVV'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 23.0),

            CustomElevatedButton(onPressed: () {}, text: 'Save'),
          ],
        ),
      ),
    );
  }
}
