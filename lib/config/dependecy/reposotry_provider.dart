


import 'package:carz_app/config/dependecy/service_provider.dart';
import 'package:carz_app/data/repos/address_repo.dart';
import 'package:carz_app/data/repos/auth_repo.dart';
import 'package:carz_app/data/repos/booking_repo.dart';
import 'package:carz_app/data/repos/products_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider = Provider((ref) {
  final service = ref.watch(authServiceProvider);
  return AuthRepo(service: service);
});

final productsRepoProvider = Provider((ref) {
  final service = ref.watch(productsServiceProvider);

  return ProductsRepo(service: service);
});

final bookingRepoProvider = Provider((ref) {
  final service = ref.watch(bookingServiceProvider);
  return BookingRepo(service: service);
});


final addressRepoProvider = Provider((ref){
final service = ref.watch(addressServiceProvider);

return AddressRepo(service: service);
});