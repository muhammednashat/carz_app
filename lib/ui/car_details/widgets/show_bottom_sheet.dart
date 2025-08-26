  import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/car_details/widgets/time_picker.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> showModelBottomSheet(BuildContext context) async {
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
                    print("Selected: $date");
                  },
                ),
                SizedBox(height: 8.0),
                Text('Select Time'),
                SizedBox(height: 8.0),
                TimePicker(),
                SizedBox(height: 32.0),
                CustomElevatedButton(onPressed: () {
                  context.push(Routes.confirmAddressScreen);
                }, text: 'Confirm'),
                SizedBox(height: 32.0),
              ],
            ),
          ),
        );
      },
    );
  }