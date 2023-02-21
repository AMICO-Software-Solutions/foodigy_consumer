// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/controller/cart_controller/get_cart_list_controller.dart';
import 'package:foodigy/model/local_model/filter_model.dart';
import 'package:foodigy/presentation/sign_in/login_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/custom_rating_bar_foodigy.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:foodigy/model/item_available_search_model.dart';

class ItemAvaliableViewScreen extends StatefulWidget {
    final List<Datum>? result;
  final int index;
  final String? pName,
      pDescription,
      pCurrency,
      pImage,
      invType,
      address,
      city,
      proTitle,
      proDes,
      proSlug,
      proCost,
      naturalPro,
      proTiming,
      proId;
  final int? userId, invenId;
  final String? menuTag, healthTag;
  final List? customization;
  final String? proAvgRat,
      proRatCoun,
      fssaiNo,
      prounit,
      proAvaiTime,
      orCutOffTime;

  const ItemAvaliableViewScreen({
    super.key,
    this.pName,
    this.pDescription,
    this.pCurrency,
    this.pImage,
    this.invType,
    this.address,
    this.city,
    this.proTitle,
    this.proDes,
    this.proSlug,
    this.proCost,
    this.naturalPro,
    this.proTiming,
    this.proId,
    this.menuTag,
    this.healthTag,
    this.customization,
    this.proAvgRat,
    this.proRatCoun,
    this.fssaiNo,
    this.prounit,
    this.proAvaiTime,
    this.orCutOffTime,
    this.userId,
    this.invenId, this.result, required this.index,
  });

  @override
  State<ItemAvaliableViewScreen> createState() =>
      _ItemAvaliableViewScreenState();
}

class _ItemAvaliableViewScreenState extends State<ItemAvaliableViewScreen> {
  GetCartDetailsController cartListController =
      Get.put(GetCartDetailsController());
  List customizeList = <Map<String, dynamic>>[];
  List selectedCustomizeList = <Map<String, dynamic>>[];
  List selectedCustomize = [];
  @override
  void initState() {
    cartListController.getCartDetails('');
    productTime = widget.proAvaiTime.toString();
    orderCutTime =
        widget.orCutOffTime.toString() == '' ? "" : widget.orCutOffTime;

    Timer(const Duration(seconds: 0), () {
      maaa();
    });
    Timer(const Duration(seconds: 0), () {
      orderCut();
    });
    Timer(const Duration(seconds: 0), () {
      for (var i = 0;
          i <=
             widget.result![widget.index].availableCustomization!
                  .custom!.length;
          i++) {
        customizeList.add({
          "id": widget.result![widget.index].availableCustomization!
              .custom![i].id
              .toString(),
          "name": widget.result![widget.index]
              .availableCustomization!.custom![i].name
              .toString()
        });
        // customizeList.add(CustomizeModelAlter(
        //   id: widget.chefDetails!.data![widget.index!]
        //         .availableCustomization!.custom![i].id.toString(),
        //     title: widget.chefDetails!.data![widget.index!]
        //         .availableCustomization!.custom![i].name
        //         .toString()));
        print(widget.result![widget.index].availableCustomization!
            .custom![i].name
            .toString());
        print("customize");
        print(customizeList[i]);
        print(customizeList.length);
      }
    });

    super.initState();
  }


  int _counter = 1;
  void removeProduct() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  bool isAddToCart = false;

  void addProduct() {
    setState(() {
      // if (currentUserId == '') {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (_) => LoginSCreen()));
      // } else {
      _counter++;
      //  }
    });
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

  String? productTime;
  String? pATIme = '';
  String? one = '';
  String? second = '';
  String? third = '';
  int? valu;

  //orderCutOf function
  String? orderCutTime = '';
  int? orderOne;
  String? orderTwo;
  String? orderThree;
  bool isOutofTime = false;

  void maaa() {
    setState(() {
      //   print(productTime);
      valu = int.parse(productTime
              .toString()
              .substring(0, productTime.toString().indexOf(':'))) +
          1;
          valu = valu == 13 ? 1 :valu;
      //  one = productTime.toString().substring(2, 5);
      one = productTime
          .toString()
          .substring(0, productTime.toString().indexOf(':'));
      second =
          productTime.toString().substring(productTime.toString().indexOf(':'));
      third = productTime
          .toString()
          .substring(productTime.toString().indexOf(':') + 1, 5);
      // print('hhhh');

      // print(valu.toString());
      // print(one);
      // print(second.toString());
      // print(third);

      DateTime date = DateTime.now();
      // Setting the DateTime to 2021-03-28, 1 AM
      //print(date.add(Duration(minutes: 60)));
      // DateTime dateTime = DateTime(
      //     date.year, date.month, date.day + 1, date.hour + 1, date.minute);
      DateTime curentTime =
          DateTime(date.year, date.month, date.day, date.hour, date.minute);
      // print(curentTime.day);
      var time = "${curentTime.day}, ${curentTime.hour}, ${curentTime.minute}";

      print(DateFormat.jm().format(DateFormat("hh:mm:ss").parse(
          "${curentTime.hour}:${curentTime.minute}:${curentTime.microsecond}")));
      // print('${valu.toString()}${second.toString()}');
      pATIme = "${valu.toString()}${second.toString()}";
    });
  }

  void orderCut() {
    //print(orderCutTime);
    orderThree = orderCutTime
        .toString()
        .substring(orderCutTime.toString().indexOf(' ') + 1);
    orderOne = int.parse(orderCutTime
        .toString()
        .substring(0, orderCutTime.toString().indexOf(':')));
    orderTwo = orderCutTime.toString().substring(
        orderCutTime.toString().indexOf(':') + 1,
        orderCutTime.toString().indexOf(':') + 3);

    if (orderThree == "PM") {
      //print('pm');

      DateTime startTime = DateTime(focused.year, focused.month, focused.day,
          orderOne! + 12, int.parse(orderTwo.toString()));
      //  print(startTime);
      getTime(startTime);
    } else {
      //    print('am');
      DateTime startTime = DateTime(focused.year, focused.month, focused.day,
          orderOne!, int.parse(orderTwo.toString()));
      //  print(startTime);
      getTime(startTime);
    }
  }

  getTime(time) {
    if (time.difference(DateTime.now()).isNegative) {
      print("falure");
      setState(() {
        isOutofTime = true;
      });
    } else {
      print("succcess");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                // height: double.infinity,
                height: MediaQuery.of(context).size.height / 1,
                child: Stack(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        print(widget.proSlug);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: NetworkImage(widget.proSlug.toString()),
                                fit: BoxFit.cover)),
                                child:  Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              widget.proAvgRat.toString() ==
                                    "null"
                                  ? Container()
                                  : frostedEdged(
                                      Container(
                                        height: 20,
                                        color: Colors.grey.withOpacity(0.5),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child:CustomRatingFav(productAverageRating: widget.proAvgRat.toString(),)
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "(${widget.proRatCoun} )",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 70,
                          )
                        ]),
                      ),
                    ),
                    DraggableScrollableSheet(
                      initialChildSize: .62,
                      minChildSize: .55,
                      maxChildSize: 1,
                      //   initialChildSize: 0.65,
                      // minChildSize: 0.60,
                      //maxChildSize: 1,
                      builder: (context, scrollController) {
                        return SafeArea(
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 800,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        color: Colors.transparent,
                                      ),
                                      Container(
                                        height: 800,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(40),
                                                topRight: Radius.circular(40))),
                                        child: SingleChildScrollView(
                                          // ignore: sort_child_properties_last
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  // ignore: avoid_unnecessary_containers
                                                  Container(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(
                                                          widget.proTitle
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Row(
                                                          children: [
                                                            RichText(
                                                              text: TextSpan(
                                                                text:
                                                                    '\u{20B9} ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: <
                                                                    TextSpan>[
                                                                  TextSpan(
                                                                      text: widget
                                                                          .proCost,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    widget.proDes.toString(),
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontFamily: 'Poppins',
                                                        color: Colors.grey),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                  SizedBox(
                                                    height: 25,
                                                    child: ListView.separated(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 20,
                                                            width: 50,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade200,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child: Text(
                                                                widget.healthTag
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return SizedBox(
                                                            width: 4,
                                                          );
                                                        },
                                                        itemCount: 1),
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  widget.orCutOffTime
                                                              .toString() ==
                                                          ""
                                                      ? Container()
                                                      : Row(
                                                          children: [
                                                            Icon(
                                                              MdiIcons
                                                                  .packageVariantClosed,
                                                              color: Colors.grey
                                                                  .shade300,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "Order before: ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12),
                                                            ),
                                                            Text(
                                                                '${widget.orCutOffTime}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                      Colors.red,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                ))
                                                          ],
                                                        ),
                                                  widget.proAvaiTime
                                                              .toString() ==
                                                          ""
                                                      ? Container()
                                                      : Row(
                                                          children: [
                                                            Icon(
                                                              MdiIcons
                                                                  .busSchool,
                                                              color: Colors.grey
                                                                  .shade300,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "Delivery Available from:",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Poppins',
                                                              ),
                                                            ),
                                                            pATIme == ""
                                                                ? Container()
                                                                : Text(
                                                                    '$pATIme',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color:
                                                                          firstColor,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                    ))
                                                          ],
                                                        ),

                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  widget.customization!.isEmpty
                                                      ? Container()
                                                      : Text(
                                                          "Personalize",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    //  color: Colors.grey,
                                                    height: 500,
                                                    child: ListView(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        children: [
                                                          // ListTile(
                                                          //   onTap: () =>onAllClicked(allChecked),
                                                          //   leading: Checkbox(
                                                          //     value: allChecked.value,
                                                          //     onChanged: (value) {},
                                                          //   ),
                                                          //   title: Text(allChecked.title),
                                                          // ),
                                                          // Divider(),
                                                        ...customizeList
                                                                    .map(
                                                                  (items) =>
                                                                      ListTile(
                                                                    // onTap:() =>customiseClicked(items) ,
                                                                    leading:
                                                                        SizedBox(
                                                                      child:
                                                                          Checkbox(
                                                                        // shape: RoundedRectangleBorder(
                                                                        //   borderRadius: BorderRadius.circular(15),
                                                                        // ),
                                                                        //  shape: OutlinedBorder(side: BorderSide.),
                                                                        splashRadius:
                                                                            0,
                                                                        activeColor:
                                                                            firstColor,
                                                                        // value: true,
                                                                        value: selectedCustomize .contains(items['name'].toString()),
                                                                        onChanged:
                                                                            (value) {
                                                                          
                                                                          //print(healthTags.contains(items));
                                                                          setState(
                                                                              () {
                                                                              // selectedCustomizeList.removeWhere((element) => element == items['name'].toString());
                                                                                print( items['name']);
                                                                                 // selectedCustomizeList.add(items);
                                                                                 
                                                                          
                                                                          print( selectedCustomizeList);
                                                                            // print(items);
                                                                            if (selectedCustomize.contains(items['name'].toString())) {
                                                                               selectedCustomize.removeWhere((element) => element == items['name'].toString());
                                                                              selectedCustomizeList.removeWhere((element) => element == items);
                                                                              // print(selectedCustomizeList.length);
                                                                            } else {
                                                                              selectedCustomize.add(items['name'].toString());
                                                                              selectedCustomizeList.add(items);
                                                                              

                                                                           //  print(selectedCuisineList);
                                                                            }
                                                                            print(selectedCustomizeList);
                                                                            print(selectedCustomize);
                                                                         //   customiseClicked(items);
                                                                           // cuisinesClicked(items);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    title: Text(
                                                                      items[
                                                                          'name'],
                                                                      style: FoodigyTextStyle
                                                                          .smallTextStyle,
                                                                    ),
                                                                  ),
                                                                )
                                                        ]),
                                                  ),
                                                  
                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          controller: scrollController,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 30,
                                right: MediaQuery.of(context).size.width / 2.5,
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: firstColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            removeProduct();
                                          },
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Text(
                                              '-',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Text(_counter.toString(),
                                            style:
                                                TextStyle(color: Colors.white)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            addProduct();
                                          },
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Text('+',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                MdiIcons.arrowLeft,
                                color: Colors.white,
                                size: 25,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: FutureBuilder(
            future: cartListController.getCartDetails(''),
            builder: (context, snapshot) {
              return SizedBox(
                child: cartListController.cartList == null
                    ? Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: BottomSheet(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            onClosing: () {},
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: firstColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '1 item',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Text(
                                                '\u{20B9}${widget.proCost.toString()}',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                print(currentUserId);
                                                setState(() {
                                                  if (currentUserId == '') {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                LoginSCreen()));
                                                  } else {
                                                    if (isOutofTime == true) {
                                                      Fluttertoast.showToast(
                                                          backgroundColor:
                                                              firstColor,
                                                          msg:
                                                              "This item's order time has exceeded.",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .BOTTOM,
                                                          timeInSecForIosWeb:
                                                              1);
                                                    } else {
                                                      GetCartDetailsController()
                                                          .createCart(
                                                              customize:   selectedCustomizeList,
                                                              id: int.parse(currentUserId.toString()),
                                                              itemCount: _counter.toString(),
                                                              //  id: int.parse('391'),
                                                              pName: widget.pName .toString(),
                                                              pSlug: widget .pImage.toString(),
                                                              providerId: widget.userId,
                                                              itemId: widget.proId,
                                                              pCost: widget .proCost,
                                                              iName: widget .proTitle,
                                                              currency: widget .pCurrency,
                                                              itemdec: widget.proDes,
                                                              iSlug: widget .proSlug,
                                                              pTiming: widget  .proTiming,
                                                              pAvaiTiming: widget  .proAvaiTime,
                                                              orderCutOfTime: widget
                                                                  .orCutOffTime
                                                                  .toString(),
                                                                  context:context
                                                                  
                                                                  );
                                                    }
                                                  }
                                                });
                                              },
                                              child: Row(
                                                children: const [
                                                  Text("Add to cart",
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'Poppins')),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    MdiIcons.arrowRight,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: BottomSheet(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            onClosing: () {},
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: firstColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '1 item',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Text(
                                                '\u{20B9}${widget.proCost.toString()}',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                print(cartListController
                                                    .cartList!.data!.cartId
                                                    .toString());
                                                print(widget.userId.toString());
                                                print(widget.proId.toString());
                                                setState(() {
                                                  if (currentUserId == '') {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                LoginSCreen()));
                                                  } else {
                                                    if (isOutofTime == true) {
                                                      Fluttertoast.showToast(
                                                          textColor:
                                                              Colors.black,
                                                          backgroundColor:
                                                              Colors.white,
                                                          msg:
                                                              "This item's order time has exceeded.",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .CENTER,
                                                          timeInSecForIosWeb:
                                                              1);
                                                    } else {
                                                      GetCartDetailsController()
                                                          .addCartItem(
                                                             context: context,
                                                              customize: selectedCustomizeList,
                                                              id: int.parse(currentUserId),
                                                              //  id: int.parse('391'),
                                                              providerId: int.parse( widget.userId.toString()),
                                                              itemId: int.parse(  widget.proId.toString()),
                                                              iName: widget.proTitle .toString(),
                                                              itemCount: _counter .toString(),
                                                              currency: widget .pCurrency  .toString(),
                                                              itemdec: widget.proDes
                                                                  .toString(),
                                                              iSlug: widget.proSlug
                                                                  .toString(),
                                                              pTiming: widget.proTiming
                                                                  .toString(),
                                                              proCost: int.parse(
                                                                  widget.proCost
                                                                      .toString()),
                                                              orderCutOfTime:
                                                                  widget.orCutOffTime.toString(),
                                                              pAvaiTiming: widget.proAvaiTime.toString(),
                                                              cartId: cartListController.cartList!.data!.cartId);
                                                    }
                                                  }
                                                });
                                              },
                                              child: Row(
                                                children: const [
                                                  Text("Add to Cart",
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'Poppins')),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    MdiIcons.arrowRight,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
              );
            }));
  }

  customiseClicked(CustomizeModel custModel) {
    setState(() {
      custModel.value = !custModel.value;
      print(custModel.title);
      if (selectedCustomizeList.contains(custModel.title.toString())) {
        selectedCustomizeList
            .removeWhere((element) => element == custModel.title.toString());
        // print(selectedCustomizeList.length);
      } else {
        selectedCustomizeList.add(custModel.title);

        // print(selectedCuisineList.length);
      }
      print(selectedCustomizeList);
    });
  }

  Widget frostedEdged(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
        child: child,
      ),
    );
  }
}
