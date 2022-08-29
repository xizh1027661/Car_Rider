import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/fare_model.dart';
import '../provider/app_fare_halper_provider.dart';


class AddFare extends StatefulWidget {
  static const String routeName="/addfare";
  const AddFare({Key? key}) : super(key: key);

  @override
  State<AddFare> createState() => _AddFareState();
}

class _AddFareState extends State<AddFare> {
  final fareIdController=TextEditingController();
  final startPlaceController=TextEditingController();
  final endPlaceController=TextEditingController();
  final fareController=TextEditingController();



  @override
  void dispose() {
    fareIdController.dispose();
    startPlaceController.dispose();
    endPlaceController.dispose();
    fareController.dispose();
    super.dispose();

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final provider=Provider.of<AppFareHalperProvider>(context,listen: false);
    provider.getCarNames(context);
    provider.getDriverNames(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size screen =MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async{
        final provider = Provider.of<AppFareHalperProvider>(context, listen: false);
        provider.carDropDown=provider.iteams[0];
        provider.driverdropdownvalue=provider.driverdropdownList[0];
        return true;
      },
      child: Scaffold(
        appBar: AppBar(

        ),
        body: Consumer<AppFareHalperProvider>(
          builder: (context,provider,_)=> Center(
            child: SingleChildScrollView(
              child: Container(
                height: screen.height*0.7,
                width:  screen.width*0.9,
                color: Colors.indigo.withOpacity(0.1),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                            controller: fareIdController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.numbers,color: Colors.orange,),
                              labelText: "ID",

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
                            controller: startPlaceController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.navigation_outlined,color:Colors.green),
                              labelText: "Start",

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
                            controller: endPlaceController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_on,color: Colors.red,),
                              labelText: "End",

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
                              Expanded(child: Icon(Icons.car_crash,color: Colors.indigo,)),
                              Expanded(
                                flex: 4,
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: provider.carDropDown,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items:provider.iteams.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    provider.carDropdownCheck(newValue!);
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
                              Expanded(child: Icon(Icons.person,color: Colors.orange,)),
                              Expanded(
                                flex: 4,
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: provider.driverdropdownvalue,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items:provider.driverdropdownList.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    print(newValue);

                                    provider.driverDropdownCheck(newValue!);
                                    print(provider.driverdropdownvalue);
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
                            controller: fareController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.attach_money,color: Colors.green,),
                              labelText: "Fare",

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
      ),
    );
  }
  void _saveDriverData() async {
    final provider = Provider.of<AppFareHalperProvider>(context, listen: false);
    if(validationCheck()==true) {
      final fareByDistanceModel = FareByDistence(
          id: int.parse(fareIdController.text.trim()),
          startPlace: startPlaceController.text.trim(),
          endPlace: endPlaceController.text.trim(),
          carId: int.parse(provider.carDropDown.substring(0,provider.carDropDown.indexOf('-'))),
          driverId: int.parse(provider.driverdropdownvalue.substring(0,provider.driverdropdownvalue.indexOf('-'))),
          fare: double.parse(fareController.text),
          fareAbility: "Available");
      print(fareByDistanceModel.toString());
      final status = await provider.addFare(fareByDistanceModel);
      if (status) {
        fareIdController.clear();
        startPlaceController.clear();
        endPlaceController.clear();
        fareController.clear();
        provider.carDropDown=provider.iteams[0];
        provider.driverdropdownvalue=provider.driverdropdownList[0];
        Navigator.pop(context);

      }
    }
  }
  bool validationCheck(){
    if(fareIdController==null||fareIdController==""){
      showConfirmationDialog("Fare id");
      return false;
    }
    else if(startPlaceController.text.trim()==null||startPlaceController.text.trim()==""){
      showConfirmationDialog("Start place");
      return false;
    }
    else if(endPlaceController.text.trim()==null||endPlaceController.text.trim()==""){
      showConfirmationDialog("End place");
      return false;
    }
    else if(fareController.text.trim()==null||fareController.text.trim()==""){
      showConfirmationDialog("Fare");
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
