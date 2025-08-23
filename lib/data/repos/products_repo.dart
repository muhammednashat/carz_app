import 'package:carz_app/data/models/brand_model.dart';
import 'package:carz_app/data/models/car_model.dart';
import 'package:carz_app/data/services/products_service.dart';

class ProductsRepo {
  final ProductsService service;

  ProductsRepo({required this.service});

  Future<CarModel> getPopulars() async {
    final result = await service.getPopulars();

    final json = result.data as Map<String, dynamic>;
    return CarModel.fromJson(json);
  }

  Future<CarModel> getTrendingBrands() async {
    final result = await service.getTrendingBrands();

    final json = result.data as Map<String, dynamic>;
    return CarModel.fromJson(json);
  }

  Future <List<CarModel>> getCarsByBrand(String brand) async {
    final result = await service.getCarsByBrand(brand);

    final json = result.data?["carsByBrand"] as List<dynamic>;
     

    return json.map((e)=> CarModel.fromJson(e)).toList();
  }


  Future<List<BrandModel>> getCarsBrand() async {
    final result = await service.getCarsBrand();
    final json = result.data?["carBrands"] as List<dynamic>;
    return json.map((e) => BrandModel.fromJson(e),).toList();
  }
}
