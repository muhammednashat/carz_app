import 'package:graphql/client.dart';

class AddressService {
  final GraphQLClient graphQLClient;

  AddressService({required this.graphQLClient});

  Future<QueryResult> addAddress(
    String title,
    String address,
    String user_id,
  ) async {
    final document = r'''
   mutation addAddress($title: String, $address: String, $user_id: String){
            addAddress(title: $title, address: $address, userId: $user_id){
              status
            }
   }
''';

    final options = MutationOptions(
      document: gql(document),
      variables: {"title": title, "address": address, "user_id": user_id},
    );

    return await graphQLClient.mutate(options);
  }

  Future<QueryResult> getUserAddresses(String userId) {
    final document = r'''
query addresses($user_id: String){
 addresses(userId: $user_id){
 id
 title
 address
 }

}

''';

    final options = QueryOptions(
      document: gql(document),

      variables: {"userId": userId},
    );

    return graphQLClient.query(options);
  }
}
