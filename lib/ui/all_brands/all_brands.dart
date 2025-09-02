import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/data/models/brand_model.dart';
import 'package:carz_app/ui/all_brands/widgets/item_brand_horiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllBrandsScreen extends ConsumerStatefulWidget {
  const AllBrandsScreen({super.key});

  @override
  ConsumerState<AllBrandsScreen> createState() => _AllBrandsScreenState();
}

class _AllBrandsScreenState extends ConsumerState<AllBrandsScreen> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<BrandModel>> trendingBrands = ref.watch(
      trendingBrandsProvider,
    );

    return Scaffold(
      appBar: AppBar(title: Text('All Brands')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: switch (trendingBrands) {
            AsyncData(:final value) => BrandsView(brands: value),
            AsyncError(:final error) => Text(error.toString()),
            _ => CircularProgressIndicator(),
          },
        ),
      ),
    );
  }
}

class BrandsView extends StatelessWidget {
  const BrandsView({super.key, required this.brands});
  final List<BrandModel> brands;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        SizedBox(height: 24.0),
        SizedBox(height: 24.0),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 24.0),
            itemCount: brands.length,
            itemBuilder:
                (context, index) => ItemBrandHoriz(brand: brands[index]),
          ),
        ),
      ],
    );
  }
}
