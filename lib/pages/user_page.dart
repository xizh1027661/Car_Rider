
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







// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rant_car/pages/widget.dart';
//
// import '../provider/app_car_helper_provider.dart';
// import '../provider/app_driver_helper_provider.dart';
// import '../provider/app_fare_halper_provider.dart';
// import 'car_detail_user_Page.dart';
// import 'driver_detail_page.dart';
//
// import 'dart:async';
// import 'dart:developer';
// import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
// import '/question_answer.dart';
// import 'package:flutter/material.dart';
//
// // const String usage = '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';     // leaked! July 16, 2023
// const usage = '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';
// const apiKey = usage;
//
// class UserPage extends StatefulWidget {
//   static const String routeName = "/userpage";
//   const UserPage({Key? key}) : super(key: key);
//
//   @override
//   State<UserPage> createState() => _UserPageState();
// }
//
// class _UserPageState extends State<UserPage> {
//   String? answer;
//   final chatGpt = ChatGpt(apiKey: apiKey);
//   bool loading = false;
//   final testPrompt =
//       'Which Disney character famously leaves a glass slipper behind at a royal ball?';
//
//   final List<QuestionAnswer> questionAnswers = [];
//
//   late TextEditingController textEditingController;
//
//   StreamSubscription<StreamCompletionResponse>? streamSubscription;
//
//   @override
//   void initState() {
//     textEditingController = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     textEditingController.dispose();
//     streamSubscription?.cancel();
//     super.dispose();
//   }
//
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     final carProvider =
//         Provider.of<AppCarHelperProvider>(context, listen: false);
//     final driverProvider =
//         Provider.of<AppDriverHalperProvider>(context, listen: false);
//     carProvider.getAllCarDetailsOnline();
//     driverProvider.getAllDriverDetailsOnline();
//     super.didChangeDependencies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size screen = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             SizedBox(
//               height: screen.width * 0.03,
//             ),
//             Card(
//               elevation: 10,
//               child: Container(
//                 width: screen.width,
//                 height: screen.height * 0.08,
//                 color: Colors.indigo,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
//                   child: Text(
//                     "Popular Fare ",
//                     style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         letterSpacing: 1),
//                   ),
//                 ),
//               ),
//             ),
//
//             Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Container(
//                   width: screen.width,
//                   height: screen.height * 0.4,
//                   child: Column(children: [
//                     // Text('TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT'),
//                     // Text('QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ'),
//
//                     // Text(
//                     //   "ChatGPT",
//                     //   style: TextStyle(color: Colors.blue, fontSize: 30.0),
//                     // ),
//
//
//                     Expanded(
//                       child: ListView.separated(
//                         itemCount: questionAnswers.length,
//                         itemBuilder: (context, index) {
//                           final questionAnswer = questionAnswers[index];
//                           final answer =
//                               questionAnswer.answer.toString().trim();
//                           print(answer);
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               Text('Q: ${questionAnswer.question}'),
//                               const SizedBox(height: 12),
//                               if (answer.isEmpty && loading)
//                                 const Center(child: CircularProgressIndicator())
//                               else
//                                 //print(answer),
//                                 Text('A: $answer'),
//                             ],
//                           );
//                         },
//                         separatorBuilder: (context, index) =>
//                             const SizedBox(height: 12),
//                       ),
//                     ),
//
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             controller: textEditingController,
//                             decoration:
//                                 const InputDecoration(hintText: 'Type in...'),
//                             onFieldSubmitted: (_) => _sendMessage(),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         ClipOval(
//                           child: Material(
//                             color: Colors.blue, // Button color
//                             child: InkWell(
//                               onTap: _sendMessage,
//                               child: const SizedBox(
//                                 width: 48,
//                                 height: 48,
//                                 child: Icon(
//                                   Icons.send_rounded,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ]),
//                 )
//             ),
//
//
//
//
//             // Consumer<AppFareHalperProvider>(builder: (context,provider,_)=> Container(
//             //
//             //   child: Padding(
//             //     padding: const EdgeInsets.all(2.0),
//             //     child: Container(
//             //       width: screen.width,
//             //       height: screen.height*0.1,
//             //       child: ListView.builder(scrollDirection: Axis.vertical,itemCount:provider.fareList.length ,itemBuilder: (context,iteam){
//             //         final faremodel=provider.fareList[iteam];
//             //         return Card(
//             //           elevation: 10,
//             //           color: Colors.white,
//             //           child: Container(
//             //               color: Colors.white30,
//             //               child: InkWell(
//             //                   onTap: (){
//             //                   },
//             //                   child: CustomAdminFareListTile(
//             //                       fareStartPlace: faremodel.startPlace,
//             //                       fareEndPlace: faremodel.endPlace,
//             //                       fare: faremodel.fare,
//             //                       hight: screen.height, width: screen.width))),
//             //         );
//             //       }),
//             //
//             //     ),
//             //   ),
//             // ),
//             // ),
//
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Text(
//                 "Choose A Car",
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.indigo,
//                     letterSpacing: 1),
//               ),
//             ),
//             Consumer<AppCarHelperProvider>(
//               builder: (context, carprovider, _) => Container(
//                 width: screen.width,
//                 height: screen.height * 0.1,
//                 color: Colors.white,
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: carprovider.carOnlineList.length,
//                     itemBuilder: (context, iteam) {
//                       final carModel = carprovider.carOnlineList[iteam];
//                       return Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         //child: Text('SSSSSSSSSSSSSSSSSSSSSSSSSSSSS'),
//                         child: InkWell(
//                             onTap: () {
//                               Navigator.pushNamed(
//                                   context, CarDetailPage.routeName,
//                                   arguments: carModel.id);
//                             },
//                             child: CustomCarListTile(
//                                 carName: carModel.carName,
//                                 place: carModel.place,
//                                 carPicUrl: carModel.carPicUrl,
//                                 carPrice: carModel.carPrice,
//                                 hight: screen.height * 0.35,
//                                 width: screen.width * 0.75)),
//                       );
//                     }),
//               ),
//             ),
//
//             Text('     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Text(
//                 "Top Drivers",
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.indigo,
//                     letterSpacing: 1),
//               ),
//             ),
//             Card(
//               elevation: 10,
//               color: Colors.indigo,
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Consumer<AppDriverHalperProvider>(
//                   builder: (context, provider, _) => Container(
//                     width: screen.width,
//                     height: screen.height * 0.1,
//                     color: Colors.white,
//                     child: ListView.builder(
//                         scrollDirection: Axis.vertical,
//                         itemCount: provider.driverOnlineList.length,
//                         itemBuilder: (context, iteam) {
//                           final drivermodel = provider.driverOnlineList[iteam];
//                           return Card(
//                               elevation: 10,
//                               child: Container(
//                                 color: Colors.white30,
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.pushNamed(
//                                         context, DriverDetailPage.routeName,
//                                         arguments: drivermodel.id);
//                                   },
//                                   child: CustomListTile(
//                                     imageurl: drivermodel.driverImageUrl,
//                                     name: drivermodel.driverName,
//                                     skill: drivermodel.driverSkill,
//                                     rating: drivermodel.driverRating,
//                                     price: drivermodel.driverSalary.toString(),
//                                     driverAvility:
//                                         drivermodel.driverAbility == "Available"
//                                             ? true
//                                             : false,
//                                     hight: screen.height,
//                                     width: screen.width,
//                                   ),
//                                 ),
//                               ));
//                         }),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _sendMessage() async {
//     final question = textEditingController.text;
//     setState(() {
//       textEditingController.clear();
//       loading = true;
//       questionAnswers.add(
//         QuestionAnswer(
//           question: question,
//           answer: StringBuffer(),
//         ),
//       );
//     });
//     // final testRequest = CompletionRequest(
//     //   stream: true,
//     //   maxTokens: 4000,
//     //   messages: [Message(role: Role.user.name, content: question)],
//     // );
//
//     final testRequest = CompletionRequest(
//       stop: question,
//       stream: true,
//       maxTokens: 4000,
//       model: ChatGptModel.gpt35Turbo,
//       messages: [Message(role: Role.user.name, content: question)],
//     );
//
//     print('Test words: ');
//     print(testRequest);
//     await _streamResponse(testRequest);
//     setState(() => loading = false);
//   }
//
//   _streamResponse(CompletionRequest request) async {
//     streamSubscription?.cancel();
//     try {
//       final stream = await chatGpt.createChatCompletionStream(request);
//       streamSubscription = stream?.listen(
//         (event) => setState(
//           () {
//             if (event.streamMessageEnd) {
//               streamSubscription?.cancel();
//             } else {
//               return questionAnswers.last.answer.write(
//                 event.choices?.first.delta?.content,
//               );
//             }
//           },
//         ),
//       );
//     } catch (error) {
//       setState(() {
//         loading = false;
//         questionAnswers.last.answer.write("Error");
//       });
//       log("Error occurred: $error");
//     }
//   }
// }
