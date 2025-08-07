import 'package:carz_app/data/services/auth_service.dart';

class AuthRepo {


  final AuthService service;

  AuthRepo({required this.service});

  creatNewAccount(){
    return service.creatNewAccount();
  }
  
}
