const String tablePlaceOrder='tbl_order';
const String tablePlaceOrderId='id';
const String tablePlaceOrderUserName='user_name';
const String tablePlaceOrderUserAddress='user_address';
const String tablePlaceOrderDestination='destination';
const String tablePlaceOrderUserNumber='user_number';
const String tablePlaceOrderDate='date';
const String tablePlaceOrderCarId='car_id';
const String tablePlaceOrderDriver='driver_id';
const String tablePlaceOrderfare='fare';


class PlaceOrder {
  String id;
  String userName;
  String userAddress;
  String destination;
  String userNumber;
  String date;
  int carID;
  String driverName;
  double fare;

  PlaceOrder(
      {required this.id,
        required this.userName,
      required this.userNumber,
      required this.userAddress,
      required this.destination,
      required this.date,
      required this.carID,
        this.driverName="this",
      required this.fare});

  Map<String,dynamic> toMap(){

    var map=<String,dynamic>{
      tablePlaceOrderUserName:userName,
      tablePlaceOrderUserAddress:userAddress,
      tablePlaceOrderUserNumber:userNumber,
      tablePlaceOrderDestination:destination,
      tablePlaceOrderDate:date,
      tablePlaceOrderCarId:carID,
      tablePlaceOrderDriver:driverName,
      tablePlaceOrderfare:fare.toString()
    };
    if(id!=null){
      map[tablePlaceOrderId]=id;
    }
    return map;
  }
  factory PlaceOrder.fromMap(Map<String, dynamic> map)=>PlaceOrder(
      id: map[tablePlaceOrderId],
      userName: map[tablePlaceOrderUserName],
      userNumber: map[tablePlaceOrderUserNumber],
      userAddress: map[tablePlaceOrderUserAddress],
      destination: map[tablePlaceOrderDestination],
      date: map[tablePlaceOrderDate],
      carID: map[tablePlaceOrderCarId],
      fare: double.parse(map[tablePlaceOrderfare]));

  @override
  String toString() {
    return 'PlaceOrder{id: $id, userName: $userName, userAddress: $userAddress, destination: $destination, userNumber: $userNumber, date: $date, carID: $carID, driverName: $driverName, fare: $fare}';
  }
}
