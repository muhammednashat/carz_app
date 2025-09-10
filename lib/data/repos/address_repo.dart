import 'package:carz_app/data/models/address_model.dart';
import 'package:carz_app/data/services/address_service.dart';

class AddressRepo {
  final AddressService service;

  AddressRepo({required this.service});

  Future<void> addAddress(String title, String address, String userId) async {
    final result = await service.addAddress(title, address, userId);
    print(result.hasException);
  }

  Future<void> getUserAddresses(String userId) async {
    final result = await service.getUserAddresses(userId);
    print(result.hasException);
  }
}
