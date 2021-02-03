import 'package:cloudofgoods/models/trip_model.dart';

class GetAvaliableTrip{

  Future<List<AvaliableTrip>> getAllTrip() async{
    return [
      AvaliableTrip(tripId: "trip1",productListDetail:"01 of Ultra Light Standard Wheelchair", data:"8:00 AM - 11:00 AM", address:"041 Town Square Apt.309",open:true),
      AvaliableTrip(tripId: "trip2",productListDetail:"01 of Seat Cushion", data:"8:00 AM - 11:00 AM", address:"041 Town Square Apt.309",open:true),
      AvaliableTrip(tripId: "trip3",productListDetail:"01 of Wheelchair", data:"8:00 AM - 11:00 AM", address:"041 Town Square Apt.309",open:true),
      AvaliableTrip(tripId: "trip4",productListDetail:"Strong Pocket", data:"8:00 AM - 11:00 AM", address:"041 Town Square Apt.309",open:false),
      AvaliableTrip(tripId: "trip5",productListDetail:"The Product items list 01", data:"8:00 AM - 11:00 AM", address:"041 Town Square Apt.309",open:false),
      AvaliableTrip(tripId: "trip6",productListDetail:"The Product items list 02", data:"8:00 AM - 11:00 AM", address:"041 Town Square Apt.309",open:true),
      AvaliableTrip(tripId: "trip7",productListDetail:"The Product items list 03", data:"8:00 AM - 11:00 AM", address:"041 Town Square Apt.309",open:false),
    ];
  }
}
