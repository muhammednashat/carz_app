class CardPaymentModel {
  final String id;
  final String cardHolderName;
  final String last4Digits;
  final String cardType;
  final DateTime createdAt;
  final bool isDefault;
  final String expiryMonth;
  final String expiryYear;

  CardPaymentModel({
    required this.id,
    required this.cardHolderName,
    required this.last4Digits,
    required this.cardType,
    required this.createdAt,
    required this.isDefault,
    required this.expiryMonth,
    required this.expiryYear,
  });

factory CardPaymentModel.fromJson(Map<String, dynamic> json) {
  return CardPaymentModel(
    id: json['id'] as String,
    cardHolderName: json['cardHolderName'] as String,
    last4Digits: json['last4Digits'] as String,
    cardType: json['cardType'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    isDefault: json['isDefault'] as bool,
    expiryMonth: json['expiryMonth'] as String,
    expiryYear: json['expiryYear'] as String,
  );
}
  Map<String , dynamic> toJson() => {
    "id": id,
    "cardHolderName": cardHolderName,
    "last4Digits": last4Digits,
    "cardType": cardType,
    "createdAt": createdAt.toIso8601String(),
    "isDefault": isDefault,
    "expiryMonth": expiryMonth,
    "expiryYear": expiryYear,
  };
}
