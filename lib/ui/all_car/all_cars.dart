import 'package:carz_app/data/models/car_model.dart';
import 'package:carz_app/ui/main/widgets/item_car.dart';
import 'package:flutter/material.dart';

class AllCarsScreen extends StatefulWidget {
  const AllCarsScreen({super.key, required this.cars});
  final List<CarModel> cars;

  @override
  State<AllCarsScreen> createState() => _AllCarsScreenState();
}

class _AllCarsScreenState extends State<AllCarsScreen> {
  late List<CarModel> cars;
  @override
  void initState() {
    cars = widget.cars;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Cars')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 24.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 32.0),
            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  return ItemPopularCars(car: cars[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
