// ignore_for_file: avoid_print

import 'package:foodigy/controller/cart_controller/get_cart_list_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartTimerController extends GetxController {
  GetCartDetailsController cartListController =
      Get.put(GetCartDetailsController());

  void updateItemTimingList() {
    if (cartListController.cartList == null) {
      return;
    } else if (cartListController.cartList!.data == null) {
      return;
    } else {
      var timeIndex = int.parse(cartListController
          .cartList!.data!.cartDetails![0].productAvailableTime
          .toString()
          .substring(
              0,
              cartListController
                  .cartList!.data!.cartDetails![0].productAvailableTime
                  .toString()
                  .indexOf(':')));
    //  var addTimeIndex = timeIndex + 1;
      for (int i = timeIndex; i < 10; i++) {
        // print('hello ${i + 1}');
        // print('hello ${i + 1}:30');
      }
      // print('Sub string time');
      // print(timeIndex);
      // print(addTimeIndex);
    }
  }

  var allValue = <int>[12];

  Future getMaxTiming(
    String? selecetdDate
  ) async {
   
    if (cartListController.cartList == null) {
      return;
    } else if (cartListController.cartList!.data == null) {
      return;
    } else {
      allValue.clear();
      // print('check');
      for (int i = 0;
          i < cartListController.cartList!.data!.cartDetails!.length;
          i++) {
        String other = 'AM';

        if (int.tryParse(cartListController
                .cartList!.data!.cartDetails![i].productAvailableTime
                .toString()
                .substring(0, 1)) ==
            null) {
          //    print('Only Number are allowed');
        } else {
          var timeIndex = int.parse(cartListController
              .cartList!.data!.cartDetails![i].productAvailableTime
              .toString()
              .substring(
                  0,
                  cartListController
                      .cartList!.data!.cartDetails![i].productAvailableTime
                      .toString()
                      .indexOf(':')));

          if (cartListController
              .cartList!.data!.cartDetails![i].productAvailableTime
              .toString()
              .contains(other)) {
           //    print("${timeIndex.toInt()} AM");
            allValue.add(timeIndex + 1);
          } else {
            //  print("${timeIndex.toString()} PM");
            allValue.add(timeIndex + 12 + 1);
          }
          //   print('this numnbet');
        }

        // var timeIndex = int.parse(cartListController
        //     .cartList!.data!.cartDetails![i].productAvailableTime
        //     .toString()
        //     .substring(
        //         0,
        //         cartListController
        //             .cartList!.data!.cartDetails![i].productAvailableTime
        //             .toString()
        //             .indexOf(':')));
        // print(timeIndex + 1);

        // print('hello ${i + 1}');
        // print('hello ${i + 1}:30');
      }
      // print('all product');
      // print(allValue);
      maximumValu( selecetdDate);
    }
  }

  // Main function
  void maximumValu(String? selectedDate) {
    DateTime now = DateTime.now();
String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  var inputFormat = DateFormat('dd-MM-yyyy');
   String curentDisaplayDate =inputFormat.format(now).toString();
  // print(curentDisaplayDate);
  //  print(selectedDate);
//print('formated date');
//print(formattedDate);
String current=formattedDate.substring(0, formattedDate.indexOf(':'));
//print(current);
// Creating a geek list
    //var geekList = [121, 12, 33, 14, 3];

// Declaring and assigning the
// largestGeekValue and smallestGeekValue
    var largestGeekValue = allValue[0];
    var smallestGeekValue = allValue[0];

    for (var i = 0; i < allValue.length; i++) {
      // Checking for largest value in the list
      if (allValue[i] > largestGeekValue) {
        largestGeekValue = allValue[i];
      }

      // Checking for smallest value in the list
      if (allValue[i] < smallestGeekValue) {
        smallestGeekValue = allValue[i];
      }
    }

// Printing the values
//    print("Smallest value in the list : $smallestGeekValue");
    //   print("Largest value in the list : $largestGeekValue");
    fo(time: largestGeekValue.toString(),curent: current,curentDate: curentDisaplayDate, selectedDate: selectedDate);
  }

  int time = 3;

  List allTimes = [];

  void fo({String? time, String? curent, String? curentDate ,String? selectedDate}) {
    allTimes.clear();
    String timing = time.toString();
    List<String> allTime = [
      "1:00",
      "1:30",
      "2:00",
      "2:30",
      "3:00",
      "3:30",
      "4:00",
      "4:30",
      "5:00",
      "5:30",
      "6:00",
      "6:30"
      "7:00",
      "7:30",
      "8:00",
      "8:30",
      "9:00",
      "9:30",
      "10:00",
      "10:30",
      "11:00",
      "11:30",
      "12:00",
      "12:30",
      "13:00",
      "13:30",
      "14:00",
      "14:30",
      "15:00",
      "15:30",
      "16:00",
      "16:30",
      "17:00",
      "17:30",
      "18:00",
      "18:30",
      "19:00",
      "19:30",
      "20:00",
      "20:30",
      "21:00",
      "21:30",
      "22:00"
    ];
//  print(allTime);
//  print(timing);
    for (var i = 0; i < allTime.length; i++) {
      int valu = int.parse(allTime[i].substring(0, allTime[i].indexOf(':')));
      if(curentDate ==selectedDate){
       // print('true');
      if(int.parse(curent.toString())+1 < int.parse(valu.toString())){
            if (int.parse(timing) <= int.parse(valu.toString())) {
        if (valu <= 11) {
          allTimes.add("${allTime[i]} am");
        } else if (valu == 12) {
          allTimes.add("${allTime[i]} pm");
        } else {
          String two = allTime[i].substring(2, 5);
          int data = valu - 12;
          // print("${allTime[i]} pm");
          allTimes.add("${data.toString()}$two pm");
          //   print("check");
          //  print("${data}$two pm");
        }
      } else {}

      }else{
      }

      }else{
        print('false');
           if (10 <= int.parse(valu.toString())) {
        if (valu <= 11) {
          allTimes.add("${allTime[i]} am");
            //print("${allTime[i]} am");
        } else if (valu == 12) {
          allTimes.add("${allTime[i]} pm");
        } else {
          String two = allTime[i].substring(2, 5);
          int data = valu - 12;
          // print("${allTime[i]} pm");
          allTimes.add("${data.toString()}$two pm");
          //   print("check");

          //  print("${data}$two pm");
        }
      } else {}

      }


  
    }
  }
}




