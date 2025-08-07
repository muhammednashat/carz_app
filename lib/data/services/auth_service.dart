import 'package:graphql/client.dart';

class AuthService {

final QueryOptions options = QueryOptions(
  document: gql(r'''
                    query{
     users{
        id
        name
    }
}
                     '''),
  variables: <String, dynamic>{
    'nRepositories': 50,
  },
);





  final gl = GraphQLClient(
    link: HttpLink('http://127.0.0.1:8000/carz'),
    cache: GraphQLCache(),
  );

  creatNewAccount() async {
    final result = await gl.query(  options );
    print("object");
    print(result.data?['users'].toString());

    return "service.creatNewAccount()";
  }
}
