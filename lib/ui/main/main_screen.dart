import 'package:carz_app/config/dependeces.dart';
import 'package:carz_app/data/models/brand_model.dart';
import 'package:carz_app/data/models/car_model.dart';
import 'package:carz_app/routing/routes.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/ui/main/widgets/item_brand_car.dart';
import 'package:carz_app/ui/main/widgets/item_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {

    final AsyncValue<List<BrandModel>> trendingBrands = ref.watch(
      trendingBrandsProvider,
    );

    final AsyncValue<List<CarModel>> popularCars = ref.watch(
      popularCarsProvider,
    );

    var children = [
      SizedBox(height: 20.0),
      Row(
        children: [
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                "https://raw.githubusercontent.com/muhammednashat/carz_images/main/101.png",
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Text.rich(
            TextSpan(
              text: "Hello, Mohammed",
              style: Theme.of(context).textTheme.headlineSmall,
              children: [TextSpan(text: "👋")],
            ),
          ),
        ],
      ),
      SizedBox(height: 24.0),

      Text(
        'Let\'s find your favourite car here',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      SizedBox(height: 8.0),

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
            child: IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt)),
            decoration: BoxDecoration(
              color: AppTheme.accent,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),

      SizedBox(height: 16.0),
      ItemRow(
        title: 'Trending Brands',

        callback: () {
          context.push(Routes.allBrandsScreen);
        },
      ),

      TrendingBrands(trendingBrands: trendingBrands),

      ItemRow(
        title: 'Pupolar Car',
        callback: () {
          context.push(Routes.allCarsScreen, extra: popularCars.value);
        },
      ),
      SizedBox(height: 24.0),
      Expanded(
        child: switch (popularCars) {
          AsyncData(:final value) => ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemPopularCars(car: value[index]);
            },
          ),
          AsyncError(:final error) => Text('dfa'),
          _ => Center(child: CircularProgressIndicator()),
        },
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}

class TrendingBrands extends StatelessWidget {
  const TrendingBrands({super.key, required this.trendingBrands});

  final AsyncValue<List<BrandModel>> trendingBrands;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135.0,
      child: switch (trendingBrands) {
        AsyncData(:final value) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return ItemBrandCar(brand: value[index]);
          },
        ),

        AsyncError(:final error) => Center(child: Text(error.toString())),

        AsyncLoading() => Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class ItemRow extends StatelessWidget {
  const ItemRow({super.key, required this.title, required this.callback});
  final String title;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        TextButton(
          onPressed: callback,
          child: Text(
            'view all',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppTheme.accent),
          ),
        ),
      ],
    );
  }
}
