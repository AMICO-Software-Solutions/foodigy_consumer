// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:declarative_refresh_indicator/declarative_refresh_indicator.dart';
import 'package:foodigy/controller/chef_profile_controller.dart';
import 'package:foodigy/controller/order_controller/active_order_controller.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/orders_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:foodigy/model/active_order_model.dart';
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

class ActiveOrderViewSummary extends StatefulWidget {
  String? orderType;
  DateTime? orderPlacedDate;
  DateTime? orderAcceptedDate;
  DateTime? orderPickUpDate;
  ActiveOrderModel? pastOrder;
  List<OrderDetail>? orderList;
  List<DeliveryType>? delivery;
  List<RazorpayPayment>? razer;
  int index;
  String? orderPlacedTime;
  ActiveOrderViewSummary(
      {super.key,
      this.orderList,
      this.delivery,
      this.razer,
      this.pastOrder,
      required this.index,
      this.orderType,
      this.orderPlacedDate,
      this.orderAcceptedDate,
      this.orderPickUpDate,
      this.orderPlacedTime});

  @override
  State<ActiveOrderViewSummary> createState() => _ActiveOrderViewSummaryState();
}

int start = 120;
int current = 120;

class _ActiveOrderViewSummaryState extends State<ActiveOrderViewSummary> {
  ActiveOrderController activeController = Get.put(ActiveOrderController());
  ChefProfileController chefProfileController =
      Get.put(ChefProfileController());
  DateTime? orderPlacedDate = DateTime.now();
  DateTime? orderAcceptedDate = DateTime.now();
  DateTime? orderPickUpDate = DateTime.now();

  var _loading = false;
  var forceShowIndicator = false;
  void _load() async {
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    activeController.activeOrderList();
    Timer(const Duration(seconds: 0), () {
      String productTime = DateFormat('HH:mm a').format(orderAcceptedDate!);
      orderAcceptTime(productTime);
    });
    Timer(const Duration(seconds: 0), () {
      String productTime = DateFormat('HH:mm a').format(orderPickUpDate!);
      orderpickeTime(productTime);
    });
    Timer(const Duration(seconds: 0), () {
      String productTime = DateFormat('HH:mm a').format(now!);
      extimateTime(productTime);
    });
    if (mounted) setState(() => _loading = false);
  }

  StepperType stepperType = StepperType.vertical;
  int _currentStep = 0;

  Future<void>? _launched;
  String _phone = '';

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: widget.pastOrder!.data![widget.index].phoneNumber.toString(),
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
    activeController.activeOrderList();
    now = DateTime.parse(
        widget.pastOrder!.data![widget.index].bookingDate.toString());
    placedTime = DateTime.parse(
        widget.pastOrder!.data![widget.index].orderPlacedTime.toString());
    print(placedTime);
    Timer(const Duration(seconds: 0), () {
      orderPlacedDate = activeController
                  .activeOrder!.data![widget.index].orderPlacedTime
                  .toString() ==
              'null'
          ? DateTime.parse("2022-12-20T08:07:50.754Z")
          : DateTime.parse(activeController
              .activeOrder!.data![widget.index].orderPlacedTime
              .toString());
      orderAcceptedDate = activeController
                  .activeOrder!.data![widget.index].acceptedTime
                  .toString() ==
              'null'
          ? DateTime.parse("2022-12-20T08:07:50.754Z")
          : DateTime.parse(activeController
              .activeOrder!.data![widget.index].acceptedTime
              .toString());
      orderPickUpDate = activeController
                  .activeOrder!.data![widget.index].deliveredTime
                  .toString() ==
              'null'
          ? DateTime.parse("2022-12-20T08:07:50.754Z")
          : DateTime.parse(activeController
              .activeOrder!.data![widget.index].deliveredTime
              .toString());
    });

    super.initState();
    _load();
    orderPlaced = widget.orderPlacedDate;
    orderPicked = widget.orderPickUpDate;
    orderAccepted = widget.orderAcceptedDate;

    Timer(const Duration(seconds: 0), () {
      String productTime = DateFormat('HH:mm a').format(orderAcceptedDate!);
      orderAcceptTime(productTime);
    });
    Timer(const Duration(seconds: 0), () {
      String productTime = DateFormat('HH:mm a').format(orderPickUpDate!);
      orderpickeTime(productTime);
    });
    Timer(const Duration(seconds: 0), () {
      String productTime = DateFormat('HH:mm a').format(now!);
      extimateTime(productTime);
    });
    chefProfileController.getProfile(
        widget.pastOrder!.data![widget.index].providerId.toString());

    Timer(const Duration(seconds: 2), () {
      print('provider id');
      print(widget.pastOrder!.data![widget.index].providerId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = 50;
    double legnth = widget.pastOrder!.data![widget.index].orderDetail!.isEmpty
        ? 0
        : widget.pastOrder!.data![widget.index].orderDetail!.length.toDouble();
    double? to;

    to = height * legnth;
    int discountValue = widget.pastOrder!.data![widget.index].couponCost
                .toString() ==
            "null"
        ? 0
        : int.parse(widget.pastOrder!.data![widget.index].productTotalCost
                .toString()) -
            int.parse(
                widget.pastOrder!.data![widget.index].couponCost.toString());

    List<StepperData> stepperData = [
      StepperData(
          title: StepperText(
            "Order Placed",
            textStyle: FoodigyTextStyle.addTocartStyle,
          ),
          subtitle: StepperText(
              "${DateFormat.yMMMd().format(orderPlacedDate!).toString()}, ${widget.orderPlacedTime}"),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(30))),
          )),
      activeController.activeOrder!.data![widget.index].orderStatus ==
                  "ACCEPTED" ||
              widget.pastOrder!.data![widget.index].orderStatus ==
                  "READYTODELIVER"
          ? StepperData(
              title: StepperText(
                "Order accepted",
                textStyle: FoodigyTextStyle.addTocartStyle,
              ),
              subtitle: StepperText(
                  "${DateFormat.yMMMd().format(orderAcceptedDate!).toString()}, ${orderAcceptedTIme.toString()}, "),
              iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                // child: const Icon(Icons.looks_two, color: Colors.white),
              ))
          : StepperData(),
      activeController.activeOrder!.data![widget.index].orderStatus ==
              "ACCEPTED"
          ? deliveryMethod()
          : StepperData(),
      activeController.activeOrder!.data![widget.index].orderStatus ==
              "ACCEPTED"
          ? StepperData(
              title: StepperText(
                "Order is ready to pickup",
                textStyle: FoodigyTextStyle.addTocartStyle,
              ),
              subtitle: StepperText(
                  "${DateFormat.yMMMd().format(orderPickUpDate!).toString()}, ${orderPickedTIme.toString()}"),
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
          subtitle: StepperText(
              "${DateFormat.yMMMd().format(orderPlacedDate!).toString()}, ${widget.orderPlacedTime}"),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(30))),
          )),
      activeController.activeOrder!.data![widget.index].orderStatus ==
                  "ACCEPTED" ||
              activeController.activeOrder!.data![widget.index].orderStatus ==
                  "READYTODELIVER"
          ? StepperData(
              title: StepperText(
                "Order accepted",
                textStyle: FoodigyTextStyle.addTocartStyle,
              ),
              subtitle: StepperText(
                  "${DateFormat.yMMMd().format(orderAcceptedDate!).toString()}, ${orderAcceptedTIme.toString()}"),
              iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                // child: const Icon(Icons.looks_two, color: Colors.white),
              ))
          : StepperData(),
      activeController.activeOrder!.data![widget.index].orderStatus ==
              "READYTODELIVER"
          ? StepperData(
              title: StepperText(
                "Order is ready to pickup",
                textStyle: FoodigyTextStyle.addTocartStyle,
              ),
              subtitle: StepperText(
                  "${DateFormat.yMMMd().format(orderPickUpDate!).toString()}, ${orderPickedTIme.toString()}"),
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
          "Order #: ${widget.pastOrder!.data![widget.index].orderId.toString()}",
          style: FoodigyTextStyle.profileTitleStyle,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: firstColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: DeclarativeRefreshIndicator(
        refreshing: _loading || forceShowIndicator,
        onRefresh: _load,
        color: firstColor,
        child: Obx(() {
          if (activeController.isDataLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(
                color: firstColor,
              ),
            );
          } else if (activeController.activeOrder == null) {
            return Center(
              child: Text(
                'No orders yet',
                style: FoodigyTextStyle.homeHeadLine,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 30,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.3,
                                  spreadRadius: 0.0,
                                ),
                              ]),
                          child: Icon(
                            MdiIcons.refresh,
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Pull down to refresh",
                          style: FoodigyTextStyle.addressTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
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
                      activeController.activeOrder!.data![widget.index]
                                  .deliveredTime
                                  .toString() ==
                              "null"
                          ? Container()
                          : Text(
                              widget
                                  .pastOrder!.data![widget.index].deliveredTime
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
                      activeController.activeOrder!.data![widget.index]
                                  .cancelOrderStatus ==
                              false
                          ? Container()
                          : Row(
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
                                              MaterialStateProperty.all(
                                                  firstColor),
                                        ),
                                        onPressed: () {
                                          print('check');
                                          cancelOrder(widget.pastOrder!
                                              .data![widget.index].orderId
                                              .toString());
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                          ),
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
                                        image: NetworkImage(widget.pastOrder!
                                            .data![widget.index].profileSlug
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
                                    widget.pastOrder!.data![widget.index]
                                        .profileName
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
                widget.orderType.toString() == "TAKEAWAY"
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

                widget.orderType.toString() == "TAKEAWAY"
                    ? Container()
                    : asignCheckContainer(),
                SizedBox(
                  height: 5,
                ),
                // widget.orderType.toString() == "TAKEAWAY"
                //     ? Container()
                //     : Container(
                //         width: double.infinity,
                //         color: Colors.white,
                //         child: Padding(
                //           padding: const EdgeInsets.all(10.0),
                //           child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 SizedBox(
                //                   width: MediaQuery.of(context).size.width / 1.5,
                //                   child: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: const [
                //                       Text(
                //                         "contact me or the chef for further help with the order",
                //                         style: FoodigyTextStyle.aboutChefStyle,
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 SizedBox(
                //                     height: 30,
                //                     width: 30,

                //                     child: IconButton(
                //                         onPressed: () {
                //                           setState(() {
                //                             _launched = _makePhoneCall(_phone);
                //                           });
                //                         },
                //                         icon: Icon(
                //                           MdiIcons.phoneInTalkOutline,
                //                           size: 14,
                //                         )))
                //               ]),
                //         ),
                //       ),
                // SizedBox(
                //   height: 5,
                // ),
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
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: to,
                      width: double.infinity,
                      color: Colors.white,
                      child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: false,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(widget
                                                    .orderList![index]
                                                    .productSlug
                                                    .toString()),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.orderList![index].productName
                                                .toString(),
                                            style:
                                                FoodigyTextStyle.addTocartStyle,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                widget
                                                    .orderList![index].quantity
                                                    .toString(),
                                                style: FoodigyTextStyle
                                                    .aboutChefStyle,
                                              ),
                                              Text(" x ",
                                                  style: FoodigyTextStyle
                                                      .aboutChefStyle),
                                              Text(
                                                  "$iRubee${double.parse(widget.orderList![index].cost.toString()).toStringAsFixed(2)}",
                                                  style: FoodigyTextStyle
                                                      .amountStyle)
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                      "$iRubee${double.parse(widget.orderList![index].total.toString()).toStringAsFixed(2)}",
                                      style: FoodigyTextStyle.amountStyle)
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: widget.orderList!.length),
                    ),
                  ),
                ),
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
                Container(
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
                          value: widget.pastOrder!.data![widget.index]
                                      .productTotalCost ==
                                  null
                              ? '0'
                              : widget.pastOrder!.data![widget.index]
                                  .productTotalCost
                                  .toString()),
                      SizedBox(
                        height: 10,
                      ),
                      paymentCard(
                          title: "Discount",
                          value: widget.pastOrder!.data![widget.index]
                                      .productTotalCost ==
                                  null
                              ? '0'
                              : discountValue.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      paymentCard(
                          title: "After Discount",
                          value: widget.pastOrder!.data![widget.index]
                                      .couponCost ==
                                  null
                              ? '0'
                              : "${int.parse(widget.pastOrder!.data![widget.index].couponCost.toString())}"),
                      SizedBox(
                        height: 10,
                      ),
                      paymentCard(
                          title: "SGST @ 2.5%",
                          value: widget.pastOrder!.data![widget.index]
                                      .sgstCost ==
                                  null
                              ? '0'
                              : widget.pastOrder!.data![widget.index].sgstCost
                                  .toString()),
                      SizedBox(
                        height: 10,
                      ),
                      paymentCard(
                          title: 'CGST @ 2.5%',
                          value: widget.pastOrder!.data![widget.index]
                                      .cgstCost ==
                                  null
                              ? '0'
                              : widget.pastOrder!.data![widget.index].cgstCost
                                  .toString()),
                      SizedBox(
                        height: 10,
                      ),
                      paymentCard(
                          title: 'Delivery Charge',
                          value: widget.pastOrder!.data![widget.index]
                                      .deliveryRate ==
                                  null
                              ? '0'
                              : widget
                                  .pastOrder!.data![widget.index].deliveryRate
                                  .toString()),
                      SizedBox(
                        height: 10,
                      ),
                      paymentCard(
                          title: "Total Amount",
                          value: widget.pastOrder!.data![widget.index].totalCost
                              .toString())
                    ]),
                  ),
                ),
                widget.orderType.toString() == "TAKEAWAY"
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
                widget.orderType.toString() == "TAKEAWAY"
                    ? Obx(() {
                        if (chefProfileController.isDataLoading.isTrue) {
                          return Center(
                            child: Container(),
                          );
                        } else {
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
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Wrap(
                                        children: [
                                          Text(
                                            "${chefProfileController.currentchefProfile!.data!.address![0].addressLine1.toString()} ,${chefProfileController.currentchefProfile!.data!.address![0].addressLine2.toString()} ,${chefProfileController.currentchefProfile!.data!.address![0].city.toString()} ,${chefProfileController.currentchefProfile!.data!.address![0].pincode.toString()}",
                                            style:
                                                FoodigyTextStyle.smallTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          );
                        }
                      })
                    : Container(
                        //height: 100,
                        width: double.infinity, color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text(
                                //       '${widget.pastOrder!.data![widget.index].email.toString()} , ',
                                //       style: FoodigyTextStyle.aboutChefStyle,
                                //     ),
                                //     Text(
                                //       widget.pastOrder!.data![widget.index].phoneNumber
                                //           .toString(),
                                //       style: FoodigyTextStyle.aboutChefStyle,
                                //     )
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                SizedBox(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: Wrap(
                                    children: [
                                      Text(
                                        widget.pastOrder!.data![widget.index]
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
        }),
      ),
    );
  }

  Container asignCheckContainer() {
     for (var i = 0;  i <= activeController.activeOrder!.data![widget.index].deliveryType!.length; i++) {
            if (activeController.activeOrder!.data![widget.index].deliveryType![i].deliveryStatus.toString() ==
            "ASSIGNED") {
               return Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You can reach the delivery person",
                                style: FoodigyTextStyle.aboutChefStyle,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade300),
                                    child: Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(activeController
                                            .activeOrder!
                                            .data![widget.index]
                                            .deliveryType!
                                            .last
                                            .deliveryPersonName
                                            .toString()),
                                        Row(
                                          children: [
                                            Icon(
                                              MdiIcons.phone,
                                              size: 13,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              activeController
                                                  .activeOrder!
                                                  .data![widget.index]
                                                  .deliveryType!
                                                  .last
                                                  .deliveryPersonContactNumber
                                                  .toString(),
                                              style: FoodigyTextStyle
                                                  .smallGreyTextStyle,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            Icon(
                                              MdiIcons.mapMarker,
                                              size: 13,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              "Track Order",
                                              style: FoodigyTextStyle
                                                  .smallGreyTextStyle,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                    );

            }else{
              return Container();
            }

            


          }
          return Container();

   
  }

  StepperData deliveryMethod() {
    if (activeController
        .activeOrder!.data![widget.index].deliveryType!.isEmpty) {
      return StepperData();
    } else {
      for (var i = 0;
          i <=
              activeController
                  .activeOrder!.data![widget.index].deliveryType!.length;
          i++) {
        print(activeController
            .activeOrder!.data![widget.index].deliveryType![i].deliveryStatus);
        if (activeController.activeOrder!.data![widget.index].deliveryType![i]
                .deliveryStatus
                .toString() ==
            "ASSIGNED") {
          return StepperData(
              title: StepperText(
                "Order is ready to pickup",
                textStyle: FoodigyTextStyle.addTocartStyle,
              ),
              subtitle: StepperText(
                  "${DateFormat.yMMMd().format(orderPickUpDate!).toString()}, ${orderPickedTIme.toString()}"),
              iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                // child: const Icon(Icons.looks_3, color: Colors.white),
              ));
        }else{
          return  StepperData();

        }
        
      }
    }
    return StepperData();
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
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => OrdersScreen()));
        //   Get.back();

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
            String valuTwo = valu.toString() == "0" ? "12" : valu.toString();
            orderAcceptedTIme = "${valuTwo.toString()}:${second.toString()} PM";
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
            String valuTwo = valu.toString() == "0" ? "12" : valu.toString();
            orderPickedTIme = "${valuTwo.toString()}:${seco.toString()} PM";
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
            String valuTwo = valu.toString() == "0" ? "12" : valu.toString();
            estimatedTime = "${valuTwo.toString()}:${seco.toString()} PM";
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
