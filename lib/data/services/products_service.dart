import 'package:graphql_flutter/graphql_flutter.dart';

class ProductsService {
  final GraphQLClient graphQLClient;

  ProductsService({required this.graphQLClient});

  Future<QueryResult> getPopulars() {
    // list car
    final queryString = r'''
             query{
                popular{
                  id
                  name
                  price
                  description
                  brand
                  rating
                  transmissionOptions
                  carType
                  fuelType
                  brandImage
                  isPopular
                  canConnectBluetooth
                  isAutomatic
                  imgUrl

                }
             }
            ''';
    final options = QueryOptions(document: gql(queryString));

    return graphQLClient.query(options);
  }

  Future<QueryResult> getTrendingBrands() {
    final queryString = r'''
             query{
                trendingBrands{
                  id
                  name
                  price
                  description
                  brand
                  rating
                  transmissionOptions
                  carType
                  fuelType
                  brandImage
                  isPopular
                  canConnectBluetooth
                  isAutomatic
                  imgUrl

                }
             }
            ''';
    final options = QueryOptions(document: gql(queryString));

    return graphQLClient.query(options);
  }

  Future<QueryResult> getCarsByBrand(String brand) {
    final queryString = r'''
             query carsByBrand($brand:String){
                carsByBrand(brand : $brand){
                  id
                  name
                  price
                  description
                  brand
                  rating
                  transmissionOptions
                  carType
                  fuelType
                  brandImage
                  isPopular
                  canConnectBluetooth
                  isAutomatic
                  imgUrl

                }
             }
            ''';
    final options = QueryOptions(
      document: gql(queryString),
      variables:<String, dynamic> {"brand": brand},
    );

    return graphQLClient.query(options);
  }

  Future<QueryResult> getCarsBrand() async {
    final queryString = r'''
             query{
                carBrands{
                  id
                  name
                  nameInDatabase
                  imageUrl
                  numbers
                }
             }
            ''';
    final options = QueryOptions(document: gql(queryString));

    final result = await graphQLClient.query(options);

  
    return result;
  }
}
