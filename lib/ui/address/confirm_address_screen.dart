import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/data/models/address_model.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final addresses = [
  AddressModel(
    name: 'Home',
    address: '12 Tahrir Street, Downtown, Cairo, Egypt',
    imageName: 'location1.jpeg',
  ),
  AddressModel(
    name: 'Office 1',
    address: '45 Nile Corniche, Garden City, Cairo, Egypt',
    imageName: 'location2.jpeg',
  ),
  AddressModel(
    name: 'Office 2',
    address: '78 Ramses Road, Abbassia, Cairo, Egypt',
    imageName: 'location3.jpeg',
  ),
];

class ConfirmAddressScreen extends ConsumerStatefulWidget {
  const ConfirmAddressScreen({super.key});

  @override
  ConsumerState<ConfirmAddressScreen> createState() =>
      _ConfirmAddressScreenState();
}

class _ConfirmAddressScreenState extends ConsumerState<ConfirmAddressScreen> {
  int _selectedItem = -1;

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
                  return ItemAddress(
                    address: addresses[index],
                    index: index,
                    isSelected: _selectedItem == index,
                    onTapp: _onAddressTapped,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    // context.push(Routes.mapScreen);
                  },
                  child: Icon(Icons.add_location_alt_outlined),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            CustomElevatedButton(
              onPressed: _onPressed,
              text: 'Confirm Address',
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  _onAddressTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  _onPressed() {
    context.push(Routes.paymentMethodScreen);
  }
}

class ItemAddress extends ConsumerStatefulWidget {
  const ItemAddress({
    super.key,
    required this.address,
    required this.index,
    required this.onTapp,
    required this.isSelected,
  });
  final bool isSelected;
  final AddressModel address;
  final int index;
  final void Function(int) onTapp;

  @override
  ConsumerState<ItemAddress> createState() => _ItemAddressState();
}

class _ItemAddressState extends ConsumerState<ItemAddress> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          ref
              .read(bookingModelProvider.notifier)
              .setAddress(widget.address.address);
          widget.onTapp(widget.index);
        },
        child: Card(
          color: (widget.isSelected) ? AppTheme.accent : Colors.amber,
          child: Container(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  getImagePath(widget.address.imageName),
                  height: 100.0,
                  width: 90.0,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                widget.address.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(widget.address.address),
            ),
          ),
        ),
      ),
    );
  }
}
