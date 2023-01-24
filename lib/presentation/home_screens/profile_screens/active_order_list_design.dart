// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/order_controller/active_order_controller.dart';
import 'package:foodigy/model/active_order_model.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/active_order_view_smmary.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ActiveOrderListDesign extends StatefulWidget {
  final String? date;
  final ActiveOrderModel? activeOrder;
  final int index;
  const ActiveOrderListDesign(
      {super.key, this.date, this.activeOrder, required this.index});

  @override
  State<ActiveOrderListDesign> createState() => _ActiveOrderListDesignState();
}

class _ActiveOrderListDesignState extends State<ActiveOrderListDesign> {
  //  ActiveOrderController activeController = Get.put(ActiveOrderController());
 
  DateTime? date = DateTime.now();
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
    String  productTime = DateFormat('HH:mm a').format(date!);
      maaa(productTime);
    });
    Timer(const Duration(seconds: 0), () {
      orderPlacedDate =
          widget.activeOrder!.data![widget.index].orderPlacedTime.toString() ==
                  'null'
              ? DateTime.parse("2022-12-20T08:07:50.754Z")
              : DateTime.parse(widget
                  .activeOrder!.data![widget.index].orderPlacedTime
                  .toString());
      orderAcceptedDate = widget.activeOrder!.data![widget.index].acceptedTime
                  .toString() ==
              'null'
          ? DateTime.parse("2022-12-20T08:07:50.754Z")
          : DateTime.parse(
              widget.activeOrder!.data![widget.index].acceptedTime.toString());
      orderPickUpDate = widget.activeOrder!.data![widget.index].deliveredTime
                  .toString() ==
              'null'
          ? DateTime.parse("2022-12-20T08:07:50.754Z")
          : DateTime.parse(
              widget.activeOrder!.data![widget.index].deliveredTime.toString());
    });
    

    super.initState();
  }

  DateTime now = DateTime.now();
//DateTime date = DateTime(now.year, now.month, now.day);
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime? orderPlacedDate = DateTime.now();
  DateTime? orderAcceptedDate = DateTime.now();
  DateTime? orderPickUpDate = DateTime.now();

  //IconData? _selectedIcon;

  int? groupValue;
  String title = '';
  int? typeValue;
  int? timeValue;

  String type = '';
  String time = '';

  String? pATIme = '';


  void maaa(String? productTime) {
    setState(() {
      //  print("product time");
      //   print(productTime);
     String third = productTime.toString().substring(6, 8);
      //   print(third);
   int   valu = int.parse(productTime
              .toString()
              .substring(0, productTime.toString().indexOf(':'))) +
          5;
     String one = productTime.toString().substring(3, 5);
     int second = int.parse(one.toString()) + 30;
      print(second);
      print(valu);

      if (third == "AM") {
        print("am values");
        if (int.parse(second.toString()) >= 60) {
          print("more then 60 $valu");
          valu = valu + 1;
          second = second - 60;
          String seco =
              second.toString().length == 1 ? "0$second" : second.toString();
          if (valu < 12) {
              String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            print("$valu $seco $third");
            pATIme = "${valuTwo.toString()}:${seco.toString()} $third";
          } else {
            valu = valu - 12;
            print("$valu $seco PM");
            String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${seco.toString()} PM";
          }
        } else {
          if (valu < 12) {
            print("$valu $second $third");
             String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${second.toString()} $third";
          } else {
            valu = valu - 12;
             String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            print("$valu $second PM");
            pATIme = "${valuTwo.toString()}:${second.toString()} PM";
          }
        }
      } else {
        print("pm value");
        print(second);
        print(valu);
        if (int.parse(second.toString()) >= 60) {
          valu = valu + 1;
          second = second - 60;
          String seco =
              second.toString().length == 1 ? "0$second" : second.toString();
          if (valu <= 24) {
            print("$valu $second $third");
            valu = valu - 12;
             String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${seco.toString()} PM";
          } else {
            pATIme = "${valu.toString()}:${seco.toString()} AM";
            print("$valu $second AM");
          }
        } else {
          if (valu < 24) {
            print("$valu $second $third");
            valu = valu - 12;
             String valuTwo =  valu.toString()=="0"?"12": valu.toString();

            pATIme = "${valuTwo.toString()}:${second.toString()} PM";
          } else {
             String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${second.toString()} AM";
            print("$valu $second PM");
          }
        }
      }

      // second =int.parse( productTime.toString().substring(3,6));
      // third = productTime
      //     .toString();

      //  int pTIme = int.parse(productTime.toString());
      // DateTime date = DateTime(
      //     2021, 3, 28, 1, 50, 30); // Setting the DateTime to 2021-03-28, 1 AM
      // print(date.add(Duration(minutes: 60)));
      // DateTime dateTime = DateTime(
      //     date.year, date.month, date.day + 1, date.hour + 1, date.minute);
      // // print(dateTime.day);
      // var time = "${dateTime.day}, ${dateTime.hour}, ${dateTime.minute}";

      //  print("afetr 5 hours");
      //  print('${valu.toString()}${second.toString()}');
      //  pATIme = "${valu.toString()}:${second.toString()}";
    });
  }

  List<Map<String, dynamic>> productsList = [];
  var chefsList = [];

  Map<String, dynamic> proList = {};
  Map<String, dynamic> chefList = {};
  void addProduct() {
    // products = [
    for (int i = 0;
        i < widget.activeOrder!.data![widget.index].orderDetail!.length;
        i++) {
      proList = {
        "consumerId": int.parse(
            widget.activeOrder!.data![widget.index].consumerId.toString()),
        "chefId": int.parse(
            widget.activeOrder!.data![widget.index].providerId.toString()),
        "ratings": int.parse("4"),
        "productId": int.parse(widget
            .activeOrder!.data![widget.index].orderDetail![i].productId
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
        i < widget.activeOrder!.data![widget.index].orderDetail!.length;
        i++) {
      productIdList!.add(
          widget.activeOrder!.data![widget.index].orderDetail![i].productId);
    }
    // print('product id');
    // print(productIdList);
  }

  @override
  Widget build(BuildContext context) {
    date = DateTime.parse(
        widget.activeOrder!.data![widget.index].orderPlacedTime.toString());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
           navigateSecondPage(
                              orderType: widget
                                  .activeOrder!.data![widget.index].deliveryMode
                                  .toString(),
                              pastOrder: widget.activeOrder,
                              index: widget.index,
                              razer: widget.activeOrder!.data![widget.index]
                                  .razorpayPayment,
                              delivery: widget.activeOrder!.data![widget.index]
                                  .deliveryType,
                              orderList: widget
                                  .activeOrder!.data![widget.index].orderDetail,
                            );
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
            child: Column(children: [
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
                                image: NetworkImage(widget
                                    .activeOrder!.data![widget.index].profileSlug
                                    .toString()),
                                fit: BoxFit.cover),
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.activeOrder!.data![widget.index]
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
                                "Order #: ${widget.activeOrder!.data![widget.index].orderId.toString()}",
                                style: FoodigyTextStyle.addressTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("${DateFormat.yMMMd().format(date!)}, $pATIme",
                                  style: FoodigyTextStyle.smallGreyTextStyle),
                            ]),
                      ),
                    ],
                  ),
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
                            "$iRubee ${double.parse(widget.activeOrder!.data![widget.index].totalCost.toString()).toStringAsFixed(2)}"),
                        IconButton(
                            onPressed: () {
                              // navigateSecondPage(
                              //   orderType: widget
                              //       .activeOrder!.data![widget.index].deliveryMode
                              //       .toString(),
                              //   pastOrder: widget.activeOrder,
                              //   index: widget.index,
                              //   razer: widget.activeOrder!.data![widget.index]
                              //       .razorpayPayment,
                              //   delivery: widget.activeOrder!.data![widget.index]
                              //       .deliveryType,
                              //   orderList: widget
                              //       .activeOrder!.data![widget.index].orderDetail,
                              // );

                              // <---/----->
                              
                              // Get.to(
                              //     ActiveOrderViewSummary(
                              //   orderType:
                              //       activeController
                              //           .activeOrder!
                              //           .data![index]
                              //           .deliveryMode
                              //           .toString(),
                              //   pastOrder:
                              //       activeController
                              //           .activeOrder,
                              //   index: index,
                              //   razer: activeController
                              //       .activeOrder!
                              //       .data![index]
                              //       .razorpayPayment,
                              //   delivery:
                              //       activeController
                              //           .activeOrder!
                              //           .data![index]
                              //           .deliveryType,
                              //   orderList:
                              //       activeController
                              //           .activeOrder!
                              //           .data![index]
                              //           .orderDetail,
                              // ));
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
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 1,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       SizedBox(
              //         // height: 10,
              //         width: 20,
              //         // child: Text('Estimated Delivery time'),
              //       ),
              //       // ${DateFormat('HH:mm a').format(date!)}
              //       // Text(
              //       //     "${DateFormat.yMMMd().format(date!)}, $pATIme",
              //       //     style: FoodigyTextStyle
              //       //         .smallGreyTextStyle),
              //       SizedBox(
              //         width: 10,
              //       ),
      
              //       SizedBox(
              //         child: OrderButton(
              //             color: Colors.white,
              //             buttonColor: Colors.grey.shade400,
              //             textColor: Colors.white,
              //             text: "RATE ORDER",
              //             onPressed: () {}),
              //       )
              //     ],
              //   ),
              // ),
            ]),
          ),
        ),
      ),
    );
  }

  FutureOr onGoBack(dynamic value) {
    //refreshData();
    ActiveOrderController().activeOrderList();
    print("succes");
    setState(() {});
  }

  void navigateSecondPage(
      {String? orderType,
      ActiveOrderModel? pastOrder,
      List<OrderDetail>? orderList,
      List<DeliveryType>? delivery,
      List<RazorpayPayment>? razer,
      required int index}) {
    Route route = MaterialPageRoute(
        builder: (context) => ActiveOrderViewSummary(
              index: index,
              orderPlacedDate: orderPlacedDate,
              orderAcceptedDate: orderAcceptedDate,
              orderPickUpDate: orderAcceptedDate,
              orderPlacedTime: pATIme,
              orderType: orderType,
              pastOrder: pastOrder,
              orderList: orderList,
              delivery: delivery,
              razer: razer,
            ));
    Navigator.push(context, route).then(onGoBack);
  }
}
