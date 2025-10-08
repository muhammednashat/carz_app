import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/data/services/address_service.dart';
import 'package:carz_app/data/services/auth_service.dart';
import 'package:carz_app/data/services/booking_service.dart';
import 'package:carz_app/data/services/payment_methods_service.dart';
import 'package:carz_app/data/services/products_service.dart';
import 'package:carz_app/ui/payment_method/payment_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider((ref) {
  final graphQlClient = ref.watch(graphQlClientProvider);
  return AuthService(graphQLClient: graphQlClient);
});

final productsServiceProvider = Provider((ref) {
  final graphQLClient = ref.watch(graphQlClientProvider);
  return ProductsService(graphQLClient: graphQLClient);
});

final bookingServiceProvider = Provider((ref) {
  final graphQLClient = ref.watch(graphQlClientProvider);

  return BookingService(graphQLClient: graphQLClient);
});


final addressServiceProvider = Provider((ref){

  final graphQLClient = ref.watch(graphQlClientProvider);


return AddressService(graphQLClient: graphQLClient);

});


final paymentMethodScreenProvider = Provider((ref){
final graphQLClient = ref.watch(graphQlClientProvider);
return PaymentMethodsService(graphQLClient);
});