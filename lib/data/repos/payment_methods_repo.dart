import 'package:carz_app/data/models/card_payment_model.dart';
import 'package:carz_app/data/services/payment_methods_service.dart';

class PaymentMethodsRepo {
  final PaymentMethodsService service;

  PaymentMethodsRepo(this.service);

  Future<void> addPaymentMethod(
    String userId,
    String holderName,
    String last4Digits,
    String expiryMonth,
    String expiryYear,
    String cardType,
  ) async {
    final result = await service.addPaymentMethod(
      userId,
      holderName,
      last4Digits,
      expiryMonth,
      expiryYear,
      cardType,
    );
    print(result.hasException);
    print(result.exception.toString());
    print(result.data?["status"]);
  }

  Future<List<CardPaymentModel>> getUserPayments(String userId) async {
    try {
      final result = await service.getUserPayments(userId);
      final json = result.data?["userPayments"] as List<dynamic>;
      final cards = json.map((e)=> CardPaymentModel.fromJson(e)).toList();

      print("=====================");
      print(cards);
      print("=====================");

      return cards;
    } catch (e) {
      throw Exception(e);
    }
  }
}
