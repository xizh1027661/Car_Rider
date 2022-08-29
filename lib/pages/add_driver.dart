import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../model/driver_models.dart';
import '../provider/app_driver_helper_provider.dart';


class AddDriver extends StatefulWidget {
  static const String routeName="/adddriver";
  const AddDriver({Key? key}) : super(key: key);

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  final driverIdTextController=TextEditingController();
  final driverNameTextController=TextEditingController();
  final driverSkillTextController=TextEditingController();
  final driverRatingTextController=TextEditingController();
  final driverSalaryTextController=TextEditingController();


  @override
  void dispose() {
    driverIdTextController.dispose();
    driverNameTextController.dispose();
    driverSkillTextController.dispose();
    driverRatingTextController.dispose();
    driverSalaryTextController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    Size screen =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Consumer<AppDriverHalperProvider>(
          builder: (context,provider,_)=> Container(
            height: screen.height*0.8,
            width:  screen.width*0.9,
            color: Colors.indigo.withOpacity(0.1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Card(
                    elevation: 5,
                    child: provider.imagePath==null?Image.asset(
                      'images/user.png',height: screen.height*0.2,
                      width: screen.width*0.7,fit: BoxFit.fitHeight,):
                    Image.file(
                      File(provider.imagePath!),
                      height: 100,width: 100,fit: BoxFit.cover,
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
                            provider.getDriverImage();
                          },
                          child: Text('Camera')),
                      SizedBox(width: 20,),
                      ElevatedButton(
                          onPressed: (){
                            provider.imageSource=ImageSource.gallery;
                            provider.getDriverImage();
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
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: driverIdTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.car_crash),
                            labelText: "Driver Id",
                          ),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,

                    child: Container(
                      height: screen.height*0.08,
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          controller: driverNameTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.car_crash),
                            labelText: "Driver Name",

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
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child:  Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child: Icon(Icons.shield,color: Colors.orange)),
                            Expanded(
                              flex: 4,
                              child: DropdownButton(
                                isExpanded: true,
                                value: provider.skillDropdownValue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items:provider.driverSkills.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  provider.driverskillCheack(newValue!);
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
                      width: screen.width*0.7,
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
                                items:provider.iteam.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  provider.driverAbilityCheck(newValue!);
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
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: driverRatingTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.star),
                            labelText: "Rating",
                            hintText: "Max 10"

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
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: driverSalaryTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.attach_money,color: Colors.green,),
                            labelText: "Salary",

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
                          _saveDriverData();
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
  void _saveDriverData() async {
    final provider = Provider.of<AppDriverHalperProvider>(context, listen: false);
    if(validationCheck()==true) {
      final driverModel = DriverModel(
          id: int.parse(driverIdTextController.text),
          driverImageUrl: provider.imagePath!,
          driverName: driverNameTextController.text,
          driverSkill: provider.skillDropdownValue,
          driverRating: driverRatingTextController.text,
          driverAbility: provider.dropdownvalue,
          driverSalary: double.parse(driverSalaryTextController.text));
      print(driverModel.toString());
      final status = await provider.addNewDriver(driverModel);
      if (status) {
        driverIdTextController.clear();
        driverNameTextController.clear();
        driverRatingTextController.clear();
        driverSalaryTextController.clear();
        provider.imagePath = null;
        Navigator.pop(context);
      }
    }
  }
  bool validationCheck(){
    final provider = Provider.of<AppDriverHalperProvider>(context, listen: false);
    if(provider.imagePath==null||provider.imagePath==""){
      showConfirmationDialog("car image");
      return false;
    }
    else if(driverIdTextController.text.trim()==null||driverIdTextController.text.trim()==""){
      showConfirmationDialog("Driver id");
      return false;
    }
    else if(driverNameTextController.text.trim()==null||driverNameTextController.text.trim()==""){
      showConfirmationDialog("Driver name");
      return false;
    }
    else if(driverRatingTextController.text.trim()==null||driverRatingTextController.text.trim()==""){
      showConfirmationDialog("Driver Rating");
      return false;
    }
    else if(driverSalaryTextController.text.trim()==null||driverSalaryTextController.text.trim()==""){
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
