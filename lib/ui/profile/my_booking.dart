import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/config/dependecy/query_mutation_provider.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyBookingScreen extends ConsumerStatefulWidget {
  const MyBookingScreen({super.key});

  @override
  ConsumerState<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends ConsumerState<MyBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final booking = ref.watch(userBookingProvider("31"));

    return Scaffold(
      appBar: AppBar(title: Text('My Booking')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 32.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 32.0),
            ItemBooking(),
            ItemBooking(),
            ItemBooking(),
            ItemBooking(),
            ItemBooking(),
            ItemBooking(),
         
          ],
        ),
      ),
    );
  }
}

class ItemBooking extends StatelessWidget {
  const ItemBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      leading: ClipRRect(
        child: Image.asset(getImagePath('user.png'), height: 70.0, width: 70.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: Text('Car apa', style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text('19/2/1000 - 10:00 AM'),
    );
  }
}
