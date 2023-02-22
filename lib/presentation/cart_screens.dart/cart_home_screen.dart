// ignore_for_file: avoid_print, unnecessary_null_comparison, deprecated_member_use
import 'dart:async';
import 'dart:math';
import 'package:declarative_refresh_indicator/declarative_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/address_controller/address_controller.dart';
import 'package:foodigy/controller/cart_controller/cart_count_controller.dart';
import 'package:foodigy/controller/cart_controller/cart_time_controller.dart';
import 'package:foodigy/controller/cart_controller/get_cart_list_controller.dart';
import 'package:foodigy/controller/chef_profile_controller.dart';
import 'package:foodigy/controller/coupons_controller.dart';
import 'package:foodigy/controller/delivery_type_controller/dunzo_controller.dart';
import 'package:foodigy/controller/delivery_type_controller/pick_drop_controller.dart';
import 'package:foodigy/controller/order_controller/create_order_controller.dart';
import 'package:foodigy/controller/user_contoller/current_user_profie_controller.dart';
import 'package:foodigy/presentation/cart_screens.dart/cart_screen.dart';
import 'package:foodigy/presentation/cart_screens.dart/get_cart_screen_details.dart';
import 'package:foodigy/presentation/home_screens/home.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/utilities/foodigy_const_data.dart';
import 'package:foodigy/widgets/delivery_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartHomeScreen extends StatefulWidget {
  final String? uId;
  const CartHomeScreen({
    super.key,
    this.uId,
  });

  @override
  State<CartHomeScreen> createState() => _CartHomeScreenState();
}

String? selectPayType;
//delivery charge variable
bool isDeliveryCharge = false;
String? valueChoose;

class _CartHomeScreenState extends State<CartHomeScreen> {
  GetAddressDetailsController addressListController =
      Get.put(GetAddressDetailsController());
  // CurrentUserAllDetailsController curent =
  //     Get.put(CurrentUserAllDetailsController());
  GetCartDetailsController cartListController =
      Get.put(GetCartDetailsController());
  CurrentUserProfileController registerController =
      Get.put(CurrentUserProfileController());
  GetDunzoController dunzoController = Get.put(GetDunzoController());
  PickDropController pickDropController = Get.put(PickDropController());
  ChefProfileController chefProfileController =
      Get.put(ChefProfileController());
  CreateOrderController createOrderController =
      Get.put(CreateOrderController());
  CartCountController cartCountCntroller = Get.put(CartCountController());
  CartTimerController cartTimer = Get.put(CartTimerController());
  CouponsController couponController = Get.put(CouponsController());

  late var _razorpay;

  bool isCoupon = false;

  @override
  void initState() {
    valueChoose = null;
    selectPayType = null;
    isDeliveryCharge = false;
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        createOrderController.handlePaymentSuccess);
    _razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR, createOrderController.handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
        createOrderController.handleExternalWallet);
    //fo();

    Timer(const Duration(seconds: 0), () {
      registerController.getProfile();
    });
    //addressListController.getAddressDetails();
    Timer(const Duration(seconds: 0), () {
      cartListController.getCartDetails(widget.uId.toString());
    });

    Timer(const Duration(seconds: 0), () {
      addressListController.getAddressDetails();
    });

    Timer(const Duration(seconds: 0), () {
      getChefProfile();
    });

    Timer(const Duration(seconds: 0), () {
      //print("cart get maximum timing");
      cartTimer.getMaxTiming(deliveryDisplayDate);
    });

    Timer(const Duration(seconds: 1), () {
      addCart();
    });
    Timer(const Duration(seconds: 2), () {
      couponController.getCoupons(
          cartValue: totalValue.toString(),
          consumerId: currentUserId,
          chefId: cartListController.cartList!.data!.cartDetails![0].providerId
              .toString(),
          orderDate: deliveryDate);
    });

    super.initState();
    _load();
  }

  TextEditingController noteController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  var products = [];
  DateTime? newDateTimeObj2;
  //calendar date
  String deliveryDate = DateFormat('MM-dd-yyyy').format(DateTime.now());
  String deliveryDisplayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  var bookingIsoDate =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(DateTime.now());
  List items = ["item1", "item2", "item3", "item4"];
  var deliveryCharge = 0.toInt();
  var discountValue = 0.0;
  String? couponId;
  String? couponCode;

  //selected date and time
  String dunsoTime = '';
  String dunsoSheduleTime = '';
  String dunsoDate = '';
  String pickUpTime = '';
  String pickUpDate =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

  Map<String, dynamic> cartList = {};
  Future addCart() async {
    products.clear();

    for (int i = 0;
        i < cartListController.cartList!.data!.cartDetails!.length;
        i++) {
      cartList = {
        "cartDetailsId": int.parse(cartListController
            .cartList!.data!.cartDetails![i].cartDetailsId
            .toString()),
        "cartId": int.parse(cartListController
            .cartList!.data!.cartDetails![i].cartId
            .toString()),
        "productId": int.parse(cartListController
            .cartList!.data!.cartDetails![i].itemId
            .toString()),
        "productName": cartListController
            .cartList!.data!.cartDetails![i].itemName
            .toString(),
        "productDescription": cartListController
            .cartList!.data!.cartDetails![i].itemDesc
            .toString(),
        "productSlug": cartListController
            .cartList!.data!.cartDetails![i].itemSlug
            .toString(),
        "quantity": int.parse(cartListController
            .cartList!.data!.cartDetails![i].quantity
            .toString()),
        "status": true,
        "cost": int.parse(cartListController
            .cartList!.data!.cartDetails![i].itemCost
            .toString()),
        "tax": PriceDetails().taxvalueConst,
        "total": int.parse(cartListController
            .cartList!.data!.cartDetails![i].total
            .toString()),
        "couponDiscount": 1,
        "currency": "INR"
      };
      products.add(cartList);
      print(cartList);

      // Product(i.toString(), quotationList[i][0], quotationList[i][1],
      //     quotationList[i][2]),
    }
  }

  void getChefProfile() {
    Timer(const Duration(seconds: 2), () {
      print("provider id ${cartListController
          .cartList!.data!.cartDetails![0].providerId
          .toString()}");
      chefProfileController.getProfile(cartListController
          .cartList!.data!.cartDetails![0].providerId
          .toString());
    });
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  var _loading = false;
  var forceShowIndicator = false;
  void _load() async {
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    // registerController.getProfile();
    cartListController.getCartDetails('');
    if (mounted) setState(() => _loading = false);
  }

  //if coupon is apply

  String totalAmountWithTaxCoupon = '';
  String totalTaxCoupon = '';
  String sgstCostCoupon = '';
  String cgstCostCoupon = '';
  int afterDiscountValue = 0;
  int totalCostWithCouponTax = 0;

  bool isabsorb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: () {
            //   cartListController.getCartDetails(widget.uId.toString());
          },
          child: Text(
            'Cart',
            style: FoodigyTextStyle.homeHeadLine,
          ),
        ),
        actions: const [
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: DeclarativeRefreshIndicator(
        color: firstColor,
        refreshing: _loading || forceShowIndicator,
        onRefresh: _load,
        child: AbsorbPointer(
          absorbing: isabsorb,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                Form(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    // height: double.infinity,
                    width: double.infinity,
                    child: Obx(() {
                      if (cartListController.isDataLoading.value == true) {
                        return Center(
                          child: CircularProgressIndicator(color: firstColor),
                        );
                      } else if (cartListController.cartList == null) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Image(
                                  image:
                                      AssetImage("assets/images/emptycart.png"),
                                  height: 200,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Your Cart is Empty!",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(firstColor)),
                                onPressed: () {
                                  // Get.to(ViewAllItemPaginationScreen());
                                  Get.offUntil(
                                    GetPageRoute(
                                      page: () => Home(),
                                    ),
                                    ModalRoute.withName('toNewLogin'),
                                  );
                                },
                                child: Text(
                                  "Browse Menu",
                                  style: FoodigyTextStyle.profileTitleStyle,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (cartListController.cartList!.data != null) {
                        double roundDouble(double value, int places) {
                          num mod = pow(10.0, places);
                          return ((value * mod).round().toDouble() / mod);
                        }

                        double percentage =
                            (2.5 / 100) * int.parse(totalValue.toString());
                       //// var taxtotalCost = (percentage * 2);
                        var totalTax = roundDouble(percentage, 2) +
                            roundDouble(percentage, 2);
                        //    var totalTax = (percentage * 2) + deliveryCharge;
                       //// var tTotalTx = totalTax.toInt();

                        int totalAmountWithTax = totalTax.toInt() + totalValue;

                        return Column(
                          children: [
                            FutureBuilder(
                                future: cartListController
                                    .  getLoader(),
                                builder: (context, snapshot) {
                                  return SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        cartListController.cartList!.data!
                                                    .cartDetails!.length >
                                                1
                                            ? Container(
                                                height: 25,
                                                width: double.infinity,
                                                color: Colors
                                                    .cyanAccent.shade100
                                                    .withOpacity(0.3),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    "Based on your items, delivery is available at ${cartTimer.allTimes.isEmpty ? "" : cartTimer.allTimes[0]}",
                                                    style: FoodigyTextStyle
                                                        .aboutChefStyle,
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.73,
                                          child: SingleChildScrollView(
                                            child: Form(
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              key: formkey,
                                              child: Column(
                                                children: [
                                                  GetCartScreenDetails(
                                                    uId: widget.uId,
                                                    cartData: cartListController
                                                        .cartList,
                                                  ),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 80,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade200)),
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 5,
                                                                      right: 5),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: (){
                                                                     
                                                                      cartTimer
                                                                          .getMaxTiming(deliveryDisplayDate);
                                                                    },

                                                                    child: Text(
                                                                      "Delivery date and time*",
                                                                      style: FoodigyTextStyle
                                                                          .addTocartStyle,
                                                                    ),
                                                                  ),
                                                                  FutureBuilder(
                                                                      future: cartTimer
                                                                          .getMaxTiming(deliveryDisplayDate),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        return SizedBox(
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              120,
                                                                          child: DropdownButtonFormField(
                                                                              menuMaxHeight: 250.0,
                                                                              decoration: InputDecoration(
                                                                                  errorStyle: FoodigyTextStyle.errorStyle,
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                                                                                  ),
                                                                                  focusedBorder: InputBorder.none,
                                                                                  border: valueChoose == null
                                                                                      ? OutlineInputBorder(
                                                                                          borderSide: BorderSide(color: Color(0XFFFFCC00).withOpacity(0.5), width: 0.5),
                                                                                        )
                                                                                      : InputBorder.none),
                                                                              //  isExpanded: true,
                                                                              validator: (value) => value == null ? 'Please fill out fields.' : null,
                                                                              value: valueChoose,
                                                                              items: cartTimer.allTimes.map((valueItem) {
                                                                                return DropdownMenuItem<String>(
                                                                                    // ignore: sort_child_properties_last
                                                                                    child: Text(
                                                                                      valueItem,
                                                                                      style: FoodigyTextStyle.addTocartStyle,
                                                                                    ),
                                                                                    value: valueItem);
                                                                              }).toList(),
                                                                              onChanged: (newValue) {
                                                                                
                                                                                selectPayType = null;
                                                                                //  setState(() {
                                                                                isDeliveryCharge = false;
                                                                                valueChoose = newValue as String?;
                                                                                print('new value');

                                                                                pickUpTime = newValue.toString();
                                                                                print(pickUpTime);
                                                                                if (newValue.toString().contains("am")) {
                                                                                  print("$newValue AM");
                                                                                } else {
                                                                                  int first = int.parse(newValue.toString().substring(0, newValue.toString().indexOf(':')));
                                                                                  String second = newValue.toString().substring(newValue.toString().indexOf(':') + 1, newValue.toString().indexOf(' '));
                                                                                  int data = first + 12;
                                                                                  dunsoTime = "$data:$second";

                                                                                  print("$data:$second ");
                                                                                }
                                                                                //   });
                                                                              }),
                                                                        );
                                                                      }),
                                                                  Container(
                                                                      child: deliveryDate ==
                                                                              null
                                                                          ? IconButton(
                                                                              onPressed: () async {
                                                                                showDate();
                                                                                isDeliveryCharge = false;
                                                                              },
                                                                              icon: Icon(
                                                                                MdiIcons.calendar,
                                                                                color: Colors.grey,
                                                                              ))
                                                                          : InkWell(
                                                                              onTap: () {
                                                                                isDeliveryCharge = false;
                                                                                showDate();
                                                                              },
                                                                              child: Text(
                                                                                deliveryDisplayDate.toString(),
                                                                                style: FoodigyTextStyle.addTocartStyle,
                                                                              )))
                                                                ],
                                                              )),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          //goToSecondScreen();
                                                          couponController.getCoupons(
                                                              cartValue:
                                                                  totalValue
                                                                      .toString(),
                                                              consumerId:
                                                                  currentUserId,
                                                              chefId: cartListController
                                                                  .cartList!
                                                                  .data!
                                                                  .cartDetails![
                                                                      0]
                                                                  .providerId
                                                                  .toString(),
                                                              orderDate:
                                                                  deliveryDate);
                                                          showAddNoteDialog(
                                                              context);
                                                        },
                                                        child: Container(
                                                          height: 50,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              1,
                                                          color: Colors
                                                              .yellow.shade100,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        15),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(MdiIcons
                                                                        .ticketPercentOutline),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                      "Rewards and Discounts",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .red
                                                                              .shade600,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    )
                                                                  ],
                                                                ),
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          deliveryDate);
                                                                      print(
                                                                          totalValue);
                                                                      print(cartListController
                                                                          .cartList!
                                                                          .data!
                                                                          .cartValue
                                                                          .toString());
                                                                      print(
                                                                          currentUserId);
                                                                      print(
                                                                        cartListController
                                                                            .cartList!
                                                                            .data!
                                                                            .cartDetails![0]
                                                                            .providerId
                                                                            .toString(),
                                                                      );
                                                                      couponController.getCoupons(
                                                                          cartValue: totalValue
                                                                              .toString(),
                                                                          consumerId:
                                                                              currentUserId,
                                                                          chefId: cartListController
                                                                              .cartList!
                                                                              .data!
                                                                              .cartDetails![
                                                                                  0]
                                                                              .providerId
                                                                              .toString(),
                                                                          orderDate:
                                                                              deliveryDate);
                                                                      // showAddNoteDialog(
                                                                      //     context);
                                                                      //  showMyDialog();
                                                                    },
                                                                    icon: Icon(
                                                                      MdiIcons
                                                                          .arrowRight,
                                                                      size: 16,
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      pickUpTime == ""
                                                          ? ErrorContainer()
                                                          : (selectPayType ==
                                                                  null
                                                              ? InkWell(
                                                                  onTap: () {
                                                                     cartListController.getCartDetails('');
                                                                   Timer(const Duration(seconds: 1), () {
      addCart();
    });
                                                                    isDeliveryCharge =
                                                                        true;
                                                                    print(
                                                                        'delivery date');
                                                                    print(
                                                                        deliveryDate);
                                                                    String t =
                                                                        "${dunsoTime.toString()}:00";
                                                                    DateTime
                                                                        sendDate =
                                                                        DateFormat("MM-dd-yyyy HH:mm:ss")
                                                                            .parse("$deliveryDate $t");
                                                                    // print("dunxo");
                                                                    // print(sendDate);
                                                                    print(sendDate
                                                                        .microsecondsSinceEpoch);
                                                                    dunsoSheduleTime = sendDate
                                                                        .millisecondsSinceEpoch
                                                                        .toString()
                                                                        .substring(
                                                                            0,
                                                                            10);
                                                                    print(
                                                                        dunsoSheduleTime);
                                                                    dunzoController.getDunzo(
                                                                        cheflat: chefProfileController
                                                                            .currentchefProfile!
                                                                            .data!
                                                                            .address![
                                                                                0]
                                                                            .latitude
                                                                            .toString(),
                                                                        chefLong: chefProfileController
                                                                            .currentchefProfile!
                                                                            .data!
                                                                            .address![
                                                                                0]
                                                                            .longitude
                                                                            .toString(),
                                                                        cusLat: latFoodigy
                                                                            .toString(),
                                                                        cusLong:
                                                                            longFoodigy
                                                                                .toString(),
                                                                        sheduleTime:
                                                                            dunsoSheduleTime.toString());
                                                                    pickDropController.getPickDrop(
                                                                        chefLat: chefProfileController
                                                                            .currentchefProfile!
                                                                            .data!
                                                                            .address![
                                                                                0]
                                                                            .latitude
                                                                            .toString(),
                                                                        chefLong: chefProfileController
                                                                            .currentchefProfile!
                                                                            .data!
                                                                            .address![
                                                                                0]
                                                                            .longitude
                                                                            .toString(),
                                                                        cusLat: latFoodigy
                                                                            .toString(),
                                                                        cusLong:
                                                                            longFoodigy
                                                                                .toString(),
                                                                        time:
                                                                            pickUpTime,
                                                                        date:
                                                                            pickUpDate);
                                                                  },
                                                                  child:
                                                                      ErrorContainer())
                                                              : Container(
                                                                  color: Colors
                                                                      .white,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15,
                                                                        top: 15,
                                                                        bottom:
                                                                            15),
                                                                    child: Row(
                                                                      children: [
                                                                        InkWell(
                                                                            onTap:
                                                                                () {
                                                                                   cartListController.getCartDetails('');
                                                                                    Timer(const Duration(seconds: 1), () {
      addCart();
    });
                                                                        
                                                                              isDeliveryCharge = !isDeliveryCharge;
                                                                              print(pickUpDate);
                                                                              print(pickUpTime);

                                                                              dunzoController.getDunzo(cheflat: chefProfileController.currentchefProfile!.data!.address![0].latitude.toString(), chefLong: chefProfileController.currentchefProfile!.data!.address![0].longitude.toString(), cusLat: latFoodigy.toString(), cusLong: longFoodigy.toString(), sheduleTime: dunsoSheduleTime.toString());
                                                                              pickDropController.getPickDrop(chefLat: chefProfileController.currentchefProfile!.data!.address![0].latitude.toString(), chefLong: chefProfileController.currentchefProfile!.data!.address![0].longitude.toString(), cusLat: latFoodigy.toString(), cusLong: longFoodigy.toString(), time: pickUpTime, date: pickUpDate);
                                                                            },
                                                                            child: SizedBox(
                                                                                child: Row(
                                                                              children: const [
                                                                                Text(
                                                                                  "Choose delivery type*",
                                                                                  style: FoodigyTextStyle.addTocartStyle,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                Icon(
                                                                                  MdiIcons.chevronDown,
                                                                                  size: 18,
                                                                                )
                                                                              ],
                                                                            ))),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )),
                                                      deliveryFunction(),
                                                      Container(
                                                        width: double.infinity,
                                                        color: Colors
                                                            .grey.shade100,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Text(
                                                            "Bill Details",
                                                            style: FoodigyTextStyle
                                                                .addTocartStyle,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 400,
                                                        width: double.infinity,
                                                        color: Colors.white,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: InkWell(
                                                            onTap: () {
                                                              //  print(totalValue);
                                                            },
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "Items in cart",
                                                                          style:
                                                                              FoodigyTextStyle.addTocartStyle,
                                                                        ),
                                                                        Text(
                                                                          '${cartListController.cartList!.data!.cartDetails!.length}',
                                                                          style: TextStyle(
                                                                              // fontFamily: 'Poppins',
                                                                              fontSize: 12,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w400),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    cartMethod(
                                                                        title:
                                                                            "Subtotal Amount",
                                                                        value:
                                                                            "${iRubee.toString()} ${double.parse(totalValue.toString()).toStringAsFixed(2)}"),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    cartMethod(
                                                                        title: couponCode ==
                                                                                null
                                                                            ? "Discount "
                                                                            : "Discount (${couponCode.toString()})",
                                                                        value:
                                                                            "\u{20B9} -${double.parse(discountValue.toString()).toStringAsFixed(2)}"),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    cartMethod(
                                                                        title:
                                                                            "After Discount",
                                                                        value: afterDiscountValue ==
                                                                                0
                                                                            ? "${iRubee.toString()} ${double.parse(totalValue.toString()).toStringAsFixed(2)}"
                                                                            : "${iRubee.toString()} ${double.parse(afterDiscountValue.toString()).toStringAsFixed(2)}"),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    cartMethod(
                                                                        title:
                                                                            "SGST @ 2.5%",
                                                                        value: sgstCostCoupon ==
                                                                                ""
                                                                            ? "\u{20B9} ${double.parse(percentage.toString()).toStringAsFixed(2)}"
                                                                            : "\u{20B9} ${double.parse(sgstCostCoupon.toString()).toStringAsFixed(2)}"),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    cartMethod(
                                                                        title:
                                                                            "CGST @ 2.5%",
                                                                        value: cgstCostCoupon ==
                                                                                ""
                                                                            ? "\u{20B9} ${double.parse(percentage.toString()).toStringAsFixed(2)}"
                                                                            : "\u{20B9} ${double.parse(cgstCostCoupon.toString()).toStringAsFixed(2)}"),
                                                                    // cartMethod(
                                                                    //     title: "CGST @ 2.5%",
                                                                    //     value:
                                                                    //         "\u{20B9} ${(2.5 / 100) * int.parse(totalValue.toString())}"),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    InkWell(
                                                                      onTap: (){
                                                                        print(bookingIsoDate
                                                                              .toString());
                                                                        print(deliveryCharge
                                                                              .toString(),);
                                                                              print(selectPayType
                                                                          .toString()
                                                                          .toUpperCase());
                                                                      },
                                                                      child: cartMethod(
                                                                          title:
                                                                              "Delivery charge",
                                                                          value:
                                                                              "\u{20B9} ${double.parse(deliveryCharge.toString()).toStringAsFixed(2)}"),
                                                                    ),
                                                                    // SizedBox(
                                                                    //   height: 10,
                                                                    // ),
                                                                    // cartMethod(
                                                                    //     title: "Total tax",
                                                                    //     value:
                                                                    //         "\u{20B9} ${double.parse(totalTax.toString()).toStringAsFixed(2)}"),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    cartMethod(
                                                                        isFAmount:
                                                                            true,
                                                                        title:
                                                                            "Grand Total",
                                                                        value: totalCostWithCouponTax ==
                                                                                0
                                                                            ? "\u{20B9} ${totalAmountWithTax + deliveryCharge}"
                                                                            : "\u{20B9} ${totalCostWithCouponTax + deliveryCharge}"),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    TextFieldCart(
                                                                        noteController:
                                                                            noteController),

                                                                    // cartMethod(
                                                                    //     isFAmount: true,
                                                                    //     title:
                                                                    //         "Grand Total",
                                                                    //     value: totalCostWithCouponTax ==
                                                                    //             0
                                                                    //         ? "\u{20B9} ${double.parse(totalAmountWithTax.toString()).toStringAsFixed(2)}"
                                                                    //         : "\u{20B9} ${double.parse(totalCostWithCouponTax.toString()).toStringAsFixed(2)}"),
                                                                  ]),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            SizedBox(
                              // height: MediaQuery.of(context).size.height / 4.5,
                              // height: 500,
                              width: double.infinity,
                              child: FutureBuilder(
                                  //  future: cartListController.getCartDetails(  widget.uId.toString()),
                                  builder: (context, snapshot) {
                                return Container(
                                  color: Colors.white,
                                  height: 150,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Divider(
                                          color: Colors.black,
                                        ),
                                        selectPayType == "Takeaway"
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text(
                                                        'Pickup Address ',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text(
                                                        'Delivery Address',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    selectPayType == "Takeaway"
                                                        ? SizedBox(
                                                            height: 30,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.2,
                                                            child: Wrap(
                                                              children: [
                                                                Text(
                                                                    "${chefProfileController.currentchefProfile!.data!.address![0].addressLine1.toString()} ,${chefProfileController.currentchefProfile!.data!.address![0].addressLine2.toString()} ,${chefProfileController.currentchefProfile!.data!.address![0].city.toString()} ,${chefProfileController.currentchefProfile!.data!.address![0].pincode.toString()}",
                                                                    style: FoodigyTextStyle
                                                                        .smallTextStyle),
                                                              ],
                                                            ),
                                                          )
                                                        : SizedBox(
                                                            height: 30,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.2,
                                                            child: Wrap(
                                                              children: [
                                                                Text(
                                                                    selectedAddress.toString() ==
                                                                            ""
                                                                        ? add
                                                                        : selectedAddress,
                                                                    style: FoodigyTextStyle
                                                                        .smallTextStyle),
                                                              ],
                                                            ),
                                                          ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        'Delivery date : $deliveryDisplayDate',
                                                        style: FoodigyTextStyle
                                                            .smallTextStyle),
                                                    GetBuilder<
                                                            CartCountController>(
                                                        init:
                                                            CartCountController(),
                                                        builder:
                                                            (cartController) {
                                                          // return registerController.pressedBool
                                                          return InkWell(
                                                            onTap: () {
                                                              
                                                              // print(cartController
                                                              //     .totValu
                                                              //     .toString());
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: const [
                                                                    // SizedBox(
                                                                    //     child: Text(
                                                                    //   'Value ${cartController.totValu}',
                                                                    //   style: const TextStyle(
                                                                    //     fontSize: 12.0,
                                                                    //     color: Colors.black,
                                                                    //   ),
                                                                    // )),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${cartListController.cartList!.data!.cartDetails!.length} items in cart",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      Text(totalCostWithCouponTax ==
                                                              0
                                                          ? "\u{20B9} ${totalAmountWithTax + deliveryCharge}"
                                                          : "\u{20B9} ${totalCostWithCouponTax + deliveryCharge}"),
                                                    ],
                                                  )),
                                              selectPayType == null
                                                  ? placeOrderButtondisable()
                                                  : Obx(() {
                                                      if (createOrderController
                                                          .isDataLoading
                                                          .isTrue) {
                                                        return placeOrderButtondisable();
                                                      } else {
                                                        return SizedBox(
                                                          height: 38,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                          child: TextButton(
                                                            // ignore: sort_child_properties_last
                                                            child: Text(
                                                              "Place order",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            style: TextButton.styleFrom(
                                                                foregroundColor: Colors
                                                                    .purple, backgroundColor:
                                                                    firstColor,
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        'Poppins')),
                                                            onPressed: () {
                                                              print("coupons");
                                                              print(couponCode);
                                                              print(
                                                                  "here $couponId");
                                                              print(discountValue
                                                                          .toInt() ==
                                                                      0
                                                                  ? null
                                                                  : discountValue
                                                                      .toInt()
                                                                      .toString());
                                                              print('done');
                                                              setState(() {
                                                                isabsorb = true;
                                                              });
                                                              createOrderController
                                                                  .createOrder(
                                                                      cart:
                                                                          products,
                                                                      deliveryRate:
                                                                          deliveryCharge
                                                                              .toString(),
                                                                      couponId:
                                                                          couponId,
                                                                      couponCode:
                                                                          couponCode,
                                                                      couponCost: discountValue
                                                                          .toInt()
                                                                          .toString(),
                                                                      deliveryMode: selectPayType
                                                                          .toString()
                                                                          .toUpperCase(),
                                                                      currentProfile:
                                                                          registerController
                                                                              .currentProfile,
                                                                      cartData:
                                                                          cartListController
                                                                              .cartList,
                                                                      addressId: selectPayType == "Takeaway"
                                                                          ? chefProfileController
                                                                              .currentchefProfile!
                                                                              .data!
                                                                              .address![
                                                                                  0]
                                                                              .id
                                                                          : selecteAddressId
                                                                              .toString(),
                                                                      address: selectPayType == "Takeaway"
                                                                          ?(selectedAddress.toString() == ""
                                                                              ? add
                                                                              : selectedAddress)
                                                                          // "${chefProfileController.currentchefProfile!.data!.address![0].addressLine1
                                                                          //     .toString()}, ${chefProfileController.currentchefProfile!.data!.address![0].addressLine2
                                                                          //     .toString()}, ${chefProfileController.currentchefProfile!.data!.address![0].city
                                                                          //     .toString()}, ${chefProfileController.currentchefProfile!.data!.address![0].state
                                                                          //     .toString()}, ${chefProfileController.currentchefProfile!.data!.address![0].country
                                                                          //     .toString()}, ${chefProfileController.currentchefProfile!.data!.address![0].pincode
                                                                          //     .toString()}" 
                                                                          : (selectedAddress.toString() == ""
                                                                              ? add
                                                                              : selectedAddress),
                                                                      bookingDate:
                                                                          bookingIsoDate
                                                                              .toString(),
                                                                      totalCost: totalCostWithCouponTax == 0
                                                                          ? "${totalAmountWithTax + deliveryCharge}"
                                                                          : "${totalCostWithCouponTax + deliveryCharge}",
                                                                      taxTotalCost: totalTaxCoupon == ''
                                                                          ? totalTax
                                                                              .toString()
                                                                          : totalTaxCoupon
                                                                              .toString(),
                                                                      productTotalCost:
                                                                          totalValue
                                                                              .toString(),
                                                                      sgstCost: sgstCostCoupon == ''
                                                                          ? percentage.toString()
                                                                          : sgstCostCoupon.toString(),
                                                                      cgstCost: cgstCostCoupon == '' ? percentage.toString() : cgstCostCoupon.toString(),
                                                                      notes: noteController.text)
                                                                  .whenComplete(() {
                                                                setState(() {
                                                                  isabsorb =
                                                                      false;
                                                                });
                                                                razorPay();
                                                              });
                                                            },
                                                          ),
                                                        );
                                                      }
                                                    })
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        );
                      } else {
                        return SizedBox(
                          child: Text("error"),
                        );
                      }
                    }),
                  ),
                ),
                Container(
                  height: 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox deliveryFunction() {
    return SizedBox(
      child: isDeliveryCharge == true
          ? Container(
              // height: 160,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Obx(() {
                      if (dunzoController.isDataLoading.isTrue) {
                         return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: selectPayType == "Dunzo"
                                            ? Icon(
                                                MdiIcons.circle,
                                                color: Colors.grey.shade500,
                                                size: 10,
                                              )
                                            : Container(),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Dunzo service charge",
                                        style: FoodigyTextStyle
                                            .addTocartDisableStyle,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        width: 70,
                                        child: Text(
                                          " ",
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        );
                      } else if (dunzoController.dunzoList != null) {
                        return InkWell(
                          onTap: () {
                            //      setState(() {
                            selectPayType = "Dunzo";
                            deliveryCharge = int.parse(dunzoController
                                .dunzoList!
                                .estimatedPriceBreakup!
                                .deliveryCharge
                                .toString());
                            print(deliveryCharge);
                            //     });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: selectPayType == "Dunzo"
                                            ? Icon(
                                                MdiIcons.circle,
                                                color: Colors.grey.shade500,
                                                size: 10,
                                              )
                                            : Container(),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Dunzo service charge",
                                        style: FoodigyTextStyle.addTocartStyle,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        width: 70,
                                        child: Text(
                                          "$iRubee ${double.parse(dunzoController.dunzoList!.estimatedPriceBreakup!.deliveryCharge.toString()).toStringAsFixed(2)}",
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: selectPayType == "Dunzo"
                                            ? Icon(
                                                MdiIcons.circle,
                                                color: Colors.grey.shade500,
                                                size: 10,
                                              )
                                            : Container(),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/1.6,
                                        child: Text(
                                          "Dunzo is not available to deliver at tis time. Please select another delivery type",
                                          style: FoodigyTextStyle.addTocartDeliveryDisableStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        width: 70,
                                        child: Text(
                                          " ",
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        );

                      }
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      if (pickDropController.isDataLoading.isTrue) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: selectPayType == "pickDrop"
                                          ? Icon(
                                              MdiIcons.circle,
                                              color: Colors.grey.shade500,
                                              size: 10,
                                            )
                                          : Container(),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "PickDrop service charge",
                                      style: FoodigyTextStyle
                                          .addTocartDisableStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      width: 70,
                                      child: Text(
                                        "",
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        );
                      } else if (pickDropController.pickDropList != null) {
                        return InkWell(
                          onTap: () {
                            selectPayType = "pickDrop";
                            //deliveryCharge=10;
                            print("helo");
                            print(pickDropController
                                .pickDropList!.deliveryCharge!
                                .toInt());

                            deliveryCharge = int.parse(pickDropController
                                .pickDropList!.deliveryCharge!
                                .toInt()
                                .toString());
                            print(deliveryCharge.toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: selectPayType == "pickDrop"
                                            ? Icon(
                                                MdiIcons.circle,
                                                color: Colors.grey.shade500,
                                                size: 10,
                                              )
                                            : Container(),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "pickDrop service charge",
                                        style: FoodigyTextStyle.addTocartStyle,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        width: 70,
                                        child: Text(
                                          "$iRubee ${double.parse(pickDropController.pickDropList!.deliveryCharge.toString()).toStringAsFixed(2)}",
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: selectPayType == "pickDrop"
                                          ? Icon(
                                              MdiIcons.circle,
                                              color: Colors.grey.shade500,
                                              size: 10,
                                            )
                                          : Container(),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width/1.6,
                                        child: Text(
                                          "PickDrop is not available to deliver at tis time. Please select another delivery type",
                                          style: FoodigyTextStyle.addTocartDeliveryDisableStyle,
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      width: 70,
                                      child: Text(
                                        "",
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        );
                      }
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        deliveryCharge = 0;
                        selectPayType = "Takeaway";
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: selectPayType == "Takeaway"
                                        ? Icon(
                                            MdiIcons.circle,
                                            color: Colors.grey.shade500,
                                            size: 10,
                                          )
                                        : Container(),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Takeaway",
                                    style: FoodigyTextStyle.addTocartStyle,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    width: 70,
                                    child: Text(
                                      "$iRubee 0.00",
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }

  Row cartMethod({String? title, String? value, bool? isFAmount = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toString(),
          style: FoodigyTextStyle.addTocartStyle,
        ),
        isFAmount == true
            ? Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  value.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Text(
                value.toString(),
                style: TextStyle(
                    // fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              )
      ],
    );
  }

  void razorPay() {
    // //Make payment
    var options = {
      'key': createOrderController.createList!.data!.response!.key.toString(),
      'amount':
          createOrderController.createList!.data!.response!.amount.toString(),
      'currency': createOrderController.createList!.data!.response!.currency
          .toString(), //in the smallest currency sub-unit.
      'name': createOrderController.createList!.data!.response!.name.toString(),
      'image':
          createOrderController.createList!.data!.response!.image.toString(),
      'order_id': createOrderController.createList!.data!.response!.orderId
          .toString(), // Generate order_id using Orders API

      'timeout': 300, // in seconds
      'prefill': {
        'contact': createOrderController
            .createList!.data!.response!.prefill!.contact
            .toString(),
        'email': createOrderController
            .createList!.data!.response!.prefill!.email
            .toString()
      },
      'notes': {
        'address': createOrderController
            .createList!.data!.response!.notes!.address
            .toString(),
        'orderId': createOrderController
            .createList!.data!.response!.notes!.orderId
            .toString(),
        'consumerId': createOrderController
            .createList!.data!.response!.notes!.consumerId
            .toString()
      },
      'theme': {
        'color': createOrderController.createList!.data!.response!.theme!.color
            .toString()
      },
    };
    _razorpay.open(options);
  }

  showDate() async {
    DateTime initialDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    DateTime? pickedDate = await showDatePicker(
        currentDate: DateTime.now(),
        context: context,
        // initialDate: DateTime.now(),
        initialDate: initialDate,
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(
            DateTime.now().year + 1, DateTime.now().month, DateTime.now().day),
        builder: (context, Widget? child) {
          return Theme(
              data: ThemeData(
                  primarySwatch: Colors.green,
                  backgroundColor: Colors.red,
                  accentColor: Colors.white,
                  primaryColor: Colors.red),
              child: child!);
        });

    if (pickedDate != null) {
      // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
      deliveryDisplayDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      var isoFormatted =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(pickedDate);
      // print( formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement
      // print("iso format");
      // print(isoFormatted);
      //   print(pickedDate.microsecondsSinceEpoch);
      deliveryDate = formattedDate.toString();
      String formatted = DateFormat('dd/MM/yyyy').format(pickedDate).toString();

      pickUpDate = DateFormat('yyyy-MM-dd').format(pickedDate).toString();

      bookingIsoDate = isoFormatted;
    ////  DateTime newDateTimeObj2 = DateFormat("dd/MM/yyyy HH:mm:ss").parse("18/11/2022 19:30:00");
      // print(newDateTimeObj2);
      // print(newDateTimeObj2.microsecondsSinceEpoch);
      // print(formatted);
      // print(dunsoTime.toString());
      String t = "${dunsoTime.toString()}:00";

      DateTime sendDate =
          DateFormat("dd/MM/yyyy HH:mm:ss").parse("$formatted $t");
      print(sendDate);
      print(sendDate.microsecondsSinceEpoch);
      dunsoSheduleTime =
          sendDate.millisecondsSinceEpoch.toString().substring(0, 10);
      print(dunsoSheduleTime);
      //   setState(() {

    } else {
      print("Date is not selected");
    }
  }

  showAddNoteDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Available Coupons',
                style: FoodigyTextStyle.homeHeadLine,
              ),
              //scrollable: true,
              content: SizedBox(
                  child: SizedBox(
                width: double.maxFinite,
              height: MediaQuery.of(context).size.height/2.5,
                child: Obx(() {
                  if (couponController.isDataLoading.value == true) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: firstColor,
                      ),
                    );
                  } else if (couponController.couponModel == null) {
                    return Center(
                      child: Text(
                        "No Coupons Avaialble",
                        style: FoodigyTextStyle.aboutChefStyle,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount:
                            couponController.couponModel!.data!.isNotEmpty
                                ? couponController.couponModel!.data!.length
                                : 0,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    double roundDouble(
                                        double value, int places) {
                                      num mod = pow(10.0, places);
                                      return ((value * mod).round().toDouble() /
                                          mod);
                                    }

                                    isCoupon = true;
                                    couponId = couponController
                                        .couponModel!.data![index].couponId
                                        .toString();
                                    couponCode = couponController
                                        .couponModel!.data![index].couponCode
                                        .toString();

                                    double discountedValue =
                                        (int.parse(totalValue.toString()) *
                                                int.parse(couponController
                                                    .couponModel!
                                                    .data![index]
                                                    .couponValue
                                                    .toString())) /
                                            100;
                                    discountValue = totalValue.toDouble() -
                                        discountedValue.toDouble();
                                    afterDiscountValue =
                                        discountedValue.toInt();
                                    // totalValue = discountValue.toInt();
                                    print(discountedValue.toString());
                                    totalAmountWithTaxCoupon =
                                        discountValue.toString();
                                    double percentag = (2.5 / 100) *
                                        double.parse(totalAmountWithTaxCoupon
                                            .toString());
                                    sgstCostCoupon = percentag.toString();
                                    cgstCostCoupon = percentag.toString();
                                    var totalTax = roundDouble(percentag, 2) +
                                        roundDouble(percentag, 2);
                                    int totalTax2 = discountValue.toInt();
                                    totalTaxCoupon = totalTax.toString();
                                    totalCostWithCouponTax =
                                        totalTax2 + totalTax.toInt();
                                    print('discount');
                                    print(totalCostWithCouponTax);
                                    // print(totalTax3);
                                    // print(totalCostWithCouponTax);
                                    // print(totalTax.roundToDouble());
                                    // print(totalTax2.round());
                                    // print(totalAmountWithTaxCoupon);
                                    // print(totalTaxCoupon);
                                    // print(percentag);
                                  });
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: couponId.toString() ==
                                                    couponController
                                                        .couponModel!
                                                        .data![index]
                                                        .couponId
                                                        .toString()
                                                ? Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: firstColor)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Container(
                                                        height: 5,
                                                        width: 5,
                                                        decoration: BoxDecoration(
                                                            color: firstColor,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color:
                                                                    firstColor)),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        //  color: Colors.grey.shade800,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: firstColor)),
                                                  ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  couponController.couponModel!
                                                      .data![index].couponCode
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  couponController
                                                      .couponModel!
                                                      .data![index]
                                                      .couponDescription
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w300),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
              )),

              actions: [
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      border: Border.all(color: firstColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    child: Text(
                      "Apply",
                      style: TextStyle(
                          color: firstColor,
                          fontFamily: 'Poppins',
                          fontSize: 14),
                    ),
                    onPressed: () {
                      //     totalCostWithCouponTax=int.parse(totalAmountWithTaxCoupon)+int.parse(totalTaxCoupon);
                      print(totalCostWithCouponTax);
                      Get.back();
                    },
                  ),
                )
              ],
            );
          });
        },
      );

  Future<dynamic> foodigyAddress(BuildContext context, String? profileId) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DeliveryAddressBottom(
          profileId: profileId,
        );
      },
    );
  }
}

class TextFieldCart extends StatelessWidget {
  const TextFieldCart({
    Key? key,
    required this.noteController,
  }) : super(key: key);

  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextField(
          controller: noteController,
          readOnly: false,
          autofocus: false,
          autocorrect: false,
          scribbleEnabled: false,
          decoration: InputDecoration(
              hintText: "Cooking Instructions (Optional)",
              hintStyle: FoodigyTextStyle.addressTextStyle),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class placeOrderButtondisable extends StatelessWidget {
  const placeOrderButtondisable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      width: MediaQuery.of(context).size.width / 3,
      child: TextButton(
        // ignore: sort_child_properties_last
        child: Text(
          "Place order",
          style: TextStyle(color: Colors.grey),
        ),
        style: TextButton.styleFrom(
            primary: Colors.purple,
            backgroundColor: Colors.grey.shade200,
            textStyle: const TextStyle(fontSize: 14, fontFamily: 'Poppins')),
        onPressed: () {},
      ),
    );
  }
}

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.red,
                )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                  child: SizedBox(
                      child: Row(children: const [
                    Text(
                      "Choose delivery type*",
                      style: FoodigyTextStyle.addTocartStyle,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      MdiIcons.chevronDown,
                      size: 18,
                    )
                  ])),
                ),
              ),
              Text(
                "Please select delivery type",
                style: FoodigyTextStyle.errorStyle,
              )
            ],
          ),
        ),
      ],
    );
  }
}
