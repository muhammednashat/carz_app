import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChooceInterestScreen extends StatefulWidget {
  const ChooceInterestScreen({super.key});

  @override
  State<ChooceInterestScreen> createState() => _ChooceInterestScreenState();
}

class _ChooceInterestScreenState extends State<ChooceInterestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.accent,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text("Skip"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text("Which brand of car you prefer?"),
              SizedBox(height: 32.0),
              Expanded(child: BrandsList()),

              CustomElevatedButton(onPressed: _onPressed, text: "Finish"),
            ],
          ),
        ),
      ),
    );
  }

  _onPressed(){
    context.go(Routes.appBottomTabBar);
  }
}

class BrandsList extends StatelessWidget {
  const BrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(fakeBrands.length, (index) {
        return Center(child: ItemBrand(brand: fakeBrands[index], index: index));
      }),
    );
  }
}

class ItemBrand extends StatefulWidget {
  const ItemBrand({super.key, required this.brand, required this.index});
  final Brand brand;
  final int index;

  @override
  State<ItemBrand> createState() => _ItemBrandState();
}

class _ItemBrandState extends State<ItemBrand> {
  late bool _isChoosed;

  @override
  void initState() {
    _isChoosed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        child: Container(
          width: 150.0,
          height: 150.0,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.accent,
              width: (_isChoosed) ? 1.5 : 0.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  getIconPath(widget.brand.image),
                  width: 50.0,
                  height: 70.0,
                ),
                SizedBox(height: 8.0),
                Text(widget.brand.name),
              ],
            ),
          ),
        ),
      ),
    );
  }

  

  _onTap() {
    setState(() {
      _isChoosed = !_isChoosed;
    });
  }
}

class Brand {
  String image;
  String name;

  Brand({required this.image, required this.name});
}

final List<Brand> fakeBrands = [
  Brand(image: 'bmw.png', name: 'BMW'),
  Brand(image: 'tesla.png', name: 'Tesla'),
  Brand(image: 'ferrari.png', name: 'Ferrari'),
  Brand(image: 'lamborghini.png', name: 'Lamborghini'),
  Brand(image: 'mercedes.png', name: 'Mercedes'),
  Brand(image: 'kia.png', name: 'KIA'),
];
