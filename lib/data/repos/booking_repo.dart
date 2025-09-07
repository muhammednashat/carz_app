import 'package:carz_app/data/models/booking_car_model.dart';
import 'package:carz_app/data/services/booking_service.dart';

class BookingRepo {
  final BookingService service;

  BookingRepo({required this.service});

  Future<void> bookCar(BookingCarModel model) async {
    await service.bookCar(model);
  }

  Future<List<BookingCarModel>> getUserBooking(String userId) async {
    final result = await service.getUserBooking(userId);
    if (!result.hasException) {
      final json = result.data?["userBookings"] as List<dynamic>;
      final models = json.map((element) => BookingCarModel.fromJson(element)).toList();
       return models;
    } else {
      throw Exception('Cann\'t get data because ${result.exception}');
    }
  }
}
