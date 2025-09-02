import 'package:carz_app/data/models/booking_car_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingStateNotifire extends Notifier<BookingCarModel> {
  var model = BookingCarModel(
    cardNumber: "dfd",
    address: "address",
    car: "car",
    date: 'date',
    time: 'time',
  );

  @override
  BookingCarModel build() {
    return model;
  }

  void setCar(String car) {
    model.car = car;
    state = model;
  }

  void setUserId(String id) {
    model.userId = id;
    state = model;
  }

  void setAddress(String address) {
    model.address = address;
    state = model;
  }

  void setCardNumber(String cardNumber) {
    model.cardNumber = cardNumber;
    state = model;
  }

  void setDate(String date) {
    model.date = date;
    state = model;
  }

  void setTime(String time) {
    model.time = time;
    state = model;
  }
}
