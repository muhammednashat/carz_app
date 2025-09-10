import 'package:carz_app/data/models/user_model.dart';
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



