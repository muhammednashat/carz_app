class BookingCarModel {
  final String cardNumber;
  String?  id;
  final String address;
  final String car;
  String? userId;

  BookingCarModel(
    {
    this.userId,  
    required this.cardNumber,
    required this.address,
    required this.car,
     this.id,
  });

  factory BookingCarModel.fromJson(Map<String, dynamic> json) {
    return BookingCarModel(
      cardNumber: json['cardNumber'] as String,
      address: json['address'] as String,
      car: json['car'] as String,
      id: json['id'] as String,
    );
  }

  joJson() {}

  @override
  String toString() {
    return "Booking {cardNumber: $cardNumber, address: $address, car: $car, id: $id}";
  }
}
