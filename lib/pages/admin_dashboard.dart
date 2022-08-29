import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rant_car/pages/widget.dart';

import '../provider/app_car_helper_provider.dart';
import '../provider/app_driver_helper_provider.dart';
import '../provider/app_fare_halper_provider.dart';
import 'Add Car.dart';
import 'add_driver.dart';
import 'addfare.dart';
import 'decider_page.dart';


class AdminDashBoard extends StatefulWidget {
  static const String routeName="/admindashboard";
  const AdminDashBoard({Key? key}) : super(key: key);

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {

  @override
  Widget build(BuildContext context) {
    Size screen =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.verified_user),
        title: const Text("Admin DashBoard"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context,DeciderPage.routeName);
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        color: Colors.white12,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screen.width,
                  height: screen.height*0.4,
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 10,
                          color: Colors.white,
                          child: Container(
                              height: screen.height*0.3,
                              child: TextButton.icon(onPressed: (){
                                Navigator.pushNamed(context, AddCar.routeName);
                              }, icon: Icon(Icons.add), label: Text("Add car"))),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 10,
                          color: Colors.indigo,
                          child: Container(
                              height: screen.height*0.3,
                              child: TextButton.icon(onPressed: (){
                                Navigator.pushNamed(context, AddDriver.routeName);}
                                  , icon: Icon(Icons.add,color: Colors.white,), label: Text("Add Driver",style: TextStyle(color: Colors.white),))),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 10,
                          color: Colors.white,
                          child: Container(
                              height: screen.height*0.3,
                              child: TextButton.icon(onPressed: (){
                                Navigator.pushNamed(context, AddFare.routeName);

                              }, icon: Icon(Icons.add), label: Text("Add Fare"))),
                        ),
                      ),

                    ],
                  ),
                ),
                Text("Cars",style: TextStyle(fontSize: 25,color: Colors.indigo,fontWeight: FontWeight.bold),),
                SizedBox(height: screen.width*0.03,),
                Consumer<AppCarHelperProvider>(builder: (context,provider,_)=>
                    Container(
                      width: screen.width,
                      height:screen.height*0.4,
                    child: ListView.builder(scrollDirection: Axis.horizontal,itemCount:provider.carList.length,itemBuilder: (context,iteam){
                      final carmodel=provider.carList[iteam];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Dismissible(
                            key: ValueKey(carmodel.id),
                            direction: DismissDirection.up,
                            confirmDismiss: _showConfirmationDialog,
                            onDismissed: (direction) {
                              provider.deleteCar(carmodel.id);
                            },
                            child: InkWell(
                                onTap: (){
                                  provider.updateCarOnline(carmodel.id,carmodel.carAbility=="Available"?0:1, iteam);
                                },
                                child: CustomAdminCarListTile(carName:carmodel.carName, place:carmodel.place, carPicUrl: carmodel.carPicUrl, carPrice:carmodel.carPrice,carAbility: carmodel.carAbility=="Available"?true:false, hight: screen.height*0.3, width: screen.width*0.75))),
                      );


                    }),

                  ),
                ),
                SizedBox(height: screen.width*0.03,),
                Text("Drivers",style: TextStyle(fontSize: 25,color: Colors.indigo),),
                SizedBox(height: screen.width*0.03,),
                Consumer<AppDriverHalperProvider>(builder: (context,provider,_)=> Container(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        width: screen.width,
                        height: screen.height*0.5,
                        child: ListView.builder(scrollDirection: Axis.vertical,itemCount:provider.driverList.length ,itemBuilder: (context,iteam){
                          final drivermodel=provider.driverList[iteam];
                          return Card(
                            elevation: 10,
                            color: Colors.indigo,
                            child: Container(
                                color: Colors.white30,
                                child: Dismissible(
                                  key: ValueKey(drivermodel.id),
                                  direction: DismissDirection.endToStart,
                                  confirmDismiss: _showConfirmationDialog,
                                  onDismissed: (direction) {
                                    provider.deleteDriver(drivermodel.id);
                                  },
                                  child: InkWell(
                                      onTap: (){

                                      },
                                      child: CustomAdminListTile(imageurl: drivermodel.driverImageUrl, name:drivermodel.driverName, skill: drivermodel.driverSkill, rating: drivermodel.driverRating,
                                        price: drivermodel.driverSalary.toString(),driverAvility: drivermodel.driverAbility=="Available"?true:false ,hight: screen.height,width: screen.width,)),
                                )),
                          );



                        }),

                      ),
                  ),
                ),
                ),
                SizedBox(height: screen.width*0.03,),
                Text("Popular Fares",style: TextStyle(fontSize: 25,color: Colors.indigo),),
                Consumer<AppFareHalperProvider>(builder: (context,provider,_)=> Container(

                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: screen.width,
                      height: screen.height*0.5,
                      child: ListView.builder(scrollDirection: Axis.vertical,itemCount:provider.fareList.length ,itemBuilder: (context,iteam){
                        final faremodel=provider.fareList[iteam];
                        return Card(
                          elevation: 10,
                          color: Colors.white,
                          child: Container(
                              color: Colors.white30,
                              child: Dismissible(
                                key: ValueKey(faremodel.id),
                                direction: DismissDirection.endToStart,
                                confirmDismiss: _showConfirmationDialog,
                                onDismissed: (direction) {
                                  provider.deletefare(faremodel.id);
                                },
                                child: InkWell(
                                    onTap: (){

                                    },
                                    child: CustomAdminFareListTile(
                                        fareStartPlace: faremodel.startPlace,
                                        fareEndPlace: faremodel.endPlace,
                                        fare: faremodel.fare,
                                        hight: screen.height, width: screen.width)),
                              )),
                        );



                      }),

                    ),
                  ),
                ),
                ),


              ],
            ),
          ),
        ),
      ),


    );
  }
  Future<bool?> _showConfirmationDialog(DismissDirection direction) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title:  Text('D e l e t e'),
          content: Text('Are you sure to delete this?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('NO'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('YES'),
            ),
          ],
        ));
  }
}
