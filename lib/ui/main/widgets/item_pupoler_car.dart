import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';

class ItemPupolerCar extends StatelessWidget {
  const ItemPupolerCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(getImagePath("car.png"), height: 200.0),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Mercedes Slk Class"), Text("⭐ 4.9")],
            ),
            SizedBox(height: 8.0),

            Divider(color: Colors.grey),
            SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("1100 hp"), Text("Automatic"), Text("\$85,000")],
            ),
          ],
        ),
      ),
    );
  }
}
