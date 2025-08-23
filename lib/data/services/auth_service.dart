import 'package:carz_app/utils/constants.dart';
import 'package:graphql/client.dart';

class AuthService {

  final GraphQLClient graphQLClient;

AuthService({required this.graphQLClient});

 Future<QueryResult> creatNewAccount(String name, String email) async {
    final newUserMutation = r'''
       mutation createUsere($name:String, $email:String){ 
           createUser(name:$name, email:$email){ 
           user{
              id
              name
              email
           }
        }
        }
      ''';
    final mutationOptions = MutationOptions(
      document: gql(newUserMutation),
      variables: <String, dynamic>{'name': name, 'email': email},
    );

    return await graphQLClient.mutate(mutationOptions);

  
  }


Future<QueryResult> signIn(String email) async {
final query = r'''
            query signIn($email:String){
               signIn(email:$email){
                 id
                 email
                 name
               }
            }

''';

final queryOptions = QueryOptions(document: gql(query),
variables: <String , dynamic>{"email": email, }
);


return await graphQLClient.query(queryOptions);

}

}
