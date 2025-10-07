import 'package:carz_app/config/dependecy/query_mutation_provider.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/ui/main/widgets/item_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarsBrand extends ConsumerStatefulWidget {
  const CarsBrand({super.key, required this.brandName});

  final String brandName;

  @override
  ConsumerState<CarsBrand> createState() => _CarsBrandState();
}

class _CarsBrandState extends ConsumerState<CarsBrand> {
  late String name;
  late String brandName;

  @override
  void initState() {
    print("1230" + widget.brandName);
    name = widget.brandName;
    brandName = switch (name) {
      "Honda" => "hon",
      "Volkswagen" => "vw",
      "BMW" => "bmw",
      "Audi" => "aud",
      "Nissan" => "nis",
      "Ford" => "for",
      "Farrari" => "fra",
      "Lamborghini" => "lamb",
      "Mercedes" => "mer",
      "Tesla" => "tes",
      "Toyota" => "toy",
      "Hyundai" => "hyu",
      _ => "",
    };
    print(name);
    print(brandName);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cars = ref.watch(carsBrandProvider(brandName));

    return Scaffold(
      appBar: AppBar(title: Text(" Cars\' $name")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  width: 50.0,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_alt),
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.accent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
           
           SizedBox(height: 32.0,),
            Expanded(
        child: switch (cars) {
          AsyncData(:final value) => ListView.builder(
           itemCount: value.length,
            itemBuilder: (context, index) {
              return ItemPopularCars(car: value[index]);
            },
          ),
              AsyncError(:final error) => Center(child: Text(error.toString())),
          _ => Center(child: CircularProgressIndicator()),
        },
      ),
         
          ],
        ),
      ),
    );
  }
}
