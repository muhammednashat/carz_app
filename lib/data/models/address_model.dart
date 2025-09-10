class AddressModel {
  final String title;
  final String address;

  AddressModel({required this.address, required this.title});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(address: json['address'], title: json['title']);
  }
}
