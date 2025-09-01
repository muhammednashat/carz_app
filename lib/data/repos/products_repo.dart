import 'package:carz_app/data/models/brand_model.dart';
import 'package:carz_app/data/models/car_model.dart';
import 'package:carz_app/data/services/products_service.dart';

class ProductsRepo {
  final ProductsService service;

  ProductsRepo({required this.service});

  Future<List<CarModel>> getPopulars() async {

    try{
    final result = await service.getPopulars();
    final json = result.data?['populars'] as List<dynamic>;
    return json.map((e)=> CarModel.fromJson(e)).toList();
    }catch (e){
    throw Exception("Failed to load cars: $e");
    }
  
  }


  // Future<List<CarModel>> getTrendingBrands() async {
  // print('3');

  //   try{
  // print('4');

  //   final result = await service.getTrendingBrands();
  // print('5');

  //   final json = result.data?['trendingBrands'] as List<dynamic>;
  //    return json.map((e) => CarModel.fromJson(e)).toList();
  //    }catch(e){
  // print('6');

  //     throw Exception("Faild to load trending brands");
  //    }
  // }












  Future <List<CarModel>> getCarsByBrand(String brand) async {
 

    final result = await service.getCarsByBrand(brand);


    final json = result.data?["carsByBrand"] as List<dynamic>;
     


    return json.map((e)=> CarModel.fromJson(e)).toList();
  }


  Future<List<BrandModel>> getCarsBrand() async {
    try{
    final result = await service.getCarsBrand();
    if(result.data == null){
      throw Exception("adf Exception");
    }
    final json = result.data?["carBrands"] as List<dynamic>;
    return json.map((e) => BrandModel.fromJson(e),).toList();
    }catch(e){
       print('catched');
      throw Exception("adf Exception");

    }

   
  }
}
