import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';


import '../model/car_models.dart';
import '../provider/app_car_helper_provider.dart';

class AddCar extends StatefulWidget {
  static const String routeName="/addcar";
  const AddCar({Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final carNameTextController=TextEditingController();
  final carPriceTextController=TextEditingController();
  final carPlaceTextController=TextEditingController();
  final carIdTextController=TextEditingController();
  @override
  void dispose() {
    carNameTextController.dispose();
    carPlaceTextController.dispose();
    carPriceTextController.dispose();
    carIdTextController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    Size screen =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Container(
          height: screen.height*0.8,
          width:  screen.width*0.9,
          color: Colors.indigo.withOpacity(0.1),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Consumer<AppCarHelperProvider>(
              builder: (context,provider,_)=> Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    child: provider.imagePath==null?Image.asset(
                      'images/c1.jpg',height: 100,
                      width: 100,fit: BoxFit.cover,):
                    Image.file(
                      File(provider.imagePath!),
                      height: screen.height*0.2,width: screen.width*0.6,fit: BoxFit.cover,
                    )
                    ,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            provider.imageSource=ImageSource.camera;
                            provider.getCarImage();
                          },
                          child: Text('Camera')),
                      SizedBox(width: 20,),
                      ElevatedButton(
                          onPressed: (){
                            provider.imageSource=ImageSource.gallery;
                            provider.getCarImage();
                          },
                          child: Text('Gallary')),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,

                    child: Container(
                      height: screen.height*0.08,
                      width: screen.width*0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: carIdTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.car_rental),
                            labelText: "Car ID",
                          ),
                        ),
                      ),

                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,

                    child: Container(
                      height: screen.height*0.08,
                      width: screen.width*0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: carNameTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.car_crash),
                            labelText: "Car Name",

                          ),
                        ),
                      ),

                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,

                    child: Container(
                      height: screen.height*0.08,
                      width: screen.width*0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: carPlaceTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.navigation),
                            labelText: "Car Place ",

                          ),
                        ),
                      ),

                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,

                    child: Container(
                      height: screen.height*0.08,
                      width: screen.width*0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child:  Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child: Icon(Icons.circle,color: provider.dropdownvalue=="Available"?Colors.green:Colors.red,)),
                            Expanded(
                              flex: 4,
                              child: DropdownButton(
                                isExpanded: true,
                                value: provider.dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items:provider.items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  provider.carAbilityCheck(newValue!);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,

                    child: Container(
                      height: screen.height*0.08,
                      width: screen.width*0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: carPriceTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.attach_money),
                            labelText: "Price",

                          ),
                        ),
                      ),

                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,

                    child: Container(
                      height: screen.height*0.08,
                      width: screen.width*0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextButton(onPressed: (){
                                    _saveCarData();
                        }, child: Text("Save")),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),


        ),
      ),
    );
  }
  void _saveCarData() async {
    final provider = Provider.of<AppCarHelperProvider>(context, listen: false);
      if(validationCheck()==true) {
        final carModel = CarModel(
            id: int.parse(carIdTextController.text),
            carName: carNameTextController.text.trim(),
            place: carPlaceTextController.text.trim(),
            carPicUrl: provider.imagePath!,
            carPrice: double.parse(carPriceTextController.text.trim()),
            carAbility: provider.dropdownvalue);
        print(carModel.toString());
        final status = await provider.addNewCar(carModel);
        if (status) {
          carIdTextController.clear();
          carNameTextController.clear();
          carPriceTextController.clear();
          carPlaceTextController.clear();
          provider.imagePath = null;
          Navigator.pop(context);
        }
      }
  }
  bool validationCheck(){
    final provider = Provider.of<AppCarHelperProvider>(context, listen: false);
    if(provider.imagePath==null||provider.imagePath==""){
      showConfirmationDialog("car image");
      return false;
    }
    else if(carIdTextController.text.trim()==null||carIdTextController.text.trim()==""){
      showConfirmationDialog("car id");
      return false;
    }
    else if(carNameTextController.text.trim()==null||carNameTextController.text.trim()==""){
      showConfirmationDialog("car name");
      return false;
    }
    else if(carPlaceTextController.text.trim()==null||carPlaceTextController.text.trim()==""){
      showConfirmationDialog("car place");
      return false;
    }
    else if(carPriceTextController.text.trim()==null||carPriceTextController.text.trim()==""){
      showConfirmationDialog("car price");
      return false;
    }

    return true;
  }
   showConfirmationDialog(String title) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title:  Text('Give a  $title'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Ok'),
            ),
          ],
        ));
  }

}

