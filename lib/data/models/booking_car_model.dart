class BookingCarModel {
  String cardNumber;
  String? id;
  String address;
  String car;
  String? userId;
  String time;
  String date;

  BookingCarModel({
    this.userId,
    required this.cardNumber,
    required this.address,
    required this.car,
    required this.date,
    required this.time,
    this.id,
  });

  factory BookingCarModel.fromJson(Map<String, dynamic> json) {
    return BookingCarModel(
      cardNumber: json['cardNumber'] as String,
      address: json['address'] as String,
      car: json['car'] as String,
      id: json['id'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
    );
  }

  joJson() {}

  @override
  String toString() {
    return "Booking {cardNumber: $cardNumber, address: $address, car: $car, id: $id, userId: $userId, time: $time, date: $date}";
  }
}
