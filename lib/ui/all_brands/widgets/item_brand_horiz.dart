import 'package:carz_app/data/models/brand_model.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemBrandHoriz extends StatelessWidget {
  const ItemBrandHoriz({super.key, required this.brand});
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('object');
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            context.push(Routes.carsBrandScreen, extra: brand.name);
        
          },
          child: Card(
            child: ListTile(
              leading: Image.network(brand.imageUrl, height: 50.0, width: 50.0),
              title: Text(
                brand.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text("${brand.numbers} Car Available"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
