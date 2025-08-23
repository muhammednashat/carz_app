class CarModel {
  final String id;
  final String name;
  final int price;
  final String description;
  final String brand;
  final int rating;
  final String transmissionOptions;
  final String carType;
  final String fuelType;
  final String brandImage;
  final String imgUrl;
  final bool isPopular;
  final bool canConnectBluetooth;
  final bool isAutomatic;

  CarModel(
    this.name,
    this.price,
    this.description,
    this.brand,
    this.rating,
    this.transmissionOptions,
    this.carType,
    this.fuelType,
    this.brandImage,
    this.imgUrl,
    this.isPopular,
    this.canConnectBluetooth,
    this.isAutomatic, {
    required this.id,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      json['name'] as String,
      json['price'] as int,
      json['description'] as String,
      json['brand'] as String,
      json['rating'] as int,
      json['transmissionOptions'] as String,
      json['carType'] as String,
      json['fuelType'] as String,
      json['brandImage'] as String,
      json['imgUrl'] as String,
      json['isPopular'] as bool,
      json['canConnectBluetooth'] as bool,
      json['isAutomatic'] as bool,
      id: json['id'] as String,
    );
  }

@override
String toString() {
  return 'CarModel(id: $id, name: $name, price: $price, description: $description, brand: $brand, rating: $rating, transmissionOptions: $transmissionOptions, carType: $carType, fuelType: $fuelType, brandImage: $brandImage, imgUrl: $imgUrl, isPopular: $isPopular, canConnectBluetooth: $canConnectBluetooth, isAutomatic: $isAutomatic)';
}
}
