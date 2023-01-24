// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/chef_order_controller.dart';
import 'package:foodigy/presentation/chef_screens/chef_order_screens/chef_your_active_order.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChefOrderScreen extends StatefulWidget {
  final String? userId;
  final String? chefId;
  const ChefOrderScreen({super.key, this.userId, this.chefId});

  @override
  State<ChefOrderScreen> createState() => _ChefOrderScreenState();
}

class _ChefOrderScreenState extends State<ChefOrderScreen> {
  ChefOrderController chefOrderController = Get.put(ChefOrderController());

  @override
  void initState() {
    chefOrderController.chefOrderList(
        chefId: widget.chefId,);
    print(widget.chefId);
    print(widget.userId);
    super.initState();
  }
    DateTime? date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double spaceHeight = 15;
    return Scaffold(
      body: Obx(() {
        if (chefOrderController.isDataLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(color: firstColor),
          );
        } else if (chefOrderController.chefOrder == null) {
          return Center(
            child: Text(
              " This chef is not available at this location",
              style: FoodigyTextStyle.homeHeadLine,
            ),
          );
        } else if (chefOrderController.chefOrder!.data == null) {
          return Center(
            child: Text(
              " This chef is not available at this location",
              style: FoodigyTextStyle.homeHeadLine,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                    date = DateTime.parse(chefOrderController.chefOrder!.data![index].orderPlacedTime
                              .toString());
                          return ChefYourOrderListDesign(index: index,activeOrder: chefOrderController.chefOrder!,date: '',);
    //               return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: InkWell(
    //     onTap: () {
           
    //     },
    //     child: Container(
    //       // height: 160,
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           border: Border.all(color: firstColor),
    //           color: Colors.white,
    //           boxShadow: const [
    //             BoxShadow(
    //               offset: Offset(2, 2),
    //               blurRadius: 5,
    //               color: Color.fromRGBO(0, 0, 0, 0.16),
    //             )
    //           ]),
    //       child: Padding(
    //         padding: const EdgeInsets.all(5.0),
    //         child: Column(children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Row(
    //                 children: [
    //                   Container(
    //                     height: 50,
    //                     width: 50,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10),
    //                         image: DecorationImage(
    //                             image: NetworkImage(chefOrderController.chefOrder!.data![index].profileSlug
    //                                 .toString()),
    //                             fit: BoxFit.cover),
    //                         color: Colors.grey),
    //                   ),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   SizedBox(
    //                     child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Row(
    //                             children: [
    //                               Text(
    //                                chefOrderController.chefOrder!.data![index]
    //                                     .profileName
    //                                     .toString(),
    //                                 style: FoodigyTextStyle.homeHeadLine,
    //                               ),
    //                               SizedBox(
    //                                 width: 20,
    //                               ),
    //                             ],
    //                           ),
    //                           Text(
    //                             "Order #: ${chefOrderController.chefOrder!.data![index].orderId.toString()}",
    //                             style: FoodigyTextStyle.addressTextStyle,
    //                           ),
    //                           SizedBox(
    //                             height: 5,
    //                           ),
    //                           Text(chefOrderController.chefOrder!.data![index].acceptedTime.toString(),style: FoodigyTextStyle.smallGreyTextStyle)
    //                           // Text("${DateFormat.yMMMd().format(date!)}, $pATIme",
    //                           //     style: FoodigyTextStyle.smallGreyTextStyle),
    //                         ]),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width / 1,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   children: const [
    //                     SizedBox(
    //                       height: 10,
    //                       width: 50,
    //                     ),
    //                     SizedBox(
    //                       width: 10,
    //                     ),
    //                     Text("Bill total",
    //                         style: FoodigyTextStyle.addressTextStyle)
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     Text(
    //                         "$iRubee ${double.parse(chefOrderController.chefOrder!.data![index].totalCost.toString()).toStringAsFixed(2)}"),
    //                     IconButton(
    //                         onPressed: () {
    //                           // navigateSecondPage(
    //                           //   orderType: widget
    //                           //       .activeOrder!.data![widget.index].deliveryMode
    //                           //       .toString(),
    //                           //   pastOrder: widget.activeOrder,
    //                           //   index: widget.index,
    //                           //   razer: widget.activeOrder!.data![widget.index]
    //                           //       .razorpayPayment,
    //                           //   delivery: widget.activeOrder!.data![widget.index]
    //                           //       .deliveryType,
    //                           //   orderList: widget
    //                           //       .activeOrder!.data![widget.index].orderDetail,
    //                           // );

    //                           // <---/----->
                              
    //                           // Get.to(
    //                           //     ActiveOrderViewSummary(
    //                           //   orderType:
    //                           //       activeController
    //                           //           .activeOrder!
    //                           //           .data![index]
    //                           //           .deliveryMode
    //                           //           .toString(),
    //                           //   pastOrder:
    //                           //       activeController
    //                           //           .activeOrder,
    //                           //   index: index,
    //                           //   razer: activeController
    //                           //       .activeOrder!
    //                           //       .data![index]
    //                           //       .razorpayPayment,
    //                           //   delivery:
    //                           //       activeController
    //                           //           .activeOrder!
    //                           //           .data![index]
    //                           //           .deliveryType,
    //                           //   orderList:
    //                           //       activeController
    //                           //           .activeOrder!
    //                           //           .data![index]
    //                           //           .orderDetail,
    //                           // ));
    //                         },
    //                         icon: Icon(
    //                           MdiIcons.chevronRight,
    //                           color: Colors.black,
    //                           size: 25,
    //                         ))
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ),
    //           // SizedBox(
    //           //   width: MediaQuery.of(context).size.width / 1,
    //           //   child: Row(
    //           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           //     children: [
    //           //       SizedBox(
    //           //         // height: 10,
    //           //         width: 20,
    //           //         // child: Text('Estimated Delivery time'),
    //           //       ),
    //           //       // ${DateFormat('HH:mm a').format(date!)}
    //           //       // Text(
    //           //       //     "${DateFormat.yMMMd().format(date!)}, $pATIme",
    //           //       //     style: FoodigyTextStyle
    //           //       //         .smallGreyTextStyle),
    //           //       SizedBox(
    //           //         width: 10,
    //           //       ),
      
    //           //       SizedBox(
    //           //         child: OrderButton(
    //           //             color: Colors.white,
    //           //             buttonColor: Colors.grey.shade400,
    //           //             textColor: Colors.white,
    //           //             text: "RATE ORDER",
    //           //             onPressed: () {}),
    //           //       )
    //           //     ],
    //           //   ),
    //           // ),
    //         ]),
    //       ),
    //     ),
    //   ),
    // );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemCount: chefOrderController.chefOrder!.data!.length),
          );
        }
      }),
    );
  }
}
