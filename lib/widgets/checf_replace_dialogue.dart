// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ChefDialogueBox extends StatefulWidget {
//   const ChefDialogueBox({super.key});

//   @override
//   State<ChefDialogueBox> createState() => _ChefDialogueBoxState();
// }

// class _ChefDialogueBoxState extends State<ChefDialogueBox> {
//   @override
//   Widget build(BuildContext context) {
//     return dialogueChef();
//   }


//   Future<bool> dialogueChef()async{
//    return await Get.defaultDialog(
//               title: "GeeksforGeeks",
//               middleText: "Hello world!",
//               backgroundColor: Colors.green,
//               titleStyle: TextStyle(color: Colors.white),
//               middleTextStyle: TextStyle(color: Colors.white),
//               textConfirm: "Confirm",
//               textCancel: "Cancel",
//               cancelTextColor: Colors.white,
//               confirmTextColor: Colors.white,
//               buttonColor: Colors.white,
//               barrierDismissible: false,
//               radius: 10,
//               content: Column(
//                 children: [
//                   Container(child:Text("Hello 1")),
//                   Container(child:Text("Hello 2")),
//                   Container(child:Text("Hello 3")),
//                 ],
//               )
//             );
//   }
// }