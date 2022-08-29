import 'package:flutter/foundation.dart';

const String tableCar='tbl_cars';
const String tableCarId='id';
const String tableCarName='name';
const String tableCarPlace='place';
const String tableCarPicUrl='url';
const String tableCarPrice='price';
const String tableCarAbility='ability';



class CarModel{
  int id;
  String carName;
  String place;
  String carPicUrl;
  double carPrice;
  String carAbility;

  CarModel({required this.id,required this.carName,required this.place,required this.carPicUrl,required this.carPrice,required this.carAbility});

  Map<String,dynamic> toMap(){

    var map=<String,dynamic>{
      tableCarName:carName,
      tableCarPlace:place,
      tableCarPicUrl:carPicUrl,
      tableCarPrice:carPrice.toString(),
      tableCarAbility:carAbility=="Available"?1:0
    };
    if(id!=null){
      map[tableCarId]=id;
    }
    return map;
  }
  factory CarModel.fromMap(Map<String, dynamic> map)=>CarModel(
      id: map[tableCarId],
      carName: map[tableCarName],
      place: map[tableCarPlace],
      carPicUrl: map[tableCarPicUrl] ,
      carPrice: double.parse(map[tableCarPrice]) ,
      carAbility: map[tableCarAbility]==1?"Available":"Not Available");

  @override
  String toString() {
    return 'CarModel{id: $id, carName: $carName, place: $place, carPicUrl: $carPicUrl, carPrice: $carPrice, carAbility: $carAbility}';
  }
}
