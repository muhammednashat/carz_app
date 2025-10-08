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
 
 final result = await service.addPaymentMethod(userId, holderName, last4Digits, expiryMonth, expiryYear, cardType);
  print('-------------------------------');
  print(result.hasException);
  print(result.exception.toString()); 
  print('-------------------------------');
  print('-------------------------------');

  print(result.data?["status"]);
  print('-------------------------------');


}
}