import 'dart:io';

import 'package:flutter/material.dart';




class CustomListTile extends StatelessWidget {
  String imageurl;
  String name;
  String skill;
  String rating;
  String price;
  bool driverAvility;
  double hight;
  double width;


  CustomListTile({required this.imageurl,required this.name,required this.skill,
    required this.rating,required this.price,required this.driverAvility,required this.hight,required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: hight*.2,
          width: width*0.8,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child:Card(
                    color: Colors.indigo,
                    elevation: 10,
                    child: Image.file(File(imageurl),height: 100,width: 100,fit:BoxFit.cover,)),),
              Expanded(
                  flex: 4,
                  child:Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(name,style: TextStyle(color: Colors.indigo,fontSize: 22,fontWeight: FontWeight.bold,letterSpacing: 2),),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("Skills--",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w300,fontSize: 16,letterSpacing: 1),),
                              Spacer(),
                              Text(skill,style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w600,fontSize: 16,letterSpacing: 0.3),),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Rating--",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w300,fontSize: 16,letterSpacing: 1),),
                              Spacer(),
                              Icon(Icons.star,color: Colors.orange,size: 18,),
                              Text(rating,style: TextStyle(color: Colors.indigo,fontSize: 16),),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Price--",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w300,fontSize: 16,letterSpacing: 1),),
                              Spacer(),
                              Icon(Icons.attach_money,color: Colors.green,size: 18,),
                              Text(price,style: TextStyle(color: Colors.indigo,fontSize: 16),),
                            ],
                          ),
                        ],

                      ),
                    ),) ),

            ],
          ),
        ),
      ),
    );
  }
}

class CustomAdminListTile extends StatelessWidget {
  String imageurl;
  String name;
  String skill;
  String rating;
  String price;
  bool driverAvility;
  double hight;
  double width;


  CustomAdminListTile({required this.imageurl,required this.name,required this.skill,
    required this.rating,required this.price,required this.driverAvility,required this.hight,required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: hight*.2,
          width: width*0.8,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child:Card(
                  color: Colors.indigo,
                  elevation: 10,
                  child: Image.file(File(imageurl),height: 100,width: 100,fit:BoxFit.cover,)),),
              Expanded(
                  flex: 4,
                  child:Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(name,style: TextStyle(color: Colors.indigo,fontSize: 22,fontWeight: FontWeight.bold,letterSpacing: 2),),
                              Icon(Icons.circle,color: driverAvility==true? Colors.green:Colors.red)
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("Skills--",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w300,fontSize: 16,letterSpacing: 1),),
                              Spacer(),
                              Text(skill,style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w600,fontSize: 16,letterSpacing: 0.3),),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Rating--",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w300,fontSize: 16,letterSpacing: 1),),
                              Spacer(),
                              Icon(Icons.star,color: Colors.orange,size: 18,),
                              Text(rating,style: TextStyle(color: Colors.indigo,fontSize: 16),),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Price--",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w300,fontSize: 16,letterSpacing: 1),),
                              Spacer(),
                              Icon(Icons.attach_money,color: Colors.green,size: 18,),
                              Text(price,style: TextStyle(color: Colors.indigo,fontSize: 16),),
                            ],
                          ),
                        ],

                      ),
                    ),) ),

            ],
          ),
        ),
      ),
    );
  }
}

class CustomCarListTile extends StatelessWidget {
  String carName;
  String place;
  String carPicUrl;
  double carPrice;
  double hight;
  double width;


  CustomCarListTile({required this.carName,required this.place,required this.carPicUrl,required this.carPrice,required this.hight,required this.width});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.indigo,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: hight,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisSize:  MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(carName,style: TextStyle(
                  fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 1,color:Colors.deepPurple,
                ),),
                SizedBox(height: 5,),
                Text(place,style: TextStyle(
                  fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 1,color:Colors.deepPurple,
                ),),
                SizedBox(height: 10,),
                Card(
                  elevation: 10,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(File(carPicUrl),fit: BoxFit.cover,height: hight*.65,width: width,)),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.attach_money,color: Colors.green,size:30),
                    Text("${carPrice}".toString(),style: TextStyle(
                      fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 1.5,color:Colors.deepPurple,
                    ),),
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class CustomAdminCarListTile extends StatelessWidget {
  String carName;
  String place;
  String carPicUrl;
  double carPrice;
  bool carAbility;
  double hight;
  double width;


  CustomAdminCarListTile({required this.carName,required this.place,required this.carPicUrl,required this.carPrice,required this.carAbility,required this.hight,required this.width});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.indigo,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            height: hight,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisSize:  MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(carName,style: TextStyle(
                          fontSize: 22,fontWeight: FontWeight.bold,letterSpacing: .4,color:Colors.deepPurple,
                        ),),
                      ),
                      Expanded(
                        flex: 1,
                          child:Icon(Icons.circle,color: carAbility==true? Colors.green:Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text(place,style: TextStyle(
                    fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 1,color:Colors.deepPurple,
                  ),),
                  SizedBox(height: 10,),
                  Card(
                    elevation: 10,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(File(carPicUrl),fit: BoxFit.cover,height: hight*.65,width: width,)),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.attach_money,color: Colors.green,size:30),
                      Text("${carPrice}".toString(),style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 1.5,color:Colors.deepPurple,
                      ),),
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

}

class CustomAdminFareListTile extends StatelessWidget {
  String fareStartPlace;
  String fareEndPlace;
  double fare;
  double hight;
  double width;


  CustomAdminFareListTile(
      {required this.fareStartPlace,
      required this.fareEndPlace,
      required this.fare,
      required this.hight,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.indigo,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            height: hight*0.15,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize:  MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.navigation_outlined,color:Colors.orange),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(fareStartPlace,style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: .4,color:Colors.deepPurple,
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.navigation_outlined,color:Colors.indigo),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(fareEndPlace,style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: .4,color:Colors.deepPurple,
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.attach_money,color: Colors.green,size:30),
                        Text("${fare}".toString(),style: TextStyle(
                          fontSize: 22,fontWeight: FontWeight.bold,letterSpacing: 1.5,color:Colors.deepPurple,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

}










