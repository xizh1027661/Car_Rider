
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rant_car/pages/widget.dart';


import '../provider/app_car_helper_provider.dart';
import '../provider/app_driver_helper_provider.dart';
import '../provider/app_fare_halper_provider.dart';
import 'car_detail_user_Page.dart';
import 'driver_detail_page.dart';

class UserPage extends StatefulWidget {
  static const String routeName="/userpage";
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final carProvider=Provider.of<AppCarHelperProvider>(context,listen: false);
    final driverProvider=Provider.of<AppDriverHalperProvider>(context,listen: false);
    carProvider.getAllCarDetailsOnline();
    driverProvider.getAllDriverDetailsOnline();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    Size screen =MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: screen.width*0.03,),
            Card(
              elevation: 10,
              child: Container(
                width: screen.width,
                height: screen.height*0.08,
                color: Colors.indigo,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                  child: Text("Popular Fare ",style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1
                  ),),
                ),
              ),
            ),

            Consumer<AppFareHalperProvider>(builder: (context,provider,_)=> Container(

              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: screen.width,
                  height: screen.height*0.4,
                  child: ListView.builder(scrollDirection: Axis.vertical,itemCount:provider.fareList.length ,itemBuilder: (context,iteam){
                    final faremodel=provider.fareList[iteam];
                    return Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Container(
                          color: Colors.white30,
                          child: InkWell(
                              onTap: (){
                              },
                              child: CustomAdminFareListTile(
                                  fareStartPlace: faremodel.startPlace,
                                  fareEndPlace: faremodel.endPlace,
                                  fare: faremodel.fare,
                                  hight: screen.height, width: screen.width))),
                    );
                  }),

                ),
              ),
            ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              child: Text("Choose A Car",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                  letterSpacing: 1
              ),),
            ),
            Consumer<AppCarHelperProvider>(builder: (context,carprovider,_)=> Container(
              width: screen.width,
              height:screen.height*0.5,
              color: Colors.white,
              child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: carprovider.carOnlineList.length
                  ,itemBuilder: (context,iteam){
                    final carModel=carprovider.carOnlineList[iteam];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context,CarDetailPage.routeName,arguments: carModel.id);
                          },
                          child: CustomCarListTile(carName: carModel.carName, place:carModel.place, carPicUrl: carModel.carPicUrl, carPrice: carModel.carPrice, hight: screen.height*0.35, width: screen.width*0.75)),
                    );


                  }),
            ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              child: Text("Top Drivers",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                  letterSpacing: 1
              ),),
            ),
            Card(
              elevation: 10,
              color: Colors.indigo,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Consumer<AppDriverHalperProvider>(builder: (context,provider,_)=> Container(
                  width: screen.width,
                  height:screen.height*0.5,
                  color: Colors.white,
                  child: ListView.builder(scrollDirection: Axis.vertical,itemCount:provider.driverOnlineList.length ,itemBuilder: (context,iteam){
                    final drivermodel=provider.driverOnlineList[iteam];
                    return Card(
                        elevation: 10,
                        child: Container(
                          color: Colors.white30,
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, DriverDetailPage.routeName,arguments: drivermodel.id);
                            },
                            child: CustomListTile(imageurl: drivermodel.driverImageUrl, name:drivermodel.driverName, skill: drivermodel.driverSkill, rating: drivermodel.driverRating,
                              price: drivermodel.driverSalary.toString(),driverAvility: drivermodel.driverAbility=="Available"?true:false ,hight: screen.height,width: screen.width,),
                          ),
                        ));
                  }),
                ),
                ),
              ),
            ),
            SizedBox(height: 10,),


          ],

        ),
      ),
    );
  }
}

