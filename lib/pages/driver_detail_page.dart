import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../model/driver_models.dart';
import '../provider/app_driver_helper_provider.dart';

class DriverDetailPage extends StatefulWidget {
  static const String routeName="/driverdetailpage";
  const DriverDetailPage({Key? key}) : super(key: key);

  @override
  State<DriverDetailPage> createState() => _DriverDetailPageState();
}

class _DriverDetailPageState extends State<DriverDetailPage> {
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
      appBar: AppBar(

      ),
      body: Center(
        child: Consumer<AppDriverHalperProvider>(
          builder: (context,provider,_)=> Container(
            height: screen.height*0.8,
            width:  screen.width*0.9,
            color: Colors.indigo.withOpacity(0.1),
            child: FutureBuilder<DriverModel>(
              future: provider.getDriverById(id),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  final driverModel = snapshot.data;
                  return ListView(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    children: [
                      SizedBox(height: 30,),
                      CircleAvatar(
                        radius: 60,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                          ),
                          elevation: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(driverModel!.driverImageUrl),height:120,width:120,fit: BoxFit.cover,
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
                          height:60,
                          width: screen.width*0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Row(
                              children: [
                                Icon(Icons.person,color: Colors.orange,size: 25,),
                                SizedBox(width: 20,),
                                Text(driverModel.driverName,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo,fontSize: 25),),
                              ],
                            )
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
                          height: 60,
                          width: screen.width*0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.shield,color: Colors.greenAccent,size: 25,),
                                  SizedBox(width: 20,),
                                  Text(driverModel.driverSkill,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo,fontSize: 25),),
                                ],
                              )
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
                              child: Row(
                                children: [
                                  Icon(Icons.star,color: Colors.yellow,size: 25,),
                                  SizedBox(width: 20,),
                                  Text(driverModel.driverRating,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo,fontSize: 25),),
                                ],
                              )
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
                              child: Row(
                                children: [
                                  Icon(Icons.attach_money_sharp,color: Colors.green,size: 25,),
                                  SizedBox(width: 20,),
                                  Text(driverModel.driverSalary.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo,fontSize: 25),),
                                ],
                              )
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 50,
                          width:100,
                          color: Colors.indigoAccent,
                          child: TextButton.icon(onPressed: (){},
                              icon: Icon(Icons.bolt,color: Colors.yellow,),
                              label: const Text("Book",style: TextStyle(color: Colors.white),)),
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
        ),
      ),
    );
  }
}
