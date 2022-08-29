import 'package:flutter/material.dart';

import 'admin_dashboard.dart';


class AdminLogIn extends StatefulWidget {
  static const String routeName="/adminligin";
  const AdminLogIn({Key? key}) : super(key: key);

  @override
  State<AdminLogIn> createState() => _AdminLogInState();
}

class _AdminLogInState extends State<AdminLogIn> {
  final emailTextController=TextEditingController();
  final passwordTextController=TextEditingController();
  bool isObscure = true;


  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        child: Card(
          elevation: 15,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              height: screen.height*0.9,
              width: screen.width*0.9,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: screen.height*0.1,),
                  Text("ADMIN PANEL",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade700,
                        letterSpacing: 3,

                    ),
                  ),
                  SizedBox(height: screen.height*0.15,),
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
                        child: TextField(
                          controller: emailTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email",

                          ),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 25,),
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
                        child: TextField(
                          controller: passwordTextController,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                                onPressed: (){
                                  setState((){
                                    isObscure = !isObscure;
                                  });
                                },
                              ),
                          ),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: screen.height*0.03,),
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
                          String email=emailTextController.text;
                          String password=passwordTextController.text;
                          if(email=="admin"&&password=="admin"){
                            Navigator.pushReplacementNamed(context, AdminDashBoard.routeName);
                          }

                        }, child: Text("Log In")),
                      ),

                    ),
                  ),


                ],

              ),
            ),
          ),
        ),
      )



    );
  }
}
