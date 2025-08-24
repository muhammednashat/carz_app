import 'package:carz_app/data/models/car_model.dart';
import 'package:flutter/material.dart';

class ItemPopularCars extends StatelessWidget {
  const ItemPopularCars({super.key, required this.car});
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(car.imgUrl, height: 150.0),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(car.name), Text("⭐ ${car.rating}")],
            ),
            SizedBox(height: 8.0),

            Divider(color: Colors.grey),
            SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("1100 hp"),
                Text(car.transmissionOptions),
                Text("\$${car.price}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}