import 'package:carz_app/data/models/user_model.dart';
import 'package:carz_app/data/services/auth_service.dart';

class AuthRepo {
  final AuthService service;

  AuthRepo({required this.service});

  Future<UserModel> creatNewAccount(String name, String email) async {
    final result = await service.creatNewAccount(name, email);
    final json = result.data?["createUser"]["user"] as Map<String, dynamic>;
    return UserModel.fromJson(json);
  }
}
