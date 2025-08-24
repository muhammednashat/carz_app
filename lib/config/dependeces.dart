import 'package:carz_app/data/models/user_model.dart';
import 'package:carz_app/data/repos/auth_repo.dart';
import 'package:carz_app/data/repos/products_repo.dart';
import 'package:carz_app/data/services/auth_service.dart';
import 'package:carz_app/data/services/products_service.dart';
import 'package:carz_app/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<String> _path() async {
  final dir = await getApplicationDocumentsDirectory();
  return dir.path;
}

final graphQlClientProvider = Provider((ref) {
  return GraphQLClient(
    link: HttpLink(Constants.baseUrl),
    cache: GraphQLCache(),
  );
});

final userBoxProvider = FutureProvider((ref) async {
  final path = await _path();
  Hive.registerAdapter(UserModelAdapter());

  return await Hive.openBox('user', path: path);
});

final appBoxProvider = FutureProvider((ref) async {
  final path = await _path();
  return await Hive.openBox('app', path: path);
});

//Services
final authServiceProvider = Provider((ref) {
  final graphQlClient = ref.watch(graphQlClientProvider);
  return AuthService(graphQLClient: graphQlClient);
});

final productsServiceProvider = Provider((ref) {
  final graphQLClient = ref.watch(graphQlClientProvider);
  return ProductsService(graphQLClient: graphQLClient);
});

//Repos
final authRepoProvider = Provider((ref) {
  final service = ref.watch(authServiceProvider);
  return AuthRepo(service: service);
});

final productsRepoProvider = Provider((ref) {
  final service = ref.watch(productsServiceProvider);

  return ProductsRepo(service: service);
});



final trendingBrandsProvider = FutureProvider((ref) {
  final repo = ref.watch(productsRepoProvider);
  return repo.getCarsBrand();
});

final popularCarsProvider = FutureProvider((ref) {
  final repo = ref.watch(productsRepoProvider);
  return repo.getPopulars();
});
