import 'package:flutter/material.dart';
import 'package:foodigy/controller/order_controller/past_order_controller.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/about_foodigy_screen.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/faq_screen.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/previous_orderlist-screen.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/terms&condition_profile_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/profile/account_container.dart';
import 'package:get/get.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  PastOrderController pastController = Get.put(PastOrderController());
  @override
  void initState() {
    pastController.pastOrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: firstColor,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Need help with your order?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Select an Order to get help',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 200,
                  // width: double.infinity,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     color: Colors.white),
                  child: Obx(() {
                    if (pastController.isDataLoading.isTrue) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      ));
                    } else if (pastController.pastOrder == null) {
                      return Container();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          // height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 5,
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        pastController
                                                            .pastOrder!
                                                            .data![0]
                                                            .profileSlug
                                                            .toString()),
                                                    fit: BoxFit.cover),
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.8,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        pastController
                                                            .pastOrder!
                                                            .data![0]
                                                            .profileName
                                                            .toString(),
                                                        style: FoodigyTextStyle
                                                            .homeHeadLine,
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),

                                                      // Row(
                                                      //   children: [
                                                      //     Icon(Icons.star, color: Colors.yellow.shade300, size: 10,),
                                                      //     // Text(activeController.activeOrder!.data![index].)
                                                      //   ],
                                                      // )
                                                    ],
                                                  ),
                                                  Text(
                                                    "Order #: ${pastController.pastOrder!
                                                        .data![0].orderId.toString()}",
                                                    style: FoodigyTextStyle
                                                        .addressTextStyle,
                                                  ),
                                                  Text(
                                                    pastController.pastOrder!
                                                        .data![0].orderAddress
                                                        .toString(),
                                                    style: FoodigyTextStyle
                                                        .smallGreyTextStyle,
                                                  )
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
                                        child:pastController
                                                .pastOrder!.data![0].orderStatus
                                                .toString()== "COMPLETED" ? Text(
                                            pastController
                                                .pastOrder!.data![0].orderStatus
                                                .toString(),
                                            style: TextStyle(
                                                color: firstColor,
                                                fontSize: 8,
                                                fontFamily: 'Popins')) : Text(
                                            pastController
                                                .pastOrder!.data![0].orderStatus
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 8,
                                                fontFamily: 'Popins')),
                                      )
                                    ],
                                  ),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       SizedBox(
                                                  height: 20,
                                                  width: MediaQuery.of(context).size.width/1.3,
                                                  child: ListView.separated(
                                                    physics: NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount:pastController.pastOrder!
                                                            .data![0]
                                                          .orderDetail!.isEmpty ?0 :pastController.pastOrder!
                                                            .data![0]
                                                          .orderDetail!.length,
                                                    separatorBuilder: (context, i) {
                                                      return Text(',');
                                                    },
                                                    itemBuilder: (context, i) {
                                                      return Text(pastController.pastOrder!
                                                            .data![0]
                                                          .orderDetail![i]
                                                          .productName
                                                          .toString(),style: FoodigyTextStyle
                                                        .addressTextStyle);
                                                    },
                                                  ),
                                                ),
                                     Text(
                                          "$iRubee ${pastController.pastOrder!.data![0].productTotalCost.toString()}")
                                   
                                     ],
                                   ),
                                  Text(
                                      pastController
                                          .pastOrder!.data![0].orderPlacedTime
                                          .toString(),
                                      style:
                                          FoodigyTextStyle.smallGreyTextStyle),
                                          
                                 SizedBox(
                                  height: 10,
                                 ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(PreviousOrderListScreen());
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            child: Text(
                                              "CHOOSE PREVIOUS ORDER",
                                              style: FoodigyTextStyle
                                                  .addressTextStyle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      );
                    }
                  }),
                )
              ]),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(children: [
                // InkWell(
                //   onTap: () {

                //   },
                //   child: AccountContainer(
                //     isNext: false,
                //     text: 'Other helps topics',
                //   ),
                // ),
                // Divider(
                //   color: Colors.grey.shade200,
                //   thickness: 2,
                // ),
                InkWell(
                  onTap: () {
                    Get.to(AboutFoodigyScreen());
                  },
                  child: AccountContainer(
                    isNext: true,
                    text: 'About Foodigy',
                  ),
                ),
                Divider(
                  color: Colors.grey.shade200,
                  thickness: 2,
                ),
                AccountContainer(
                  isNext: true,
                  text: 'Rate us',
                ),
                Divider(
                  color: Colors.grey.shade200,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    Get.to(FAQScreen());
                  },
                  child: AccountContainer(
                    isNext: true,
                    text: 'FAQ',
                  ),
                ),
                Divider(
                  color: Colors.grey.shade200,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    Get.to(TermsAndConditionProfile());
                  },
                  child: AccountContainer(
                    isNext: true,
                    text: 'Terms & Conditions',
                  ),
                ),
                Divider(
                  color: Colors.grey.shade200,
                  thickness: 2,
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
