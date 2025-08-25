import 'package:carz_app/data/models/car_model.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key, required this.car});
  final CarModel car;
  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  late CarModel car;

  @override
  void initState() {
    car = widget.car;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(car.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(car.imgUrl, height: 150.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemRow(car: car),
                  ItemRow(car: car),
                  ItemRow(car: car),
                ],
              ),
              SizedBox(height: 32.0),
              Text('Descriptions'),
              SizedBox(height: 32.0),
              Text(car.description),
              SizedBox(height: 32.0),
              Text('Best Features'),
              ItemFeature(
                iconLeading: Icons.bluetooth,
                title: 'Bluetooth connectivity',
                trailingText: (car.canConnectBluetooth) ? 'Yes' : 'No',
              ),
              ItemFeature(
                iconLeading: Icons.auto_mode,
                title: 'Automatic Climate Control',
                trailingText: (car.isAutomatic) ? 'Yes' : 'No',
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Total price'), Text('\$${car.price}')],
              ),
              SizedBox(height: 24.0),
              CustomElevatedButton(onPressed: () {}, text: 'Book Now '),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemFeature extends StatelessWidget {
  const ItemFeature({
    super.key,
    required this.title,
    required this.iconLeading,
    required this.trailingText,
  });
  final IconData iconLeading;
  final String title;
  final String trailingText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconLeading),
      title: Text(title),
      trailing: Text(trailingText),
    );
  }
}

class ItemRow extends StatelessWidget {
  const ItemRow({super.key, required this.car});

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: Column(
          children: [
            Image.asset(getIconPath('fuel.png'), height: 25.0, width: 25.0),
            Text('Fuel Type'),
            Text(car.fuelType),
          ],
        ),
      ),
    );
  }
}
