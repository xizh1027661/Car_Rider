import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../database/db_halper.dart';
import '../model/car_models.dart';

class AppCarHelperProvider extends ChangeNotifier {
  String? imagePath;
  ImageSource imageSource = ImageSource.camera;
  List<CarModel> carOnlineList = [];
  List<CarModel> carList = [];
  String dropdownvalue = 'Available';
  var items = [
    'Available',
    'Not Available',
  ];
  getAllCarDetails() {
    print("Call GetAll");
    //contactList.sort((c1, c2) => c1.id!.compareTo(c2.id!));
    DBHalper.getAllCarDetails().then((value) {
      carList = value;
      notifyListeners();
    });
  }
  getAllCarDetailsOnline() {
    print("Call GetOnli");
    //contactList.sort((c1, c2) => c1.id!.compareTo(c2.id!));
    DBHalper.getAllCarOnline().then((value) {
      carOnlineList = value;
      notifyListeners();
    });
  }


  void carAbilityCheck(String newValue) {
    dropdownvalue = newValue;
    notifyListeners();
  }
  Future createDatabaase()async{
    DBHalper.open();
  }

  void getCarImage() async {
    final selecteImage = await ImagePicker().pickImage(source: imageSource);
    if (selecteImage != null) {
      imagePath = selecteImage.path;
    }
    notifyListeners();
  }
  Future<CarModel> getCarById(int id) => DBHalper.getCarById(id);
  Future<bool> addNewCar(CarModel carModel) async {
    final rowId = await DBHalper.insertCar(carModel);
    if(rowId > 0) {
      carModel.id = rowId;
      carList.add(carModel);
      carList.sort((c1, c2) => c1.carName.compareTo(c2.carName));
      notifyListeners();
      return true;
    }
    return false;
  }
  updateCarOnline(int id, int value, int index) {
    DBHalper.updateCarOnline(id, value).then((_) {
      if(carList[index].carAbility=="Available"){
        carList[index].carAbility="Not Available";
      }
      else if(carList[index].carAbility=="Not Available"){
        carList[index].carAbility="Available";
      }
      notifyListeners();
    });
  }



  deleteCar(int id) async {
    final rowId = await DBHalper.deleteCar(id);
    if(rowId > 0) {
      carList.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }

}
