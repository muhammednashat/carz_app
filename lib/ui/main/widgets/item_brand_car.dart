import 'package:carz_app/data/models/brand_model.dart';
import 'package:flutter/material.dart';

class ItemBrandCar extends StatelessWidget {
  const ItemBrandCar({super.key, required this.brand});
  final BrandModel brand ; 
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 80.0,
                height: 90.0,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(brand.imageUrl),
                  ),
                ),
              ),
              SizedBox(height: 4.0),
              Text(brand.name),
            ],
          );
  }
}
