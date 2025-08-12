import 'package:carz_app/data/models/user_model.dart';
import 'package:carz_app/data/repos/auth_repo.dart';
import 'package:carz_app/data/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
Future<String> _path()async{
    final dir = await getApplicationDocumentsDirectory();
  return dir.path;
}
  


final userBoxProvider = FutureProvider((ref) async {
final path = await _path();
  Hive.registerAdapter(UserModelAdapter());

  return await Hive.openBox('user', path: path);
});

final appBoxProvider = FutureProvider((ref)async{
 final path =  await _path();
return await Hive.openBox('app', path: path);
});

//Services
final authServiceProvider = Provider((ref) => AuthService());

//Repos
final authRepoProvider = Provider((ref) {
  final service = ref.watch(authServiceProvider);
  return AuthRepo(service: service);
});
