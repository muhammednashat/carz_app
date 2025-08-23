 

class BrandModel{
  final String name;
  final String nameInDatabase;
  final int numbers;
  final String id;
  final String imageUrl;


  BrandModel({
    required this.name,
    required this.nameInDatabase,
    required this.numbers,
    required this.id,
    required this.imageUrl,
    });


  factory BrandModel.fromJson(Map<String, dynamic> json){

    return BrandModel(
      name: json['name'] as String,
      nameInDatabase: json['nameInDatabase'] as String,
      numbers: json['numbers'] as int,
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  
@override
  String toString() {
    return 'BrandModel(name: $name, nameInDatabase: $nameInDatabase, numbers: $numbers, id: $id, imageUrl: $imageUrl)';
  }
}