import 'package:carz_app/data/models/brand_model.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemBrandCar extends StatelessWidget {
  const ItemBrandCar({super.key, required this.brand});
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 80.0,
          height: 90.0,
          child: GestureDetector(
            onTap: () {
              context.push(Routes.carsBrandScreen, extra: brand.name);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Image.network(brand.imageUrl, height: 50.0, width: 50.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 4.0),
        Text(brand.name, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
