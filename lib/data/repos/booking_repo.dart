import 'package:carz_app/data/models/booking_car_model.dart';
import 'package:carz_app/data/services/booking_service.dart';

class BookingRepo {

final BookingService service;

BookingRepo({required this.service});


  Future<void> bookCar(BookingCarModel model) async {
   final result = await service.bookCar(model);

   print(result.hasException);

  }
}
