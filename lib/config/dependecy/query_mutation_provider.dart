import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/config/dependecy/reposotry_provider.dart';
import 'package:carz_app/data/models/address_model.dart';
import 'package:carz_app/data/models/booking_car_model.dart';
import 'package:carz_app/data/models/brand_model.dart';
import 'package:carz_app/data/models/car_model.dart';
import 'package:carz_app/data/models/user_model.dart';
import 'package:carz_app/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trendingBrandsProvider = FutureProvider<List<BrandModel>>((ref) async {
  try {
    final repo = ref.watch(productsRepoProvider);
    return await repo.getCarsBrand();
  } catch (e, st) {
    throw Exception("Failed to load trending brands: $e");
  }
});

final popularCarsProvider = FutureProvider((ref) {
  final repo = ref.watch(productsRepoProvider);
  return repo.getPopulars();
});

final carsBrandProvider = FutureProvider.autoDispose
    .family<List<CarModel>, String>((ref, brand) {
      final repo = ref.watch(productsRepoProvider);
      return repo.getCarsByBrand(brand);
    });

final userBookingProvider = FutureProvider.autoDispose
    .family<List<BookingCarModel>, String>((ref, userId) {
      final bookingRepo = ref.watch(bookingRepoProvider);
      return bookingRepo.getUserBooking(userId);
    });

final bookCarProvide = FutureProvider.autoDispose.family<void, BookingCarModel>(
  (ref, model) {
    final bookingRepo = ref.watch(bookingRepoProvider);
    return bookingRepo.bookCar(model);
  },
);

final userAddressesProvider = FutureProvider((ref) async {
      final repo = ref.watch(addressRepoProvider);
      final userBox = await ref.watch(userBoxProvider.future);
      final user = userBox.get(Constants.user) as UserModel;
      print(user.id);
      return repo.getUserAddresses(user.id);
    });
