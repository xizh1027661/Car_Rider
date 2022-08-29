const String tableFareByDistence='tbl_fare_by_distence';
const String tableFareByDistenceId='id';
const String tableFareByDistenceStartPlace='start_place';
const String tableFareByDistenceEndPlace='end_place';
const String tableFareByDistenceCarId='car_id';
const String tableFareByDistenceDriverId='driver_id';
const String tableFareByDistencePrice='price';
const String tableFareByDistenceAbility='ability';

class FareByDistence{
  int id;
  String startPlace;
  String endPlace;
  int carId;
  int driverId;
  double fare;
  String fareAbility;

  FareByDistence({required this.id,required this.startPlace,required this.endPlace,required this.carId,required this.driverId,required this.fare,required this.fareAbility});

  Map<String,dynamic> toMap(){

    var map=<String,dynamic>{
      tableFareByDistenceStartPlace:startPlace,
      tableFareByDistenceEndPlace:endPlace,
      tableFareByDistenceCarId:carId,
      tableFareByDistenceDriverId:driverId,
      tableFareByDistencePrice:fare.toString(),
      tableFareByDistenceAbility:fareAbility=="Available"?1:0
    };
    if(id!=null){
      map[tableFareByDistenceId]=id;
    }
    return map;
  }
  factory FareByDistence.fromMap(Map<String,dynamic> map)=>FareByDistence(
      id: map[tableFareByDistenceId],
      startPlace: map[tableFareByDistenceStartPlace],
      endPlace: map[tableFareByDistenceEndPlace],
      carId: map[tableFareByDistenceCarId],
      driverId: map[tableFareByDistenceDriverId],
      fare:double.parse(map[tableFareByDistencePrice]),
      fareAbility: map[tableFareByDistenceAbility]==1?"Available":"Not Available"
  );

  @override
  String toString() {
    return 'FareByDistence{id: $id, startPlace: $startPlace, endPlace: $endPlace, carId: $carId, driverId: $driverId, fare: $fare, fareAbility: $fareAbility}';
  }
}

class FareCar{
  String name;

  FareCar({required this.name});
  factory FareCar.fromMap(Map<String,dynamic> map)=>FareCar(name: 'name');




}