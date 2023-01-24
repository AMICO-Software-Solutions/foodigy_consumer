
// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodigy/model/past_order_model.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/order_view_summary.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/rate_order_screen.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/system_rejected_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/profile/order_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PastOrderListCardDesign extends StatefulWidget {
  final String? date;
  final PastOrderModel? pastOrder;
  final int index;
  const PastOrderListCardDesign(
      {super.key, this.pastOrder, required this.index, this.date});

  @override
  State<PastOrderListCardDesign> createState() =>
      _PastOrderListCardDesignState();
}

class _PastOrderListCardDesignState extends State<PastOrderListCardDesign> {
  DateTime? date = DateTime.now();
  DateTime? cancelDate=DateTime.now();
  DateTime? rejectedDate=DateTime.now();
  DateTime? systemRejectedDate=DateTime.now();
  DateTime? deliveredOrderDate=DateTime.now();
  List? productIdList = [];
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      getProductId();
      addProduct();
    });
    Timer(const Duration(seconds: 2), () {
      addProduct();
    });
    Timer(const Duration(seconds: 0), () {
     String? productTime = DateFormat('HH:mm a').format(date!);
      maaa(productTime);
    });

    super.initState();
  }

  DateTime now = DateTime.now();
//DateTime date = DateTime(now.year, now.month, now.day);
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  IconData? _selectedIcon;

  int? groupValue;
  String title = '';
  int? typeValue;
  int? timeValue;

  String type = '';
  String time = '';

  //String? productTime;
  String? pATIme = '';
  String? one = '';
  int? second;
  String? third = '';
  int? valu;

  void maaa( String? productTime) {
    setState(() {
      print("product time");
      print(productTime);
      third = productTime.toString().substring(6, 8);
   //   print(third);
      valu = int.parse(productTime
              .toString()
              .substring(0, productTime.toString().indexOf(':'))) +
          5;
      one = productTime.toString().substring(3, 5);
      //   print(one);
      second = int.parse(one.toString()) + 30;
      // print(second);
      // print(valu);

      if (third == "AM") {
        if (int.parse(second.toString()) >= 60) {
          valu = valu! + 1;
           second =second! -60;
            String  seco =second.toString().length ==1? "0$second":second.toString();
          if (valu! < 12) {
          String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${seco.toString()} $third";
          } else {
             valu =valu! - 12;
             String valuTwo =  valu.toString()=="0"?"12": valu.toString();

            pATIme = "${valuTwo.toString()}:${seco.toString()} PM";
          }
        } else {
          if (valu! < 12) {
            print("$valu $second $third");
            String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${second.toString()} $third";
          } else {
             valu =valu! - 12;
                 String valuTwo =  valu.toString()=="0"?"12": valu.toString();
          //  print("$valu $second PM");
            pATIme = "${valuTwo.toString()}:${second.toString()} PM";
          }
        }

        print("am values");
      } else {
        print("pm value");
        if (int.parse(second.toString()) >= 60) {
          valu = valu! + 1;
          second =second! -60;
           String  seco =second.toString().length ==1? "0$second":second.toString();
          if (valu! < 24) { 
            valu =valu!-12;
                String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${seco.toString()} PM";
          } else {
             valu =valu! - 12;
                 String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${seco.toString()} AM";
          }
        } else {
          if (valu! < 24) {
        //    print("$valu $second $third");
             valu =valu!-12;
                 String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${second.toString()} PM";
          } else {
             valu =valu! - 12;
                 String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${second.toString()} AM";
         //   print("$valu $second PM");
          }
        }
      }
    });
  }



  List<Map<String, dynamic>> productsList = [];
  var chefsList = [];

  Map<String, dynamic> proList = {};
  Map<String, dynamic> chefList = {};
  void addProduct() {
    // products = [
    for (int i = 0;
        i < widget.pastOrder!.data![widget.index].orderDetail!.length;
        i++) {
      proList = {
        "consumerId": int.parse(
            widget.pastOrder!.data![widget.index].consumerId.toString()),
        "chefId": int.parse(
            widget.pastOrder!.data![widget.index].providerId.toString()),
        "ratings": int.parse("4"),
        "productId": int.parse(widget
            .pastOrder!.data![widget.index].orderDetail![i].productId
            .toString()),
        "ratingType": "FOOD",
      };
      productsList.add(proList);

      // Product(i.toString(), quotationList[i][0], quotationList[i][1],
      //     quotationList[i][2]),
    }
    // chefList = {
    //   "consumerId": int.parse(
    //       widget.pastOrder!.data![widget.index].consumerId.toString()),
    //   "chefId": int.parse(
    //       widget.pastOrder!.data![widget.index].providerId.toString()),
    //   "ratings": int.parse(chefRating.toString()),
    //   "productId": 0,
    //   "ratingType": "CHEF",
    // };
    // chefsList.add(chefList);
    // ];
  }

  void getProductId() {
    for (var i = 0;
        i < widget.pastOrder!.data![widget.index].orderDetail!.length;
        i++) {
      productIdList!
          .add(widget.pastOrder!.data![widget.index].orderDetail![i].productId);
    }
    // print('product id');
    // print(productIdList);
  }

  @override
  Widget build(BuildContext context) {
    date = DateTime.parse(
       widget.pastOrder!.data![widget.index].orderPlacedTime.toString());
      cancelDate=widget.pastOrder!.data![widget.index].cancelledTime.toString()=='null'?DateTime.parse("2022-12-20T08:07:50.754Z"):DateTime.parse( widget.pastOrder!.data![widget.index].cancelledTime.toString());
   rejectedDate=widget.pastOrder!.data![widget.index].rejectedTime.toString()=='null'?DateTime.parse("2022-12-20T08:07:50.754Z"):DateTime.parse( widget.pastOrder!.data![widget.index].rejectedTime.toString());
    systemRejectedDate =widget.pastOrder!.data![widget.index].rejectedTime.toString()=='null'?DateTime.parse("2022-12-20T08:07:50.754Z"):DateTime.parse( widget.pastOrder!.data![widget.index].rejectedTime.toString());
  deliveredOrderDate=widget.pastOrder!.data![widget.index].deliveredTime.toString()=='null'?DateTime.parse("2022-12-20T08:07:50.754Z"):DateTime.parse( widget.pastOrder!.data![widget.index].deliveredTime.toString());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          print(widget
                                    .pastOrder!.data![widget.index].orderStatus
                                    .toString());
                                if (widget.pastOrder!.data![widget.index]
                                        .orderStatus
                                        .toString() ==
                                    "SYSTEMREJECTED") {
                                  Get.to(SystemRejectedScreen(
                                    orderStatus: "Rejected By",
                                    orderStatusTime: pATIme.toString(),
                                    orderStatusDate:date! ,
                                    orderCancelledDate: systemRejectedDate,
                                   
                                    pastOrder: widget.pastOrder,
                                    index: widget.index,
                                    razer: widget.pastOrder!.data![widget.index]
                                        .razorpayPayment,
                                    delivery: widget.pastOrder!
                                        .data![widget.index].deliveryType,
                                    orderList: widget.pastOrder!
                                        .data![widget.index].orderDetail,
                                  ));
                                } else if (widget.pastOrder!.data![widget.index]
                                        .orderStatus
                                        .toString() ==
                                    "CANCELLED") {
                                  Get.to(SystemRejectedScreen(
                                    orderStatus: "Cancelled",
                                    orderStatusTime: pATIme.toString(),
                                    orderStatusDate:date! ,
                                    orderCancelledDate: cancelDate,
                                    pastOrder: widget.pastOrder,
                                    index: widget.index,
                                    razer: widget.pastOrder!.data![widget.index]
                                        .razorpayPayment,
                                    delivery: widget.pastOrder!
                                        .data![widget.index].deliveryType,
                                    orderList: widget.pastOrder!
                                        .data![widget.index].orderDetail,
                                  ));
                                } else if (widget.pastOrder!.data![widget.index]
                                        .orderStatus
                                        .toString() ==
                                    "REJECTED") {
                                  Get.to(SystemRejectedScreen(
                                    orderCancelledDate: rejectedDate,
                                    orderStatus: "Rejected",
                                    orderStatusTime: pATIme.toString(),
                                    orderStatusDate:date! ,
                                    pastOrder: widget.pastOrder,
                                    index: widget.index,
                                    razer: widget.pastOrder!.data![widget.index]
                                        .razorpayPayment,
                                    delivery: widget.pastOrder!
                                        .data![widget.index].deliveryType,
                                    orderList: widget.pastOrder!
                                        .data![widget.index].orderDetail,
                                  ));
                                } else {
                                  Get.to(OrderViewSummary(
                                    orderDeliveredDate: deliveredOrderDate,
                                    orderStatusTime: pATIme.toString(),
                                    orderStatusDate: date!,
                                    
                                    pastOrder: widget.pastOrder,
                                    index: widget.index,
                                    razer: widget.pastOrder!.data![widget.index]
                                        .razorpayPayment,
                                    delivery: widget.pastOrder!
                                        .data![widget.index].deliveryType,
                                    orderList: widget.pastOrder!
                                        .data![widget.index].orderDetail,
                                  ));
                                }
        },
        child: Container(
          // height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: firstColor),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 5,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(widget.pastOrder!
                                        .data![widget.index].profileSlug
                                        .toString()),
                                    fit: BoxFit.cover),
                                color: Colors.grey),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        widget.pastOrder!.data![widget.index]
                                            .profileName
                                            .toString(),
                                        style: FoodigyTextStyle.homeHeadLine,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Order #: ${widget.pastOrder!.data![widget.index].orderId.toString()}",
                                    style: FoodigyTextStyle.addressTextStyle,
                                  ),
                                  SizedBox(height: 5,),
                                      Text(
                          "${DateFormat.yMMMd().format(date!)}, $pATIme ",
                          style: FoodigyTextStyle.smallGreyTextStyle),
                                ]),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                        child: widget.pastOrder!.data![widget.index].orderStatus
                                  .toString() ==
                              "COMPLETED"
                          ? Text(
                            widget.pastOrder!.data![widget.index].orderStatus
                                .toString(),
                            style: TextStyle(
                                color: firstColor,
                                fontSize: 8,
                                fontFamily: 'Popins')):Text(
                            widget.pastOrder!.data![widget.index].orderStatus
                                .toString(),
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 8,
                                fontFamily: 'Popins')),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              height: 10,
                              width: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Bill total",
                                style: FoodigyTextStyle.addressTextStyle)
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                "$iRubee ${double.parse(widget.pastOrder!.data![widget.index].totalCost.toString()).toStringAsFixed(2)}"),
                            IconButton(
                                onPressed: () {
                                  // print(widget
                                  //     .pastOrder!.data![widget.index].orderStatus
                                  //     .toString());
                                  // if (widget.pastOrder!.data![widget.index]
                                  //         .orderStatus
                                  //         .toString() ==
                                  //     "SYSTEMREJECTED") {
                                  //   Get.to(SystemRejectedScreen(
                                  //     orderStatus: "Rejected By",
                                  //     orderStatusTime: pATIme.toString(),
                                  //     orderStatusDate:date! ,
                                  //     orderCancelledDate: systemRejectedDate,
                                     
                                  //     pastOrder: widget.pastOrder,
                                  //     index: widget.index,
                                  //     razer: widget.pastOrder!.data![widget.index]
                                  //         .razorpayPayment,
                                  //     delivery: widget.pastOrder!
                                  //         .data![widget.index].deliveryType,
                                  //     orderList: widget.pastOrder!
                                  //         .data![widget.index].orderDetail,
                                  //   ));
                                  // } else if (widget.pastOrder!.data![widget.index]
                                  //         .orderStatus
                                  //         .toString() ==
                                  //     "CANCELLED") {
                                  //   Get.to(SystemRejectedScreen(
                                  //     orderStatus: "Cancelled",
                                  //     orderStatusTime: pATIme.toString(),
                                  //     orderStatusDate:date! ,
                                  //     orderCancelledDate: cancelDate,
                                  //     pastOrder: widget.pastOrder,
                                  //     index: widget.index,
                                  //     razer: widget.pastOrder!.data![widget.index]
                                  //         .razorpayPayment,
                                  //     delivery: widget.pastOrder!
                                  //         .data![widget.index].deliveryType,
                                  //     orderList: widget.pastOrder!
                                  //         .data![widget.index].orderDetail,
                                  //   ));
                                  // } else if (widget.pastOrder!.data![widget.index]
                                  //         .orderStatus
                                  //         .toString() ==
                                  //     "REJECTED") {
                                  //   Get.to(SystemRejectedScreen(
                                  //     orderCancelledDate: rejectedDate,
                                  //     orderStatus: "Rejected",
                                  //     orderStatusTime: pATIme.toString(),
                                  //     orderStatusDate:date! ,
                                  //     pastOrder: widget.pastOrder,
                                  //     index: widget.index,
                                  //     razer: widget.pastOrder!.data![widget.index]
                                  //         .razorpayPayment,
                                  //     delivery: widget.pastOrder!
                                  //         .data![widget.index].deliveryType,
                                  //     orderList: widget.pastOrder!
                                  //         .data![widget.index].orderDetail,
                                  //   ));
                                  // } else {
                                  //   Get.to(OrderViewSummary(
                                  //     orderDeliveredDate: deliveredOrderDate,
                                  //     orderStatusTime: pATIme.toString(),
                                  //     orderStatusDate: date!,
                                      
                                  //     pastOrder: widget.pastOrder,
                                  //     index: widget.index,
                                  //     razer: widget.pastOrder!.data![widget.index]
                                  //         .razorpayPayment,
                                  //     delivery: widget.pastOrder!
                                  //         .data![widget.index].deliveryType,
                                  //     orderList: widget.pastOrder!
                                  //         .data![widget.index].orderDetail,
                                  //   ));
                                  // }
                                },
                                icon: Icon(
                                  MdiIcons.chevronRight,
                                  color: Colors.black,
                                  size: 25,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10,
                        width: 20,
                      ),
                      //${DateFormat('HH:mm a').format(date!)}
                      // Text(
                      //     "${DateFormat.yMMMd().format(date!)}, $pATIme ",
                      //     style: FoodigyTextStyle.smallGreyTextStyle),
                      SizedBox(
                        width: 10,
                      ),
                      // Text(
                      //   pATIme.toString(),
                      //   style: TextStyle(color: Colors.black),
                      // ),
                      widget.pastOrder!.data![widget.index].orderStatus
                                  .toString() ==
                              "COMPLETED"
                          ? (widget.pastOrder!.data![widget.index].reviewStatus ==
                                  true
                              ? Container(
                                  width: 100,
                                )
                              : SizedBox(
                                  child: OrderButton(
                                      buttonColor: Colors.white,
                                      color: firstColor,
                                      textColor:firstColor,
                                      text: "RATE ORDER",
                                      onPressed: () {
                                        print(productIdList);
                                        print(productsList);
                                        print(widget.pastOrder);
                                        print( widget.pastOrder!
                                              .data![widget.index].bookingDate
                                              .toString());
                                        Get.to(()=>RateOrderScreen(
                                          productList: productsList,
                                          pastOrder: widget.pastOrder,
                                          index: widget.index,
                                          productIdList: productIdList,
                                          bookingDate: widget.pastOrder!
                                              .data![widget.index].bookingDate
                                              .toString(),
                                        ));
                                      }),
                                ))
                          : Container(
                            width: 100
                          )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
