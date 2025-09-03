import 'package:carz_app/data/models/booking_car_model.dart';
import 'package:graphql/client.dart';

class BookingService {
  final GraphQLClient graphQLClient;
  BookingService({required this.graphQLClient});

  Future<QueryResult> bookCar(BookingCarModel model) async {
    final document = r'''
         mutation($userId: String, $address: String, $car: String , $cardNumber: String, $time:String, $date:String){
          booking(userId:$userId, address:$address, car:$car, cardNumber:$cardNumber,time:$time, date:$date){
            status
          }
         }
      ''';

    final options = MutationOptions(
      document: gql(document),
      variables: <String, dynamic>{
        "userId": model.userId,
        "address": model.address,
        "car": model.car,
        "cardNumber": model.cardNumber,
        "time": model.time,
        "date": model.date,
      },
    );

    final queryResult = await graphQLClient.mutate(options);

    return queryResult;
  }
}
