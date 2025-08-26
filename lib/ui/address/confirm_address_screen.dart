import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmAddressScreen extends StatefulWidget {
  const ConfirmAddressScreen({super.key});

  @override
  State<ConfirmAddressScreen> createState() => _ConfirmAddressScreenState();
}

class _ConfirmAddressScreenState extends State<ConfirmAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Address')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ItemAddress();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add_location_alt_outlined),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            CustomElevatedButton(onPressed: () {
              context.push(Routes.paymentMethodScreen);
            }, text: 'Confirm Address'),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

enum Address { Home, Work }

class ItemAddress extends StatelessWidget {
  const ItemAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                getImagePath('car.png'),
                height: 100.0,
                width: 100.0,
              ),
            ),
            title: Text('Home'),
            subtitle: Text(
              "dfasd fsd fsd fsdaf afasd afsda afsd afsd afdd af af dfasd af ",
            ),
            trailing: Radio<Address>(
              value: Address.Home,
              groupValue: Address.Home,
              onChanged: null,
            ),
          ),
        ),
      ),
    );
  }
}
