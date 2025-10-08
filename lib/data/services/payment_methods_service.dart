import 'package:graphql/client.dart';

class PaymentMethodsService {
  final GraphQLClient graphQLClient;

  PaymentMethodsService(this.graphQLClient);

 Future<QueryResult> addPaymentMethod(
  String userId,
  String holderName,
  String last4Digits,
  String expiryMonth,
  String expiryYear,
  String cardType,
) async {
  const String mutation = r'''
    mutation AddNewPayment(
      $userId: String!,
      $holderName: String!,
      $last4Digits: String!,
      $expiryMonth: String!,
      $expiryYear: String!,
      $cardType: String
    ) {
      addPayment(
        userId: $userId,
        holderName: $holderName,
        last4Digits: $last4Digits,
        expiryMonth: $expiryMonth,
        expiryYear: $expiryYear,
        cardType: $cardType
      ) {
        status
      }
    }
  ''';

  final options = MutationOptions(
    document: gql(mutation),
    variables: {
      'userId': userId,
      'holderName': holderName,
      'last4Digits': last4Digits,
      'expiryMonth': expiryMonth,
      'expiryYear': expiryYear,
      'cardType': cardType,
    },
  );

  final result = await graphQLClient.mutate(options);
  return result;
}




}

