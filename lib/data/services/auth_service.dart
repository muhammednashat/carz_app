import 'package:graphql/client.dart';

class AuthService {
  final gl = GraphQLClient(
    link: HttpLink('http://192.168.1.5:8000/carz'),
    cache: GraphQLCache(),
  );

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

    return await gl.mutate(mutationOptions);

  
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


return await gl.query(queryOptions);

}

}
