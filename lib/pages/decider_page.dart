import 'package:flutter/material.dart';
import 'package:rant_car/pages/user_page.dart';

import 'admin_login.dart';


class DeciderPage extends StatefulWidget {
  static const String routeName="/deciderpage";
  const DeciderPage({Key? key}) : super(key: key);

  @override
  State<DeciderPage> createState() => _DeciderPageState();
}

class _DeciderPageState extends State<DeciderPage> {
  @override
  Widget build(BuildContext context) {
    Size screen=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screen.height,
        width: screen.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/c5.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Card(
          color: Colors.white10,
          elevation: 20,
          child: Container(
            height: screen.height*0.8,
            width: screen.width*0.8,
            color: Colors.blueGrey.withOpacity(0.1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screen.height*0.1,),
                  Text("LUXARY",style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 3
                  ),),
                  Text("CAR",style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 3
                  ),),
                  Text("RENTAL",style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 3
                  ),),

                  SizedBox(height: screen.height*0.05,),
                  Text("Premium And Prestigious Car Hourly Rental",style: TextStyle(
                    fontSize: 15,
                    color: Colors.white60,
                    letterSpacing: 2
                  ),),
                  SizedBox(height: 5,),
                  Text("Exprience The Thrill At A Lower Price",style: TextStyle(
                      fontSize: 15,
                      color: Colors.white60,
                      letterSpacing: 2
                  ),),
                  SizedBox(height: screen.height*0.30,),
                  Container(
                    height: screen.height*0.07,
                    width: screen.width*0.6,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, UserPage.routeName);
                        },
                        child: Text("GET STARTED",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.indigo,
                            letterSpacing: 2

                        ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, AdminLogIn.routeName);
                  }, child:Text("ADMIN LOG IN",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        letterSpacing: 3

                    ),
                  ) ),

                ],

              ),
            ),
          ),
        ),
      ),





    );
  }
}
