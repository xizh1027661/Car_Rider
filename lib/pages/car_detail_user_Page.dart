import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rant_car/pages/user_booking.dart';

import '../model/car_models.dart';
import '../provider/app_car_helper_provider.dart';



class CarDetailPage extends StatefulWidget {
  static const String routeName="/cardetailpage";
  const CarDetailPage({Key? key}) : super(key: key);

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  late int id;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    id = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    Size screen=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),

      body: Consumer<AppCarHelperProvider>(
        builder:(context,carprovider,_)=>FutureBuilder<CarModel>(
          future: carprovider.getCarById(id),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              final carModel = snapshot.data;
              return ListView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 20),
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20),top:Radius.circular(20)),
                    ),
                    elevation: 10,
                    child: Container(
                      height: screen.height*0.4,
                      width: screen.width*0.9,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top:Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                            borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top:Radius.circular(20)),
                            child: Image.file(File(carModel!.carPicUrl),fit: BoxFit.cover)),

                      ),

                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,

                    child: Container(
                      height: 250,
                      width: screen.width*0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 12),
                        child:  Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(carModel.carName,style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 35,fontWeight: FontWeight.bold,letterSpacing: 3),),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(Icons.car_crash,color: Colors.greenAccent,size: 30,),
                                SizedBox(width: 20,),
                                Text(carModel.place,style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: .5),),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(Icons.attach_money_sharp,color: Colors.green,size: 30,),
                                SizedBox(width: 20,),
                                Text(carModel.carPrice.toString(),style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: .5),),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Card(
                                  elevation: 20,
                                  color: Colors.indigoAccent,
                                  child: Container(
                                    height: 60,
                                    width: 120,
                                    child: TextButton.icon(
                                        onPressed: (){
                                          Navigator.pushReplacementNamed(context,UserBookingPage.routeName,arguments: [carModel.id,carModel.carPrice]);
                                        },
                                        icon: Icon(Icons.bolt,color: Colors.white,),
                                        label: const Text("Book",style: TextStyle(color: Colors.white),)),
                                  ),

                                )
                              ],
                            ),

                          ],
                        )
                      ),

                    ),
                  ),
                ],
              );
            }
            if(snapshot.hasError) {
              return const Text('Failed to fetch data');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
