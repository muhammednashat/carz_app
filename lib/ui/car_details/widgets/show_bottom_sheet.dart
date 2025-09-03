import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/car_details/widgets/time_picker.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> showModelBottomSheet(BuildContext context, WidgetRef ref) async {
  showModalBottomSheet(
    context: context,
    builder: (c) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.0),
              Text('Select Date'),
              SizedBox(height: 8.0),
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                onDateChanged: (date) {
                  updateDate(ref, date.toString());
                  print("Selected: ${DateTime.now().toString()}");
                },
              ),
              SizedBox(height: 8.0),
              Text('Select Time'),
              SizedBox(height: 8.0),
              TimePicker(),
              SizedBox(height: 32.0),
              CustomElevatedButton(
                onPressed: () {
                  _onPressed(context);
                },
                text: 'Confirm',
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      );
    },
  );
}

void _onPressed(BuildContext context) {
  context.push(Routes.confirmAddressScreen);
}

void updateDate(WidgetRef ref, String date) {
  ref.read(bookingModelProvider.notifier).setDate(date);
}
