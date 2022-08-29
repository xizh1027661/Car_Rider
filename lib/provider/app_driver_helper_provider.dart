import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../database/db_halper.dart';
import '../model/driver_models.dart';

class AppDriverHalperProvider extends ChangeNotifier{
  String? imagePath;
  ImageSource imageSource = ImageSource.camera;
  List<DriverModel> driverList = [];
  List<DriverModel> driverOnlineList = [];
  String dropdownvalue = 'Available';
  String skillDropdownValue='Light';
  var iteam = [
    'Available',
    'Not Available',
  ];
  var driverSkills=[
    'Heavy',
    'Mediam',
    'Light'
  ];
  void driverskillCheack(String newValue){
    skillDropdownValue= newValue;
    notifyListeners();
  }
  void driverAbilityCheck(String newValue) {
     dropdownvalue= newValue;
    notifyListeners();
  }

  void getDriverImage() async {
    final selecteImage = await ImagePicker().pickImage(source: imageSource);
    if (selecteImage != null) {
      imagePath = selecteImage.path;
    }
    notifyListeners();
  }
  Future<DriverModel> getDriverById(int id) => DBHalper.getDriverById(id);
  Future<bool> addNewDriver(DriverModel driverModel) async {
    final rowId = await DBHalper.insertDriver(driverModel);
    if(rowId > 0) {
      driverModel.id = rowId;
      driverList.add(driverModel);
      driverList.sort((c1, c2) => c1.driverName.compareTo(c2.driverName));
      notifyListeners();
      return true;
    }
    return false;
  }

  getAllDriverDetails() {
    //contactList.sort((c1, c2) => c1.id!.compareTo(c2.id!));
    print("call gdd");
    DBHalper.getAllDriver().then((value) {
      driverList = value;
      notifyListeners();
    });
  }
  getAllDriverDetailsOnline(){
    print("call gdo");
    DBHalper.getAllDriverOnline().then((value){
      driverOnlineList=value;
      notifyListeners();
    });
  }
  deleteDriver(int id) async {
    final rowId = await DBHalper.deleteDriver(id);
    if(rowId > 0) {
      driverList.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }

}