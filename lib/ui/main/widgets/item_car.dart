import 'package:carz_app/data/models/car_model.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemPopularCars extends StatelessWidget {
  const ItemPopularCars({super.key, required this.car});
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.carDetailsScreen, extra: car);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.network(car.imgUrl, height: 150.0),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      car.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "⭐ ${car.rating}",

                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 8.0),

                Divider(color: Colors.grey),
                SizedBox(height: 8.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1100 hp",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      car.transmissionOptions,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "\$${car.price}",

                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
