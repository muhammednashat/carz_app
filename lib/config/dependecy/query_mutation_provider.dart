

import 'package:carz_app/config/dependecy/reposotry_provider.dart';
import 'package:carz_app/data/models/booking_car_model.dart';
import 'package:carz_app/data/models/brand_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trendingBrandsProvider = FutureProvider<List<BrandModel>>((ref) async {
  try {
    print('2222222222222222');
    final repo = ref.watch(productsRepoProvider);
    return await repo.getCarsBrand();
  } catch (e, st) {
    print('1111111111111');
    throw Exception("Failed to load trending brands: $e");
  }
});

final popularCarsProvider = FutureProvider((ref) {
  final repo = ref.watch(productsRepoProvider);
  return repo.getPopulars();
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