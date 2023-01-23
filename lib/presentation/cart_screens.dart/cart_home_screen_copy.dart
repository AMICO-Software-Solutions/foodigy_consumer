// // ignore_for_file: avoid_print
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:foodigy/controller/address_controller/address_controller.dart';
// import 'package:foodigy/controller/cart_controller/cart_count_controller.dart';
// import 'package:foodigy/controller/cart_controller/cart_time_controller.dart';
// import 'package:foodigy/controller/cart_controller/get_cart_list_controller.dart';
// import 'package:foodigy/controller/chef_profile_controller.dart';
// import 'package:foodigy/controller/delivery_type_controller/dunzo_controller.dart';
// import 'package:foodigy/controller/delivery_type_controller/pick_drop_controller.dart';
// import 'package:foodigy/controller/order_controller/create_order_controller.dart';
// import 'package:foodigy/controller/user_contoller/current_user_profie_controller.dart';
// import 'package:foodigy/presentation/cart_screens.dart/cart_screen.dart';
// import 'package:foodigy/presentation/cart_screens.dart/get_cart_screen_details.dart';
// import 'package:foodigy/presentation/home_screens/home_screens/view_all_item_pagination_screen.dart';
// import 'package:foodigy/styles/foodigy_text_style.dart';
// import 'package:foodigy/utilities/const_color.dart';
// import 'package:foodigy/utilities/const_value.dart';
// import 'package:foodigy/utilities/foodigy_const_data.dart';
// import 'package:foodigy/widgets/delivery_bottom_sheet.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class CartHomeScreen extends StatefulWidget {
//   final String? uId;
//   const CartHomeScreen({
//     super.key,
//     this.uId,
//   });

//   @override
//   State<CartHomeScreen> createState() => _CartHomeScreenState();
// }

// String? selectPayType;
// //delivery charge variable
// bool isDeliveryCharge = false;

// class _CartHomeScreenState extends State<CartHomeScreen> {
//   GetAddressDetailsController addressListController =
//       Get.put(GetAddressDetailsController());
//   // CurrentUserAllDetailsController curent =
//   //     Get.put(CurrentUserAllDetailsController());
//   GetCartDetailsController cartListController =
//       Get.put(GetCartDetailsController());
//   CurrentUserProfileController registerController =
//       Get.put(CurrentUserProfileController());
//   GetDunzoController dunzoController = Get.put(GetDunzoController());
//   PickDropController pickDropController = Get.put(PickDropController());
//   ChefProfileController chefProfileController =
//       Get.put(ChefProfileController());
//   CreateOrderController createOrderController =
//       Get.put(CreateOrderController());
//   CartCountController cartCountCntroller = Get.put(CartCountController());
//   CartTimerController cartTimer = Get.put(CartTimerController());

//   late var _razorpay;

//   @override
//   void initState() {
//     selectPayType = null;
//     isDeliveryCharge = false;

//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
//         createOrderController.handlePaymentSuccess);
//     _razorpay.on(
//         Razorpay.EVENT_PAYMENT_ERROR, createOrderController.handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
//         createOrderController.handleExternalWallet);
//     //fo();

//     registerController.getProfile();
//     //addressListController.getAddressDetails();
//     cartListController.getCartDetails(widget.uId.toString());
//     addressListController.getAddressDetails();
//     getChefProfile();
//     Timer(const Duration(seconds: 0), () {
//       print("cart get maximum timing");
//       cartTimer.getMaxTiming();
//     });

//     Timer(const Duration(seconds: 1), () {
//       addCart();
//     });

//     super.initState();
//   }

//   TextEditingController noteController = TextEditingController();
//   final formkey = GlobalKey<FormState>();

//   var products = [];
//   DateTime? newDateTimeObj2;
//   //calendar date
//   String deliveryDate = DateFormat('MM-dd-yyyy').format(DateTime.now());
//   var bookingIsoDate =
//       DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(DateTime.now());

//   String? valueChoose;
//   List items = ["item1", "item2", "item3", "item4"];

//   var deliveryCharge = 0.toInt();
//   var discountValue = 0.toInt();

//   //selected date and time
//   String dunsoTime = '';
//   String dunsoSheduleTime = '';
//   String dunsoDate = '';
//   String pickUpTime = '';
//   String pickUpDate =
//       DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

//   Map<String, dynamic> cartList = {};
//   Future addCart() async {
//     products.clear();
//     // products = [
//     for (int i = 0;
//         i < cartListController.cartList!.data!.cartDetails!.length;
//         i++) {
//       cartList = {
//         "cartDetailsId": int.parse(cartListController
//             .cartList!.data!.cartDetails![i].cartDetailsId
//             .toString()),
//         "cartId": int.parse(cartListController
//             .cartList!.data!.cartDetails![i].cartId
//             .toString()),
//         "productId": int.parse(cartListController
//             .cartList!.data!.cartDetails![i].itemId
//             .toString()),
//         "productName": cartListController
//             .cartList!.data!.cartDetails![i].itemName
//             .toString(),
//         "productDescription": cartListController
//             .cartList!.data!.cartDetails![i].itemDesc
//             .toString(),
//         "productSlug": cartListController
//             .cartList!.data!.cartDetails![i].itemSlug
//             .toString(),
//         "quantity": int.parse(cartListController
//             .cartList!.data!.cartDetails![i].quantity
//             .toString()),
//         "status": true,
//         "cost": int.parse(cartListController
//             .cartList!.data!.cartDetails![i].itemCost
//             .toString()),
//         "tax": PriceDetails().taxvalueConst,
//         "total": int.parse(cartListController
//             .cartList!.data!.cartDetails![i].total
//             .toString()),
//         "couponDiscount": 1,
//         "currency": "INR"
//       };
//       products.add(cartList);
//       print(cartList);

//       // Product(i.toString(), quotationList[i][0], quotationList[i][1],
//       //     quotationList[i][2]),
//     }
//     // print("****************************");
//     // print(products);
//     // ];
//   }

//   void getChefProfile() {
//     Timer(const Duration(seconds: 3), () {
//       chefProfileController.getProfile(cartListController
//           .cartList!.data!.cartDetails![0].providerId
//           .toString());
//     });
//   }

//   @override
//   void dispose() {
//     _razorpay.clear();
//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         iconTheme: IconThemeData(
//           color: Colors.grey, //change your color here
//         ),
//         backgroundColor: Colors.white,
//         title: InkWell(
//           onTap: () {
//             //print(cartList);
//             print(pickUpTime);
//             //  addCart();
//             //print(products);
//           },
//           child: Text(
//             'Cart',
//             style: FoodigyTextStyle.homeHeadLine,
//           ),
//         ),
//         actions: const [
//           SizedBox(
//             width: 5,
//           ),
//         ],
//       ),
//       body: Form(
//         autovalidateMode: AutovalidateMode.always,
//         key: formkey,
//         child: SizedBox(
//           height: double.infinity,
//           width: double.infinity,
//           child: Obx(() {
//             if (cartListController.isDataLoading.value == true) {
//               return Center(
//                 child: CircularProgressIndicator(color: firstColor),
//               );
//             } else if (cartListController.cartList == null) {
//               return Center(
//                 child: TextButton(
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(firstColor)),
//                   onPressed: () {
//                     Get.to(ViewAllItemPaginationScreen());
//                   },
//                   child: Text(
//                     "Empty cart",
//                     style: FoodigyTextStyle.profileTitleStyle,
//                   ),
//                 ),
//               );
//             } else {
//               return FutureBuilder(
//                   future:
//                       cartListController.getCartDetails(widget.uId.toString()),
//                   builder: (context, snapshot) {
//                     double percentage =
//                         (2.5 / 100) * int.parse(totalValue.toString());
//                     var taxtotalCost = (percentage * 2);
//                     var totalTax = (percentage * 2) + deliveryCharge;
//                     var tTotalTx = totalTax.toInt();

//                     var totalAmountWithTax = totalTax.toInt() + totalValue;
//                     return SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Container(height: 30,
//                           width: double.infinity,
//                           color: Colors.cyanAccent.shade100.withOpacity(0.3),
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Text("Based on your items, delivery is available at ${cartTimer.allTimes[0]}", style: FoodigyTextStyle.aboutChefStyle,),
//                           ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 1.7,
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   GetCartScreenDetails(
//                                     uId: widget.uId,
//                                     cartData: cartListController.cartList,
//                                   ),
//                                   Column(
//                                     children: [
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                           width: double.infinity,
//                                           height: 80,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                               border: Border.all(
//                                                   color: Colors.grey.shade200)),
//                                           child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 5, right: 5),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     "Delivery date and time*",
//                                                     style: FoodigyTextStyle
//                                                         .addTocartStyle,
//                                                   ),
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Container(
//                                                         //  height: 50,
//                                                         width: 100,
//                                                         decoration: BoxDecoration(
//                                                             border: valueChoose ==
//                                                                     null
//                                                                 ? Border.all(
//                                                                     color: Colors
//                                                                         .red)
//                                                                 : null),
//                                                         child: DropdownButtonFormField(
//                                                             menuMaxHeight: 250.0,
//                                                             decoration: InputDecoration(
//                                                                 errorStyle: FoodigyTextStyle.errorStyle,
//                                                                 // errorBorder:
//                                                                 //     OutlineInputBorder(
//                                                                 //   borderSide: BorderSide(
//                                                                 //       color: Colors
//                                                                 //           .red,
//                                                                 //       width:
//                                                                 //           1.0),
//                                                                 // ),
//                                                                 border: InputBorder.none),
//                                                             //  isExpanded: true,
//                                                             // validator: (value) =>
//                                                             //     value == null
//                                                             //         ? 'Please fill out fields.'
//                                                             //         : null,
//                                                             value: valueChoose,
//                                                             hint: Text(
//                                                               "0:00",
//                                                               style: FoodigyTextStyle
//                                                                   .addTocartStyle,
//                                                             ),
//                                                             items: cartTimer.allTimes.map((valueItem) {
//                                                               return DropdownMenuItem<
//                                                                       String>(
//                                                                   // ignore: sort_child_properties_last
//                                                                   child: Text(
//                                                                     valueItem,
//                                                                     style: FoodigyTextStyle
//                                                                         .addTocartStyle,
//                                                                   ),
//                                                                   value:
//                                                                       valueItem);
//                                                             }).toList(),
//                                                             onChanged: (newValue) {
//                                                               //  setState(() {
//                                                               isDeliveryCharge =
//                                                                   false;
//                                                               valueChoose =
//                                                                   newValue
//                                                                       as String?;
//                                                               print(
//                                                                   'new value');

//                                                               pickUpTime =
//                                                                   newValue
//                                                                       .toString();
//                                                               print(pickUpTime);
//                                                               if (newValue
//                                                                   .toString()
//                                                                   .contains(
//                                                                       "am")) {
//                                                                 print(
//                                                                     "$newValue AM");
//                                                               } else {
//                                                                 int first = int.parse(newValue
//                                                                     .toString()
//                                                                     .substring(
//                                                                         0,
//                                                                         newValue
//                                                                             .toString()
//                                                                             .indexOf(':')));
//                                                                 String second = newValue
//                                                                     .toString()
//                                                                     .substring(
//                                                                         newValue.toString().indexOf(':') +
//                                                                             1,
//                                                                         newValue
//                                                                             .toString()
//                                                                             .indexOf(' '));
//                                                                 int data =
//                                                                     first + 12;
//                                                                 dunsoTime =
//                                                                     "$data:$second";

//                                                                 print(
//                                                                     "$data:$second ");
//                                                               }
//                                                               //   });
//                                                             }),
//                                                       ),
//                                                       valueChoose == null
//                                                           ? SizedBox(
//                                                               width: 100,
//                                                               child: Text(
//                                                                 "please select delivery time",
//                                                                 overflow:
//                                                                     TextOverflow
//                                                                         .ellipsis,
//                                                                 style: FoodigyTextStyle
//                                                                     .errorStyle,
//                                                               ))
//                                                           : Container()
//                                                     ],
//                                                   ),
//                                                   Container(
//                                                       child: deliveryDate ==
//                                                               null
//                                                           ? IconButton(
//                                                               onPressed:
//                                                                   () async {
//                                                                 showDate();
//                                                                 isDeliveryCharge =
//                                                                     false;
//                                                               },
//                                                               icon: Icon(
//                                                                 MdiIcons
//                                                                     .calendar,
//                                                                 color:
//                                                                     Colors.grey,
//                                                               ))
//                                                           : InkWell(
//                                                               onTap: () {
//                                                                 isDeliveryCharge =
//                                                                     false;
//                                                                 showDate();
//                                                               },
//                                                               child: Text(
//                                                                 deliveryDate
//                                                                     .toString(),
//                                                                 style: FoodigyTextStyle
//                                                                     .addTocartStyle,
//                                                               )))
//                                                 ],
//                                               )),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 15,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                         },
//                                         child: Container(
//                                           height: 50,
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width /
//                                               1,
//                                           color: Colors.yellow.shade100,
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 vertical: 5, horizontal: 15),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Icon(MdiIcons
//                                                         .ticketPercentOutline),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     Text(
//                                                       "Use Coupons",
//                                                       style: TextStyle(
//                                                           color: Colors
//                                                               .red.shade600,
//                                                           fontFamily: 'Poppins',
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w600),
//                                                     )
//                                                   ],
//                                                 ),
//                                                 IconButton(
//                                                     onPressed: () {},
//                                                     icon: Icon(
//                                                       MdiIcons.arrowRight,
//                                                       size: 16,
//                                                     ))
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       pickUpTime == ""
//                                           ? ErrorContainer()
//                                           : (selectPayType == null
//                                               ? InkWell(
//                                                   onTap: () {
//                                                     print('helo');
//                                                     addCart();
//                                                     isDeliveryCharge = true;
//                                                     //  print(pickUpDate);
//                                                     //print(pickUpTime);
//                                                     print('delivery date');
//                                                     print(deliveryDate);
//                                                     String t =
//                                                         "${dunsoTime.toString()}:00";
//                                                     DateTime sendDate = DateFormat(
//                                                             "MM-dd-yyyy HH:mm:ss")
//                                                         .parse(
//                                                             "$deliveryDate $t");
//                                                     print("dunxo");
//                                                     print(sendDate);
//                                                     print(sendDate
//                                                         .microsecondsSinceEpoch);
//                                                     dunsoSheduleTime = sendDate
//                                                         .millisecondsSinceEpoch
//                                                         .toString()
//                                                         .substring(0, 10);
//                                                     print(dunsoSheduleTime);

//                                                     dunzoController.getDunzo(
//                                                         cheflat:
//                                                             chefProfileController
//                                                                 .currentchefProfile!
//                                                                 .data!
//                                                                 .address![0]
//                                                                 .latitude
//                                                                 .toString(),
//                                                         chefLong:
//                                                             chefProfileController
//                                                                 .currentchefProfile!
//                                                                 .data!
//                                                                 .address![0]
//                                                                 .longitude
//                                                                 .toString(),
//                                                         cusLat: latFoodigy
//                                                             .toString(),
//                                                         cusLong: longFoodigy
//                                                             .toString(),
//                                                         sheduleTime:
//                                                             dunsoSheduleTime
//                                                                 .toString());
//                                                     pickDropController.getPickDrop(
//                                                         chefLat:
//                                                             chefProfileController
//                                                                 .currentchefProfile!
//                                                                 .data!
//                                                                 .address![0]
//                                                                 .latitude
//                                                                 .toString(),
//                                                         chefLong:
//                                                             chefProfileController
//                                                                 .currentchefProfile!
//                                                                 .data!
//                                                                 .address![0]
//                                                                 .longitude
//                                                                 .toString(),
//                                                         cusLat: latFoodigy
//                                                             .toString(),
//                                                         cusLong: longFoodigy
//                                                             .toString(),
//                                                         time: pickUpTime,
//                                                         date: pickUpDate);
//                                                   },
//                                                   child: ErrorContainer())
//                                               : Container(
//                                                   color: Colors.white,
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             left: 15,
//                                                             top: 15,
//                                                             bottom: 15),
//                                                     child: Row(
//                                                       children: [
//                                                         InkWell(
//                                                             // onTap: (){
//                                                             //   print("dunso ");
//                                                             //   print(dunsoSheduleTime);
//                                                             // },
//                                                             onTap: () {
//                                                               addCart();
//                                                               isDeliveryCharge =
//                                                                   !isDeliveryCharge;
//                                                               print(pickUpDate);
//                                                               print(pickUpTime);

//                                                               dunzoController.getDunzo(
//                                                                   cheflat: chefProfileController
//                                                                       .currentchefProfile!
//                                                                       .data!
//                                                                       .address![
//                                                                           0]
//                                                                       .latitude
//                                                                       .toString(),
//                                                                   chefLong: chefProfileController
//                                                                       .currentchefProfile!
//                                                                       .data!
//                                                                       .address![
//                                                                           0]
//                                                                       .longitude
//                                                                       .toString(),
//                                                                   cusLat: latFoodigy
//                                                                       .toString(),
//                                                                   cusLong:
//                                                                       longFoodigy
//                                                                           .toString(),
//                                                                   sheduleTime:
//                                                                       dunsoSheduleTime
//                                                                           .toString());
//                                                               pickDropController.getPickDrop(
//                                                                   chefLat: chefProfileController
//                                                                       .currentchefProfile!
//                                                                       .data!
//                                                                       .address![
//                                                                           0]
//                                                                       .latitude
//                                                                       .toString(),
//                                                                   chefLong: chefProfileController
//                                                                       .currentchefProfile!
//                                                                       .data!
//                                                                       .address![
//                                                                           0]
//                                                                       .longitude
//                                                                       .toString(),
//                                                                   cusLat: latFoodigy
//                                                                       .toString(),
//                                                                   cusLong:
//                                                                       longFoodigy
//                                                                           .toString(),
//                                                                   time:
//                                                                       pickUpTime,
//                                                                   date:
//                                                                       pickUpDate);
//                                                             },
//                                                             child: SizedBox(
//                                                                 child: Row(
//                                                               children: const [
//                                                                 Text(
//                                                                   "Choose delivery type*",
//                                                                   style: FoodigyTextStyle
//                                                                       .addTocartStyle,
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 10,
//                                                                 ),
//                                                                 Icon(
//                                                                   MdiIcons
//                                                                       .chevronDown,
//                                                                   size: 18,
//                                                                 )
//                                                               ],
//                                                             ))),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 )),
//                                       deliveryFunction(),
//                                       Container(
//                                         width: double.infinity,
//                                         color: Colors.grey.shade100,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(15.0),
//                                           child: Text(
//                                             "Bill Details",
//                                             style:
//                                                 FoodigyTextStyle.addTocartStyle,
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 400,
//                                         width: double.infinity,
//                                         color: Colors.white,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(15.0),
//                                           child: InkWell(
//                                             onTap: () {
//                                               print(totalValue);
//                                             },
//                                             child: SingleChildScrollView(
//                                               child: Column(children: [
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       "Total items in cart",
//                                                       style: FoodigyTextStyle
//                                                           .addTocartStyle,
//                                                     ),
//                                                     Text(
//                                                       '${cartListController.cartList!.data!.cartDetails!.length}',
//                                                       style: TextStyle(
//                                                           // fontFamily: 'Poppins',
//                                                           fontSize: 12,
//                                                           color: Colors.black,
//                                                           fontWeight:
//                                                               FontWeight.w400),
//                                                     )
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 cartMethod(
//                                                     title: "Items total amount",
//                                                     value:
//                                                         "${iRubee.toString()} ${double.parse(totalValue.toString()).toStringAsFixed(2)}"),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 cartMethod(
//                                                     title: "Discount",
//                                                     value:
//                                                         "\u{20B9} ${double.parse(discountValue.toString()).toStringAsFixed(2)}"),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 cartMethod(
//                                                     title: "Total before Tax",
//                                                     value:
//                                                         "${iRubee.toString()} ${double.parse(totalValue.toString()).toStringAsFixed(2)}"),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 cartMethod(
//                                                     title: "SGST @ 2.5%",
//                                                     value:
//                                                         "\u{20B9} ${double.parse(percentage.toString()).toStringAsFixed(2)}"),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 cartMethod(
//                                                     title: "CGST @ 2.5%",
//                                                     value:
//                                                         "\u{20B9} ${double.parse(percentage.toString()).toStringAsFixed(2)}"),
//                                                 // cartMethod(
//                                                 //     title: "CGST @ 2.5%",
//                                                 //     value:
//                                                 //         "\u{20B9} ${(2.5 / 100) * int.parse(totalValue.toString())}"),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 cartMethod(
//                                                     title: "Delivery charge",
//                                                     value:
//                                                         "\u{20B9} ${double.parse(deliveryCharge.toString()).toStringAsFixed(2)}"),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 cartMethod(
//                                                     title: "Total tax",
//                                                     value:
//                                                         "\u{20B9} ${double.parse(totalTax.toString()).toStringAsFixed(2)}"),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 cartMethod(
//                                                     isFAmount: true,
//                                                     title: "Total amount",
//                                                     value:
//                                                         "\u{20B9} ${double.parse(totalAmountWithTax.toString()).toStringAsFixed(2)}"),
//                                                 SizedBox(height: 10),
//                                                 Container(
//                                                   color: Colors.grey.shade200,
//                                                   height: 40,
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             3.0),
//                                                     child: TextFormField(
//                                                       controller:
//                                                           noteController,
//                                                       decoration: InputDecoration(
//                                                           hintText:
//                                                               "Write cooking instructions for chef",
//                                                           hintStyle:
//                                                               FoodigyTextStyle
//                                                                   .addressTextStyle),
//                                                     ),
//                                                   ),
//                                                 )
//                                               ]),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             // height: MediaQuery.of(context).size.height / 4.5,
//                             // height: 500,
//                             width: double.infinity,
//                             child: FutureBuilder(
//                                 future: cartListController
//                                     .getCartDetails(widget.uId.toString()),
//                                 builder: (context, snapshot) {
//                                   return Container(
//                                     color: Colors.white,
//                                     height: 150,
//                                     width: double.infinity,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(0.0),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Divider(
//                                             color: Colors.black,
//                                           ),
//                                       selectPayType == "Takeaway"? Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 15),
//                                             child: SizedBox(
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: const [
//                                                   Text(
//                                                     'Pickup Address ',
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 16,
//                                                         fontWeight:
//                                                             FontWeight.w500),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ):    Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 15),
//                                             child: SizedBox(
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: const [
//                                                   Text(
//                                                     'Delivery Address',
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 16,
//                                                         fontWeight:
//                                                             FontWeight.w500),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       vertical: 5,
//                                                       horizontal: 15),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.center,
//                                                 children: [
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.start,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       SizedBox(
//                                                         height: 5,
//                                                       ),
//                                                       SizedBox(
//                                                         height: 30,
//                                                         width: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .width /
//                                                             1.2,
//                                                         child: Wrap(
//                                                           children: [
//                                                             Text(
//                                                                 selectedAddress
//                                                                             .toString() ==
//                                                                         ""
//                                                                     ? add
//                                                                     : selectedAddress,
//                                                                 style: FoodigyTextStyle
//                                                                     .smallTextStyle),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 5,
//                                                       ),
//                                                       Text(
//                                                           'Delivery date : ${deliveryDate.toString()}',
//                                                           style: FoodigyTextStyle
//                                                               .smallTextStyle),
//                                                       GetBuilder<
//                                                               CartCountController>(
//                                                           init:
//                                                               CartCountController(),
//                                                           builder:
//                                                               (cartController) {
//                                                             // return registerController.pressedBool
//                                                             return InkWell(
//                                                               onTap: () {
//                                                                 print(cartController
//                                                                     .totValu
//                                                                     .toString());
//                                                               },
//                                                               child: Column(
//                                                                 children: [
//                                                                   Row(
//                                                                     children: const [
//                                                                       // SizedBox(
//                                                                       //     child: Text(
//                                                                       //   'Value ${cartController.totValu}',
//                                                                       //   style: const TextStyle(
//                                                                       //     fontSize: 12.0,
//                                                                       //     color: Colors.black,
//                                                                       //   ),
//                                                                       // )),
//                                                                     ],
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             );
//                                                           }),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 15),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 SizedBox(
//                                                     height: 38,
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width /
//                                                             3,
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .start,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Text(
//                                                           "${cartListController.cartList!.data!.cartDetails!.length} items in cart",
//                                                           style: TextStyle(
//                                                             color: Colors.grey,
//                                                             fontSize: 10,
//                                                             fontFamily:
//                                                                 'Poppins',
//                                                           ),
//                                                         ),
//                                                         Text(
//                                                           '\u{20B9} ${totalAmountWithTax.toString()}',
//                                                           style: TextStyle(
//                                                               color:
//                                                                   Colors.black,
//                                                               //  fontFamily: 'Poppins',
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold),
//                                                         ),
//                                                       ],
//                                                     )),
//                                                 selectPayType == null
//                                                     ? placeOrderButtondisable()
//                                                     : Obx(
//                                                       () {
//                                                         if(createOrderController.isDataLoading.isTrue){
//                                                           return  placeOrderButtondisable();
//                                                         }else{
//                                                           return SizedBox(
//                                                             height: 38,
//                                                             width: MediaQuery.of(
//                                                                         context)
//                                                                     .size
//                                                                     .width /
//                                                                 3,
//                                                             child: TextButton(
//                                                               // ignore: sort_child_properties_last
//                                                               child: Text(
//                                                                 "Place order",
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .white),
//                                                               ),
//                                                               style: TextButton.styleFrom(
//                                                                   primary: Colors
//                                                                       .purple,
//                                                                   backgroundColor:
//                                                                       firstColor,
//                                                                   textStyle:
//                                                                       const TextStyle(
//                                                                           fontSize:
//                                                                               14,
//                                                                           fontFamily:
//                                                                               'Poppins')),
//                                                               onPressed: () {
//                                                                 //   print(int.parse(sgst))
//                                                                 print(tTotalTx
//                                                                     .toString());
//                                                                 print(
//                                                                     totalAmountWithTax
//                                                                         .toString());
//                                                                 print(taxtotalCost);
//                                                                 // print(totalTax .toString());
//                                                                 createOrderController
//                                                                     .createOrder(
//                                                                         cart:
//                                                                             products,
//                                                                         deliveryCharge:
//                                                                             deliveryCharge
//                                                                                 .toString(),
                                                    
//                                                                         //    cart:  cartCountCntroller.products,
//                                                                         deliveryMode: selectPayType
//                                                                             .toString()
//                                                                             .toUpperCase(),
//                                                                         currentProfile:
//                                                                             registerController
//                                                                                 .currentProfile,
//                                                                         cartData:
//                                                                             cartListController
//                                                                                 .cartList,
//                                                                         address: selectedAddress.toString() == ""
//                                                                             ? add
//                                                                             : selectedAddress,
//                                                                         bookingDate:
//                                                                             bookingIsoDate
//                                                                                 .toString(),
//                                                                         totalCost:
//                                                                             totalAmountWithTax
//                                                                                 .toString(),
//                                                                         taxTotalCost:
//                                                                             taxtotalCost
//                                                                                 .toString(),
//                                                                         // taxTotalCost:
//                                                                         //     totalTax
//                                                                         //         .toString(),
//                                                                         productTotalCost:
//                                                                             totalValue
//                                                                                 .toString(),
//                                                                         sgstCost:
//                                                                             percentage
//                                                                                 .toString(),
//                                                                         cgstCost:
//                                                                             percentage
//                                                                                 .toString(),
//                                                                         notes:
//                                                                             noteController
//                                                                                 .text)
//                                                                     .whenComplete(() =>
//                                                                         razorPay());
//                                                               },
//                                                             ),
//                                                           );
//                                                         }
//                                                       }
//                                                     )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                           ),
//                         ],
//                       ),
//                     );
//                   });
//             }
//           }),
//         ),
//       ),
//     );
//   }

//   SizedBox deliveryFunction() {
//     return SizedBox(
//       child: isDeliveryCharge == true
//           ? Container(
//               // height: 160,
//               width: double.infinity,
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Column(
//                   children: [
//                     Obx(() {
//                       if (dunzoController.isDataLoading.isTrue) {
//                         return Center(child: Container());
//                       } else if (dunzoController.dunzoList == null) {
//                         return InkWell(
//                           onTap: () {},
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         height: 15,
//                                         width: 15,
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             border: Border.all(
//                                                 color: Colors.black)),
//                                         child: selectPayType == "Dunzo"
//                                             ? Icon(
//                                                 MdiIcons.circle,
//                                                 color: Colors.grey.shade500,
//                                                 size: 10,
//                                               )
//                                             : Container(),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         "Dunzo service charge",
//                                         style: FoodigyTextStyle
//                                             .addTocartDisableStyle,
//                                       ),
//                                       // SizedBox(width: 5,),
//                                       //   Text(
//                                       //   "service charge",
//                                       //   style: FoodigyTextStyle
//                                       //       .addTocartDisableStyle,
//                                       // ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Container(
//                                         alignment: Alignment.centerRight,
//                                         width: 70,
//                                         child: Text(
//                                           " ",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ]),
//                           ),
//                         );
//                       } else {
//                         return InkWell(
//                           onTap: () {
//                             //      setState(() {
//                             selectPayType = "Dunzo";
//                             deliveryCharge = int.parse(dunzoController
//                                 .dunzoList!
//                                 .estimatedPriceBreakup!
//                                 .deliveryCharge
//                                 .toString());
//                             print(deliveryCharge);
//                             //     });
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         height: 15,
//                                         width: 15,
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             border: Border.all(
//                                                 color: Colors.black)),
//                                         child: selectPayType == "Dunzo"
//                                             ? Icon(
//                                                 MdiIcons.circle,
//                                                 color: Colors.grey.shade500,
//                                                 size: 10,
//                                               )
//                                             : Container(),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         "Dunzo service charge",
//                                         style: FoodigyTextStyle.addTocartStyle,
//                                       ),
//                                       // SizedBox(width: 5,),
//                                       // Text(
//                                       //   "service charge",
//                                       //   style: FoodigyTextStyle.addTocartStyle,
//                                       // ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Container(
//                                         alignment: Alignment.centerRight,
//                                         width: 70,
//                                         child: Text(
//                                           "$iRubee ${double.parse(dunzoController.dunzoList!.estimatedPriceBreakup!.deliveryCharge.toString()).toStringAsFixed(2)}",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ]),
//                           ),
//                         );
//                       }
//                     }),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Obx(() {
//                       if (pickDropController.isDataLoading.isTrue) {
//                         return Center(
//                           child: Container(),
//                         );
//                       } else if (pickDropController.pickDropList != null) {
//                         return InkWell(
//                           onTap: () {
//                             // setState(() {

//                             selectPayType = "pickDrop";
//                             deliveryCharge = int.parse(pickDropController
//                                 .pickDropList!.deliveryCharge
//                                 .toString());
//                             //  });
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         height: 15,
//                                         width: 15,
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             border: Border.all(
//                                                 color: Colors.black)),
//                                         child: selectPayType == "pickDrop"
//                                             ? Icon(
//                                                 MdiIcons.circle,
//                                                 color: Colors.grey.shade500,
//                                                 size: 10,
//                                               )
//                                             : Container(),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         "pickDrop service charge",
//                                         style: FoodigyTextStyle.addTocartStyle,
//                                       ),
//                                       // SizedBox(width: 5,),
//                                       // Text(
//                                       //   "service charge",
//                                       //   style: FoodigyTextStyle.addTocartStyle,
//                                       // ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Container(
//                                         alignment: Alignment.centerRight,
//                                         width: 70,
//                                         child: Text(
//                                           "$iRubee ${double.parse(pickDropController.pickDropList!.deliveryCharge.toString()).toStringAsFixed(2)}",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ]),
//                           ),
//                         );
//                       } else {
//                         return Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Container(
//                                       height: 15,
//                                       width: 15,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           border:
//                                               Border.all(color: Colors.black)),
//                                       child: selectPayType == "pickDrop"
//                                           ? Icon(
//                                               MdiIcons.circle,
//                                               color: Colors.grey.shade500,
//                                               size: 10,
//                                             )
//                                           : Container(),
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text(
//                                       "PickDrop service charge",
//                                       style: FoodigyTextStyle
//                                           .addTocartDisableStyle,
//                                     ),
//                                     // SizedBox(width: 5,),
//                                     // Text(
//                                     //   "service charge",
//                                     //   style: FoodigyTextStyle.addTocartDisableStyle,
//                                     // ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     Container(
//                                       alignment: Alignment.centerRight,
//                                       width: 70,
//                                       child: Text(
//                                         "",
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ]),
//                         );
//                       }
//                     }),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         deliveryCharge = 0;
//                         //  setState(() {
//                         selectPayType = "Takeaway";
//                         //    });
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     height: 15,
//                                     width: 15,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         border:
//                                             Border.all(color: Colors.black)),
//                                     child: selectPayType == "Takeaway"
//                                         ? Icon(
//                                             MdiIcons.circle,
//                                             color: Colors.grey.shade500,
//                                             size: 10,
//                                           )
//                                         : Container(),
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     "Takeaway",
//                                     style: FoodigyTextStyle.addTocartStyle,
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Container(
//                                     alignment: Alignment.centerRight,
//                                     width: 70,
//                                     child: Text(
//                                       "$iRubee 0.00",
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ]),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           : Container(),
//     );
//   }

//   Row cartMethod({String? title, String? value, bool? isFAmount = false}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title.toString(),
//           style: FoodigyTextStyle.addTocartStyle,
//         ),
//         isFAmount == true
//             ? Padding(
//                 padding: const EdgeInsets.all(0.0),
//                 child: Text(
//                   value.toString(),
//                   style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 ),
//               )
//             : Text(
//                 value.toString(),
//                 style: TextStyle(
//                     // fontFamily: 'Poppins',
//                     fontSize: 12,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400),
//               )
//       ],
//     );
//   }

//   void razorPay() {
//     // //Make payment
//     var options = {
//       'key': createOrderController.createList!.data!.response!.key.toString(),
//       'amount':
//           createOrderController.createList!.data!.response!.amount.toString(),
//       'currency': createOrderController.createList!.data!.response!.currency
//           .toString(), //in the smallest currency sub-unit.
//       'name': createOrderController.createList!.data!.response!.name.toString(),
//       'image':
//           createOrderController.createList!.data!.response!.image.toString(),
//       'order_id': createOrderController.createList!.data!.response!.orderId
//           .toString(), // Generate order_id using Orders API

//       'timeout': 300, // in seconds
//       'prefill': {
//         'contact': createOrderController
//             .createList!.data!.response!.prefill!.contact
//             .toString(),
//         'email': createOrderController
//             .createList!.data!.response!.prefill!.email
//             .toString()
//       },
//       'notes': {
//         'address': createOrderController
//             .createList!.data!.response!.notes!.address
//             .toString(),
//         'orderId': createOrderController
//             .createList!.data!.response!.notes!.orderId
//             .toString(),
//         'consumerId': createOrderController
//             .createList!.data!.response!.notes!.consumerId
//             .toString()
//       },
//       'theme': {
//         'color': createOrderController.createList!.data!.response!.theme!.color
//             .toString()
//       },
//     };
//     _razorpay.open(options);
//   }

//   showDate() async {
//     DateTime initialDate =
//         DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

//     DateTime? pickedDate = await showDatePicker(
//         currentDate: DateTime.now(),
//         context: context,
//         // initialDate: DateTime.now(),
//         initialDate: initialDate,
//         firstDate: DateTime(
//             DateTime.now().year, DateTime.now().month, DateTime.now().day),
//         lastDate: DateTime(
//             DateTime.now().year + 1, DateTime.now().month, DateTime.now().day),
//         builder: (context, Widget? child) {
//           return Theme(
//               data: ThemeData(
//                   primarySwatch: Colors.green,
//                   backgroundColor: Colors.red,
//                   accentColor: Colors.white,
//                   primaryColor: Colors.red),
//               child: child!);
//         });

//     if (pickedDate != null) {
//       // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//       String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
//       var isoFormatted =
//           DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(pickedDate);
//       // print( formattedDate); //formatted date output using intl package =>  2021-03-16
//       //you can implement different kind of Date Format here according to your requirement
//       // print("iso format");
//       // print(isoFormatted);
//       //   print(pickedDate.microsecondsSinceEpoch);
//       deliveryDate = formattedDate.toString();
//       String formatted = DateFormat('dd/MM/yyyy').format(pickedDate).toString();
//       pickUpDate = DateFormat('yyyy-MM-dd').format(pickedDate).toString();

//       bookingIsoDate = isoFormatted;
//       DateTime newDateTimeObj2 =
//           DateFormat("dd/MM/yyyy HH:mm:ss").parse("18/11/2022 19:30:00");
//       // print(newDateTimeObj2);
//       // print(newDateTimeObj2.microsecondsSinceEpoch);
//       // print(formatted);
//       // print(dunsoTime.toString());
//       String t = "${dunsoTime.toString()}:00";

//       DateTime sendDate =
//           DateFormat("dd/MM/yyyy HH:mm:ss").parse("$formatted $t");
//       print(sendDate);
//       print(sendDate.microsecondsSinceEpoch);
//       dunsoSheduleTime =
//           sendDate.millisecondsSinceEpoch.toString().substring(0, 10);
//       print(dunsoSheduleTime);
//       //   setState(() {

//     } else {
//       print("Date is not selected");
//     }
//   }

//   Future<dynamic> foodigyAddress(BuildContext context, String? profileId) {
//     return showModalBottomSheet(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30.0),
//           topRight: Radius.circular(30.0),
//         ),
//       ),
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return DeliveryAddressBottom(
//           profileId: profileId,
//         );
//       },
//     );
//   }
// }

// class placeOrderButtondisable extends StatelessWidget {
//   const placeOrderButtondisable({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 38,
//         width: MediaQuery.of(
//                     context)
//                 .size
//                 .width /
//             3,
//         child: TextButton(
//           // ignore: sort_child_properties_last
//           child: Text(
//             "Place order",
//             style: TextStyle(
//                 color: Colors
//                     .grey),
//           ),
//           style: TextButton.styleFrom(
//               primary: Colors
//                   .purple,
//               backgroundColor:
//                   Colors.grey
//                       .shade200,
//               textStyle:
//                   const TextStyle(
//                       fontSize:
//                           14,
//                       fontFamily:
//                           'Poppins')),
//           onPressed: () {
//             // final form = formkey
//             //     .currentState;
//             // if (form!
//             //     .validate()) {
//             //   form.save();
//             // }
//           },
//         ),
//       );
//   }
// }

// class ErrorContainer extends StatelessWidget {
//   const ErrorContainer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                   color: Colors.red,
//                 )),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
//                   child: SizedBox(
//                       child: Row(children: const [
//                     Text(
//                       "Choose delivery type*",
//                       style: FoodigyTextStyle.addTocartStyle,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Icon(
//                       MdiIcons.chevronDown,
//                       size: 18,
//                     )
//                   ])),
//                 ),
//               ),
//               Text(
//                 "Please select delivery type",
//                 style: FoodigyTextStyle.errorStyle,
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

