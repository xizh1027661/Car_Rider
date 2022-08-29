import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../database/db_halper.dart';
import '../model/fare_model.dart';
import '../model/user_booking_model.dart';
import 'app_car_helper_provider.dart';
import 'app_driver_helper_provider.dart';


class AppFareHalperProvider extends ChangeNotifier{
  List<FareByDistence> fareList=[];
  List<FareByDistence> fareonlineList=[];
  List<PlaceOrder> ordersList=[];
  String driverdropdownvalue='1-Faruk';
  String carDropDown='1-FZS';
  List<String> iteams=[];
  List<String> driverdropdownList=[];



  Future<bool> addFare(FareByDistence fareByDistencemodel) async {
    final rowId = await DBHalper.insertFare(fareByDistencemodel);
    if(rowId > 0) {
      fareByDistencemodel.id = rowId;
      fareList.add(fareByDistencemodel);
      fareList.sort((c1, c2) => c1.startPlace.compareTo(c2.startPlace));
      notifyListeners();
      return true;
    }
    return false;
  }
  void getCarNames(BuildContext context){
    print("Call getNames");
    iteams.clear();
    var pb=Provider.of<AppCarHelperProvider>(context,listen: false);
    pb.carList.forEach((element) {
        iteams.add("${element.id.toString()}-${element.carName}");

    });
  }
  void getDriverNames(BuildContext context){
    print("Call getDr");
    driverdropdownList.clear();
    var pb=Provider.of<AppDriverHalperProvider>(context,listen: false);
    pb.driverList.forEach((element) {
        driverdropdownList.add("${element.id.toString()}-${element.driverName}");
    });
  }
  void driverDropdownCheck(String newValue) {
    driverdropdownvalue= newValue;
    notifyListeners();
  }
  void carDropdownCheck(String newValue) {
    carDropDown= newValue;
    notifyListeners();
  }
  getAllFareDetails() {
    //contactList.sort((c1, c2) => c1.id!.compareTo(c2.id!));
    DBHalper.getAllFare().then((value) {
      fareList= value;
      notifyListeners();
    });
  }
  Future<FareByDistence> getFareById(int id) => DBHalper.getFareById(id);
  getAllFareDetailsOnline(){
    DBHalper.getAllOnlineFare().then((value){
      fareonlineList=value;
      notifyListeners();
    });
  }
  deletefare(int id) async {
    final rowId = await DBHalper.deletefare(id);
    if(rowId > 0) {
      fareList.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }

  Future<bool> addOrder(PlaceOrder placeOrder) async {
    final rowId = await DBHalper.insertPlaceOrder(placeOrder);
    if(rowId > 0) {
      ordersList.add(placeOrder);
      ordersList.sort((c1, c2) => c1.userName.compareTo(c2.userName));
      notifyListeners();
      return true;
    }
    return false;
  }
  getAllPlaceOrder() {
    //contactList.sort((c1, c2) => c1.id!.compareTo(c2.id!));
    DBHalper.getAllPlaceOrder().then((value) {
      ordersList= value;
      notifyListeners();
    });
  }




}