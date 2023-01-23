// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:declarative_refresh_indicator/declarative_refresh_indicator.dart';
import 'package:foodigy/controller/chef_profile_controller.dart';
import 'package:foodigy/controller/order_controller/order_complete_api_controller.dart';
import 'package:foodigy/model/order_completed_model.dart';
import 'package:foodigy/presentation/chef_screens/payment_success_food_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/contact_us_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/profile/order_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quiver/async.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:another_stepper/another_stepper.dart';

class OrderSuccessViewSummary extends StatefulWidget {
    final String? orderId;


  const OrderSuccessViewSummary(
      {super.key, this.orderId,  });

  @override
  State<OrderSuccessViewSummary> createState() => _OrderSuccessViewSummaryState();
}

int start = 120;
int current = 120;

class _OrderSuccessViewSummaryState extends State<OrderSuccessViewSummary> {
  ChefProfileController chefProfileController =
      Get.put(ChefProfileController());
        OrderCompletedApiController orderCompletedApi=Get.put(OrderCompletedApiController());
      

  StepperType stepperType = StepperType.vertical;
  int _currentStep = 0;

  Future<void>? _launched;
  String _phone = '';

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: "099887665",
    );
    // ignore: deprecated_member_use
    await launch(launchUri.toString());
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  DateTime? now = DateTime.now();
  DateTime? placedTime;
  DateTime? acceptedTime = DateTime.now();
  DateTime? pickupTime = DateTime.now();
  DateTime? orderPlaced;
  DateTime? orderAccepted;
  DateTime? orderPicked;

//get timing
  String? orderAcceptedTIme = '';
  String? orderPickedTIme = '';
  String? estimatedTime = '';

  @override
  void initState() {
    print(auth_token.toString());
        orderCompletedApi.orderCompletedList(orderId:widget.orderId.toString() );
    super.initState();
       _load();
    
       Timer(const Duration(seconds: 2), () {
            now = DateTime.parse(
       orderCompletedApi.orderCompletedApi!.data!.bookingDate.toString());
    placedTime = DateTime.parse(
      orderCompletedApi.orderCompletedApi!.data!.orderPlacedTime.toString());
    print(placedTime);
   orderPlaced = orderCompletedApi.orderCompletedApi!.data!.orderPlacedTime;
    orderPicked =orderCompletedApi.orderCompletedApi!.data!.deliveredTime;
    orderAccepted = orderCompletedApi.orderCompletedApi!.data!.acceptedTime;
   });

    Timer(const Duration(seconds: 2), () {
      String productTime =
          DateFormat('HH:mm a').format(orderCompletedApi.orderCompletedApi!.data!.orderPlacedTime!);
      orderAcceptTime(productTime);
    });
    Timer(const Duration(seconds: 2), () {
      String productTime =
          DateFormat('HH:mm a').format(orderCompletedApi.orderCompletedApi!.data!.deliveredTime!);
      orderpickeTime(productTime);
    });
    Timer(const Duration(seconds: 2), () {
      String productTime = DateFormat('HH:mm a').format(now!);
      extimateTime(productTime);
    });
    chefProfileController.getProfile(orderCompletedApi.orderCompletedApi!.data!.providerId.toString());

    Timer(const Duration(seconds: 2), () {
      print('provider id');
     // print(widget.pastOrder!.data![widget.index].providerId.toString());
    });
  }
   var _loading = false;
  var forceShowIndicator = false;
  void _load() async {
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    orderCompletedApi.orderCompletedList(orderId:widget.orderId.toString() );
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {


    List<StepperData> stepperData = [
      StepperData(
          title: StepperText(
            "Order Placed",
            textStyle: FoodigyTextStyle.addTocartStyle,
          ),
    //    subtitle: StepperText(   "${DateFormat.yMMMd().format(widget.orderPlacedDate!).toString()}, ${widget.orderPlacedTime}"),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(30))),
          )),
      orderCompletedApi.orderCompletedApi!.data!.orderStatus == "ACCEPTED" ||
               orderCompletedApi.orderCompletedApi!.data!.orderStatus  ==
                  "READYTODELIVER"
          ? StepperData(
              title: StepperText(
                "Order accepted",
                textStyle: FoodigyTextStyle.addTocartStyle,
              ),
              // subtitle: StepperText(
              //     "${DateFormat.yMMMd().format(widget.orderAcceptedDate!).toString()}, ${orderAcceptedTIme.toString()}, "),
              iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                // child: const Icon(Icons.looks_two, color: Colors.white),
              ))
          : 
          StepperData(),
      orderCompletedApi.orderCompletedApi!.data!.orderStatus == "READYTODELIVER"
          ? StepperData(
              title: StepperText(
                "Order is ready to pickup",
                textStyle: FoodigyTextStyle.addTocartStyle,
              ),
              // subtitle: StepperText(
              //     "${DateFormat.yMMMd().format(widget.orderPickUpDate!).toString()}, ${orderPickedTIme.toString()}"),
              iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                // child: const Icon(Icons.looks_3, color: Colors.white),
              ))
         : StepperData(),
    ];

    List<StepperData> takeAwayStepper = [
      StepperData(
          title: StepperText(
            "Order Placed",
            textStyle: FoodigyTextStyle.addTocartStyle,
          ),
         // subtitle: StepperText("${DateFormat.yMMMd().format(widget.orderPlacedDate!).toString()}, ${widget.orderPlacedTime}"),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(30))),
          )),
     orderCompletedApi.orderCompletedApi!.data!.orderStatus  == "ACCEPTED" ||
               orderCompletedApi.orderCompletedApi!.data!.orderStatus  ==
                  "READYTODELIVER"
          ? 
          StepperData(
              title: StepperText(
                "Order accepted",
                textStyle: FoodigyTextStyle.addTocartStyle,
              ),
             // subtitle: StepperText(   "${DateFormat.yMMMd().format(widget.orderAcceptedDate!).toString()}, ${orderAcceptedTIme.toString()}"),
              iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                // child: const Icon(Icons.looks_two, color: Colors.white),
              ))
         : StepperData(),
      orderCompletedApi.orderCompletedApi!.data!.orderStatus  == "READYTODELIVER"
          ? 
          StepperData(
              title: StepperText(
                "Order is ready to pickup",
                textStyle: FoodigyTextStyle.addTocartStyle,
              ),
            //  subtitle: StepperText("${DateFormat.yMMMd().format(widget.orderPickUpDate!).toString()}, ${orderPickedTIme.toString()}"),
              iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                // child: const Icon(Icons.looks_3, color: Colors.white),
              ))
         : StepperData(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          "Order #: ${widget.orderId.toString()}",
          style: FoodigyTextStyle.profileTitleStyle,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: firstColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:  DeclarativeRefreshIndicator(
        refreshing: _loading || forceShowIndicator,
        onRefresh: _load,
        color: firstColor,
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(height: 30,
              child: Center(child: Text("Swipe To Refresh", style: FoodigyTextStyle.aboutChefStyle,),),
              ),
              Obx(
               () {
        
                if(orderCompletedApi.isDataLoading.isTrue){
                  return SizedBox(
                    height: MediaQuery.of(context).size.height/1.3,
                    child: Center(child: CircularProgressIndicator(color: firstColor,),));
                }else if(orderCompletedApi.orderCompletedApi==null){
                  return Center(child: Text("no data"),);
        
                }
                  return  FutureBuilder(
                      future:orderCompletedApi.orderCompletedList(orderId:widget.orderId.toString() ) ,
                      builder: (context, snapshot) {
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Estimated Delivery time ${DateFormat.yMMMd().format(now!)}, $estimatedTime',
                                      style: TextStyle(
                                        color: firstColor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                      ),
                                    ),
                                orderCompletedApi.orderCompletedApi!.data!.deliveredTime
                                                .toString() ==
                                            "null"
                                        ? Container()
                                        : Text(
                                           orderCompletedApi.orderCompletedApi!.data!.acceptedTime.deliveredTime
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                   orderCompletedApi.orderCompletedApi!.data!.cancelOrderStatus ==
                                            false
                                        ? Container()
                                        :
                                         Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Text(
                                                  "You have only 2 minutes to cancel the order",
                                                  style: TextStyle(
                                                    color: firstColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              current == 0
                                                  ? Container()
                                                  : TextButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty.all(firstColor),
                                                      ),
                                                      onPressed: () {
                                                        cancelOrder(orderCompletedApi.orderCompletedApi!.data!.orderId
                                                            .toString());
                                                      },
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.normal,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,),
                                                      ))
                                                      
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                //   height: 180,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      image: NetworkImage(orderCompletedApi.orderCompletedApi!.data!.profileSlug
                                                          .toString()),
                                                      fit: BoxFit.cover)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  orderCompletedApi.orderCompletedApi!.data!.profileName
                                                      .toString(),
                                                  style: FoodigyTextStyle.homeHeadLine,
                                                ),
                                              ],
                                            ),
                                          ]),
                                          SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    MdiIcons.chatOutline,
                                                    size: 14,
                                                  )))
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Track your order",
                                            style: FoodigyTextStyle.aboutChefStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
                              orderCompletedApi.orderCompletedApi!.data!.deliveryType.toString() == "TAKEAWAY"
                                  ? Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10, left: 20),
                                        child: AnotherStepper(
                                          gap: 30,
                                          stepperList: takeAwayStepper,
                                          stepperDirection: Axis.vertical,
                                          activeBarColor: Colors.grey.shade300,
                                          iconWidth: 20,
                                          iconHeight: 20,
                                          inActiveBarColor: Colors.grey.shade300,
                                          activeIndex: 0,
                                          barThickness: 3,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10, left: 20),
                                        child: AnotherStepper(
                                          gap: 30,
                                          stepperList: stepperData,
                                          stepperDirection: Axis.vertical,
                                          activeBarColor: Colors.grey.shade300,
                                          iconWidth: 20,
                                          iconHeight: 20,
                                          inActiveBarColor: Colors.grey.shade300,
                                          activeIndex: 0,
                                          barThickness: 3,
                                        ),
                                      ),
                                    ),
                             
                              SizedBox(
                                height: 5,
                              ),
                            orderCompletedApi.orderCompletedApi!.data!.deliveryMode.toString() == "TAKEAWAY"
                                  ? Container()
                                 :
                                   Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width / 1.5,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      "contact me or the chef for further help with the order",
                                                      style: FoodigyTextStyle.aboutChefStyle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  // decoration: BoxDecoration(
                                                  //     shape: BoxShape.circle,
                                                  //     color: Colors.white,
                                                  //     boxShadow: const [
                                                  //       BoxShadow(
                                                  //         color: Colors.grey,
                                                  //         blurRadius: 5.0,
                                                  //       ),
                                                  //     ]),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _launched = _makePhoneCall(_phone);
                                                        });
                                                      },
                                                      icon: Icon(
                                                        MdiIcons.phoneInTalkOutline,
                                                        size: 14,
                                                      )))
                                            ]),
                                      ),
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Order Details ",
                                    style: FoodigyTextStyle.aboutChefStyle,
                                  ),
                                ),
                              ),
                              PayMentSuccessFoodList(orderCompletedApi: orderCompletedApi.orderCompletedApi,),
                           
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Payment Details ",
                                    style: FoodigyTextStyle.aboutChefStyle,
                                  ),
                                ),
                              ),
                              paymentContainer(),
                                 orderCompletedApi.orderCompletedApi!.data!.deliveryMode.toString() == "TAKEAWAY"
                                  ? Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "Pickup address",
                                          style: FoodigyTextStyle.aboutChefStyle,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "Delivery address",
                                          style: FoodigyTextStyle.aboutChefStyle,
                                        ),
                                      ),
                                    ),
                             
                             orderCompletedApi.orderCompletedApi!.data!.deliveryMode.toString() == "TAKEAWAY"
                                  ? Obx(
                                    () {
                                      if(chefProfileController.isDataLoading.isTrue){
                                       return Center(child: Container(),);
                                      }else{
                                        return Container(
                                          width: double.infinity,
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 30,
                                                    width: MediaQuery.of(context).size.width / 1.3,
                                                    child: Wrap(
                                                      children: [
                                                        Text(
                                                          "${chefProfileController.currentchefProfile!.data!.address![0].addressLine1.toString()} ,${chefProfileController.currentchefProfile!.data!.address![0].addressLine2.toString()} ,${chefProfileController.currentchefProfile!.data!.address![0].city.toString()} ,${chefProfileController.currentchefProfile!.data!.address![0].pincode.toString()}",
                                                          style: FoodigyTextStyle.smallTextStyle,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        );
                                      }
                                    }
                                  )
                                  : Container(
                                      //height: 100,
                                      width: double.infinity, color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${ orderCompletedApi.orderCompletedApi!.data!.email.toString()} , ',
                                                    style: FoodigyTextStyle.aboutChefStyle,
                                                  ),
                                                  Text(
                                                  orderCompletedApi.orderCompletedApi!.data!.phoneNumber
                                                        .toString(),
                                                    style: FoodigyTextStyle.aboutChefStyle,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 30,
                                                width: MediaQuery.of(context).size.width / 1.3,
                                                child: Wrap(
                                                  children: [
                                                    Text(
                                                    orderCompletedApi.orderCompletedApi!.data!
                                                          .orderAddress
                                                          .toString(),
                                                      style: FoodigyTextStyle.smallTextStyle,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                          
                          
                              Container(
                                //height: 100,
                                width: double.infinity, color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                          
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "Need help with your order?",
                                                  style: FoodigyTextStyle.homeHeadLine,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                         OrderButton(
                                                    buttonColor: firstColor,
                                                    color: firstColor,
                                                    text: "Support",
                                                    onPressed: () {
                                                      Get.to(ContactUsScreen());
                                                    }),
                                        // SizedBox(
                                        //   width: double.infinity,
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.all(0.0),
                                        //     child: Row(
                                        //       mainAxisAlignment: MainAxisAlignment.end,
                                        //       children: [
                                        //         OrderButton(
                                        //             buttonColor: firstColor,
                                        //             color: firstColor,
                                        //             text: "Support",
                                        //             onPressed: () {
                                        //               Get.to(ContactUsScreen());
                                        //             }),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // )
                                      ]),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: double.infinity,
                                color: Colors.white,
                              )
                            ],
                          ),
                        );
                      }
                    );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }



  Container paymentContainer() {
    return Container(
                //height: 100,
                width: double.infinity, color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                 SizedBox(
                      height: 10,
                    ),
                     paymentCard(
                        title: "Amount",
                        value:orderCompletedApi.orderCompletedApi!.data!.productTotalCost==null ? '0':  orderCompletedApi.orderCompletedApi!.data!.productTotalCost
                            .toString()),
                    SizedBox(
                      height: 10,
                    ),
                    //  paymentCard(
                    //     title: "Discount (-)",
                    //     value: orderCompletedApi.orderCompletedApi!.data!.productTotalCost==null ? '0': discountValue.toString() ),
                    //     // discountValue.toString()),
                    SizedBox(
                      height: 10,
                    ),
                     paymentCard(
                        title: "After Discount",
                        value:orderCompletedApi.orderCompletedApi!.data!.couponCost==null ? '0':  "${int.parse( orderCompletedApi.orderCompletedApi!.data!.couponCost.toString())}"),
                    SizedBox(
                      height: 10,
                    ),
                    paymentCard(
                        title: "SGST @ 2.5%",
                        value: orderCompletedApi.orderCompletedApi!.data!.sgstCost==null ? '0': orderCompletedApi.orderCompletedApi!.data!.sgstCost
                            .toString()),
                    SizedBox(
                      height: 10,
                    ),
                    paymentCard(
                        title: 'CGST @ 2.5%',
                        value: orderCompletedApi.orderCompletedApi!.data!.cgstCost==null ? '0':   orderCompletedApi.orderCompletedApi!.data!.cgstCost
                            .toString()),
                    SizedBox(
                      height: 10,
                    ),
                    paymentCard(
                        title: 'Delivery Charge',
                        value: orderCompletedApi.orderCompletedApi!.data!.deliveryRate==null ? '0':  orderCompletedApi.orderCompletedApi!.data!.deliveryRate
                            .toString()),
                    SizedBox(
                      height: 10,
                    ),
                    paymentCard(
                        title: "Total Amount",
                        value: orderCompletedApi.orderCompletedApi!.data!.totalCost
                            .toString())
                   ]),
                ),
              );
  }

  Row paymentCard({String? title, String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toString(),
          style: FoodigyTextStyle.aboutChefStyle,
        ),
        Text(
          '$iRubee ${double.parse(value.toString()).toStringAsFixed(2)}',
          style: FoodigyTextStyle.amountStyle,
        )
      ],
    );
  }

  Future cancelOrder(String? orderId) async {
    try {
      var response = await http.patch(
          Uri.parse('${ApiDomain.apiDomain}/ordermgmt/orders/$orderId'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            "Authorization": 'Bearer ${auth_token.toString()}',
          },
          body: jsonEncode(<String, String>{"orderStatus": "CANCELLED"}));

      print(response.statusCode);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        // print("***************");
        print(response.body);
        // ignore: use_build_context_synchronously
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (_) => OrdersScreen()));
           Get.back();

        //  print(currentUser.runtimeType);
      } else {
        print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      //
    }
  }

  void orderAcceptTime(String? productTime) {
    setState(() {
      //  print("product time");
      //   print(productTime);
      String third = productTime.toString().substring(6, 8);
      //   print(third);
      int valu = int.parse(productTime
              .toString()
              .substring(0, productTime.toString().indexOf(':'))) +
          5;
      String one = productTime.toString().substring(3, 5);
      int second = int.parse(one.toString()) + 30;
      if (third == "AM") {
        print("am values");
        if (int.parse(second.toString()) >= 60) {
          print("more then 60 $valu");
          valu = valu + 1;
          second = second - 60;
          String seco =
              second.toString().length == 1 ? "0$second" : second.toString();
          if (valu < 12) {
            print("$valu $seco $third");
            orderAcceptedTIme = "${valu.toString()}:${seco.toString()} $third";
          } else {
            valu = valu - 12;
            print("$valu $seco PM");
            orderAcceptedTIme = "${valu.toString()}:${seco.toString()} PM";
          }
        } else {
          if (valu < 12) {
            print("$valu $second $third");
            orderAcceptedTIme =
                "${valu.toString()}:${second.toString()} $third";
          } else {
            valu = valu - 12;
            print("$valu $second PM");
            orderAcceptedTIme = "${valu.toString()}:${second.toString()} PM";
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
            orderAcceptedTIme = "${valu.toString()}:${seco.toString()} PM";
          } else {
            orderAcceptedTIme = "${valu.toString()}:${seco.toString()} AM";
            print("$valu $second AM");
          }
        } else {
          if (valu < 24) {
            print("$valu $second $third");
            valu = valu - 12;
            orderAcceptedTIme = "${valu.toString()}:${second.toString()} PM";
          } else {
            orderAcceptedTIme = "${valu.toString()}:${second.toString()} AM";
            print("$valu $second PM");
          }
        }
      }
    });
  }

  void orderpickeTime(String? productTime) {
    setState(() {
      String third = productTime.toString().substring(6, 8);
      int valu = int.parse(productTime
              .toString()
              .substring(0, productTime.toString().indexOf(':'))) +
          5;
      String one = productTime.toString().substring(3, 5);
      int second = int.parse(one.toString()) + 30;
      if (third == "AM") {
        print("am values");
        if (int.parse(second.toString()) >= 60) {
          print("more then 60 $valu");
          valu = valu + 1;
          second = second - 60;
          String seco =
              second.toString().length == 1 ? "0$second" : second.toString();
          if (valu < 12) {
            print("$valu $seco $third");
            orderPickedTIme = "${valu.toString()}:${seco.toString()} $third";
          } else {
            valu = valu - 12;
            print("$valu $seco PM");
            orderPickedTIme = "${valu.toString()}:${seco.toString()} PM";
          }
        } else {
          if (valu < 12) {
            print("$valu $second $third");
            orderPickedTIme = "${valu.toString()}:${second.toString()} $third";
          } else {
            valu = valu - 12;
            print("$valu $second PM");
            orderPickedTIme = "${valu.toString()}:${second.toString()} PM";
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
            orderPickedTIme = "${valu.toString()}:${seco.toString()} PM";
          } else {
            orderPickedTIme = "${valu.toString()}:${seco.toString()} AM";
            print("$valu $second AM");
          }
        } else {
          if (valu < 24) {
            print("$valu $second $third");
            valu = valu - 12;
            orderPickedTIme = "${valu.toString()}:${second.toString()} PM";
          } else {
            orderPickedTIme = "${valu.toString()}:${second.toString()} AM";
            print("$valu $second PM");
          }
        }
      }
    });
  }

  void extimateTime(String? productTime) {
    setState(() {
      String third = productTime.toString().substring(6, 8);
      int valu = int.parse(productTime
              .toString()
              .substring(0, productTime.toString().indexOf(':'))) +
          5;
      String one = productTime.toString().substring(3, 5);
      int second = int.parse(one.toString()) + 30;
      if (third == "AM") {
        print("am values");
        if (int.parse(second.toString()) >= 60) {
          print("more then 60 $valu");
          valu = valu + 1;
          second = second - 60;
          String seco =
              second.toString().length == 1 ? "0$second" : second.toString();
          if (valu < 12) {
            print("$valu $seco $third");
            estimatedTime = "${valu.toString()}:${seco.toString()} $third";
          } else {
            valu = valu - 12;
            print("$valu $seco PM");
            estimatedTime = "${valu.toString()}:${seco.toString()} PM";
          }
        } else {
          if (valu < 12) {
            print("$valu $second $third");
            estimatedTime = "${valu.toString()}:${second.toString()} $third";
          } else {
            valu = valu - 12;
            print("$valu $second PM");
            estimatedTime = "${valu.toString()}:${second.toString()} PM";
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
            estimatedTime = "${valu.toString()}:${seco.toString()} PM";
          } else {
            estimatedTime = "${valu.toString()}:${seco.toString()} AM";
            print("$valu $second AM");
          }
        } else {
          if (valu < 24) {
            print("$valu $second $third");
            valu = valu - 12;
            estimatedTime = "${valu.toString()}:${second.toString()} PM";
          } else {
            estimatedTime = "${valu.toString()}:${second.toString()} AM";
            print("$valu $second PM");
          }
        }
      }
    });
  }
}

