import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/user_booking_model.dart';
import '../provider/app_fare_halper_provider.dart';


class UserBookingPage extends StatefulWidget {
  static const String routeName="/userbokingpage";
  const UserBookingPage({Key? key}) : super(key: key);

  @override
  State<UserBookingPage> createState() => _UserBookingPageState();
}

class _UserBookingPageState extends State<UserBookingPage> {
  late int carID;
  late double carfare;
  final placeorderUserAddress=TextEditingController();
  final placeorderuserName=TextEditingController();
  final placeorderNumber=TextEditingController();
  final placeorderDestination=TextEditingController();
  String? dateOfBook;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    List mapl=ModalRoute.of(context)!.settings.arguments as List;
    carID=mapl[0];
    carfare=mapl[1];

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    Size screen=MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Consumer<AppFareHalperProvider>(
          builder: (context,provider,_)=> Container(
            height: screen.height*0.8,
            width:  screen.width*0.9,
            color: Colors.indigo.withOpacity(0.1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                    child: Container(
                      height: 100,
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton.icon(onPressed: _ShowDate, icon:Icon(Icons.date_range), label:const Text("Select Date")),
                            Chip(backgroundColor: Colors.purple.shade900.withOpacity(.4),
                                label:dateOfBook==null? Text("No Date Chosen"):Text(dateOfBook!)),

                          ],
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
                      height: 80,
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          controller: placeorderuserName,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.car_crash),
                            labelText: "User Name",
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
                      height: 80,
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: placeorderUserAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_city),
                            labelText: "User Address",

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
                      height: 80,
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: placeorderDestination,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.navigation),
                            labelText: "User Destination",
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
                      height: 80,
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: placeorderNumber,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.car_crash),
                            labelText: "User Number",
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
                          _saveUserData();
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
  void _ShowDate() async {

    DateTime? selectedTime= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1940), lastDate: DateTime(2100));
    if(selectedTime!=null){
      setState((){
        dateOfBook=DateFormat("dd/MM/yyyy").format(selectedTime);
      });
    }


  }
  void _saveUserData() async {
    final provider = Provider.of<AppFareHalperProvider>(context, listen: false);
    if(validationCheck()==true) {
      final placeOrder = PlaceOrder(
          id: "${placeorderuserName.text}-${placeorderNumber.text}",
          userName: placeorderuserName.text,
          userNumber: placeorderNumber.text,
          userAddress: placeorderUserAddress.text,
          destination: placeorderDestination.text,
          date: dateOfBook.toString(),
          carID: carID,
          fare: carfare);
      print(placeOrder.toString());
      final status = await provider.addOrder(placeOrder);
      if (status) {
        placeorderuserName.clear();
        placeorderNumber.clear();
        placeorderUserAddress.clear();
        placeorderDestination.clear();
        Navigator.pop(context);
      }
    }
  }
  bool validationCheck(){
    if(placeorderuserName.text.trim()==null||placeorderuserName.text.trim()==""){
      showConfirmationDialog("User name");
      return false;
    }
    else if(placeorderDestination.text.trim()==null||placeorderDestination.text.trim()==""){
      showConfirmationDialog("Distenation");
      return false;
    }
    else if(placeorderNumber.text.trim()==null||placeorderNumber.text.trim()==""){
      showConfirmationDialog("Number");
      return false;
    }
    else if(placeorderUserAddress.text.trim()==null||placeorderUserAddress.text.trim()==""){
      showConfirmationDialog("Address");
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
