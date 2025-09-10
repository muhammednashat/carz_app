

import 'package:carz_app/config/dependecy/booking_state_notifire.dart';
import 'package:carz_app/data/models/booking_car_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingModelProvider =
    NotifierProvider<BookingStateNotifire, BookingCarModel>(
      BookingStateNotifire.new,
    );

