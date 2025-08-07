

import 'package:carz_app/data/repos/auth_repo.dart';
import 'package:carz_app/data/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//Services
final authServiceProvider = Provider((ref) => AuthService());








//Repos
final authRepoProvider = Provider((ref){
  final service = ref.watch(authServiceProvider);
  return AuthRepo(service: service);
});