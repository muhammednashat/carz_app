import 'package:carz_app/data/models/address_model.dart';
import 'package:carz_app/data/services/address_service.dart';

class AddressRepo {
  final AddressService service;

  AddressRepo({required this.service});

  Future<void> addAddress(String title, String address, String userId) async {
    final result = await service.addAddress(title, address, userId);
    print(result.hasException);
  }

  Future<List<AddressModel>> getUserAddresses(String userId) async {
    final result = await service.getUserAddresses(userId);
    final data = result.data?["addresses"] as List<dynamic>;
    final adresses = data.map((e) => AddressModel.fromJson(e)).toList();
    return adresses;
  }
}
