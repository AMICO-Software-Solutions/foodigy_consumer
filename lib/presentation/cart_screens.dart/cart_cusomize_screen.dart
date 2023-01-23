// ignore_for_file: avoid_print

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/cart_controller/get_cart_list_controller.dart';
import 'package:foodigy/model/cart_details_model.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CartCustomizeScreen extends StatefulWidget {
  final CartDetailsModel? cartData;
  final int index;


  const CartCustomizeScreen({
    super.key, this.cartData, required this.index,
    
  });

  @override
  State<CartCustomizeScreen> createState() =>
      _CartCustomizeScreenState();
}

class _CartCustomizeScreenState extends State<CartCustomizeScreen> {
  GetCartDetailsController cartListController =
      Get.put(GetCartDetailsController());

  @override
  void initState() {
    cartListController.getCartDetails('');
    print('customize');
    print(widget.cartData!.data!.cartDetails![widget.index].customization);
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
                    //  print(widget.proSlug);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(widget.cartData!.data!.cartDetails![widget.index].itemSlug.toString()),
                              fit: BoxFit.cover)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:const [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     widget.chefDetails!.data![widget.index!]
                            //                 .productAverageRating ==
                            //             null
                            //         ? Container()
                            //         : frostedEdged(
                            //             Container(
                            //               height: 20,
                            //               color: Colors.grey.withOpacity(0.5),
                            //               child: Row(
                            //                 children: [
                            //                   Padding(
                            //                     padding:
                            //                         const EdgeInsets.all(2.0),
                            //                     child: RatingBarIndicator(
                            //                       rating: double.parse(widget
                            //                           .chefDetails!
                            //                           .data![widget.index!]
                            //                           .productAverageRating
                            //                           .toString()),
                            //                       itemBuilder: (context, index) =>
                            //                           Icon(
                            //                         _selectedIcon ?? Icons.star,
                            //                         color: Colors.amber,
                            //                       ),
                            //                       itemCount: 5,
                            //                       itemSize: 20.0,
                            //                       unratedColor:
                            //                           Colors.amber.withAlpha(50),
                            //                       direction: Axis.horizontal,
                            //                     ),
                            //                   ),
                            //                   SizedBox(
                            //                     width: 10,
                            //                   ),
                            //                   Text(
                            //                     "(${widget.chefDetails!.data![widget.index!].productRatingCount} )",
                            //                     style: TextStyle(
                            //                         color: Colors.white,
                            //                         fontFamily: 'Poppins',
                            //                         fontSize: 12),
                            //                   )
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //     SizedBox(
                            //       width: 15,
                            //     )
                            //   ],
                            // ),
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
                                                        widget.cartData!.data!.cartDetails![widget.index].itemName
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
                                                              text: '\u{20B9} ${widget.cartData!.data!.cartDetails![widget.index].itemCost} ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              // ignore: prefer_const_literals_to_create_immutables
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text: '',
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
                                                  widget.cartData!.data!.cartDetails![widget.index].itemDesc.toString(),
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: 'Poppins',
                                                      color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),

                                               
                                            //  widget.cartData!.data!.cartDetails![widget.index].orderCutOffTime==null?Container():   Row(
                                            //       children: [
                                            //         Icon(
                                            //           MdiIcons
                                            //               .packageVariantClosed,
                                            //           color:
                                            //               Colors.grey.shade300,
                                            //         ),
                                            //         SizedBox(
                                            //           width: 10,
                                            //         ),
                                            //         Text(
                                            //           "Order before: ",
                                            //           style: TextStyle(
                                            //               color: Colors.grey,
                                            //               fontFamily: 'Poppins',
                                            //               fontSize: 12),
                                            //         ),
                                            //         Text(
                                            //             widget.cartData!.data!.cartDetails![widget.index].orderCutOffTime,
                                            //             style: TextStyle(
                                            //               fontSize: 14,
                                            //               color: Colors.red,
                                            //               fontFamily: 'Poppins',
                                            //             ))
                                            //       ],
                                            //     ),
                                               widget.cartData!.data!.cartDetails![widget.index].productAvailableTime==null?Container(): Row(
                                                  children: [
                                                    Icon(
                                                      MdiIcons.busSchool,
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Delivery Available from: ",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                    Text(
                                                        widget.cartData!.data!.cartDetails![widget.index].productAvailableTime.toString(),
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: firstColor,
                                                          fontFamily: 'Poppins',
                                                        ))
                                                  ],
                                                ),

                                                SizedBox(
                                                  height: 20,
                                                ),
                                              //  Text(widget.cartData!.data!.cartDetails![widget.index].providerId.toString()),
                                             widget.cartData!.data!.cartDetails![widget.index].customization==null ? Container():  Text(
                                                  "Personalized",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: SizedBox(
                                                  height: 300,
                                                   child: ListView.separated(
                                                    separatorBuilder: (context, index) {
                                                      return SizedBox(height: 2,);
                                                      
                                                    },
                                                      itemCount: widget.cartData!.data!.cartDetails![widget.index].customization!.customization!.custom!.isEmpty? 0:widget.cartData!.data!.cartDetails![widget.index].customization!.customization!.custom!.length,
                                                      itemBuilder:(context, index){
                                                        return Text(widget.cartData!.data!.cartDetails![widget.index].customization!.customization!.custom![index].name.toString(), style: FoodigyTextStyle.aboutChefStyle,);
                                                      } ),
                                                 ),
                                               ),

                                                
                                                SizedBox(
                                                  height: 10,
                                                ),

                                            
                                                // Text(
                                                //   'Dish Availability',
                                                //   style: TextStyle(
                                                //     color: Colors.black,
                                                //     fontFamily: 'Poppins',
                                                //   ),
                                                // ),
                                                // SizedBox(
                                                //   height: 10,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     Icon(
                                                //       MdiIcons
                                                //           .packageVariantClosed,
                                                //       size: 13,
                                                //       color:
                                                //           Colors.grey.shade400,
                                                //     ),
                                                //     SizedBox(
                                                //       width: 10,
                                                //     ),
                                                //     Text(
                                                //       '20/08/2022 Fri, 02:00 PM',
                                                //       style: TextStyle(
                                                //           color: Colors
                                                //               .grey.shade400,
                                                //           fontFamily: 'Poppins',
                                                //           fontSize: 12),
                                                //     ),
                                                //   ],
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     Icon(
                                                //       MdiIcons
                                                //           .packageVariantClosed,
                                                //       size: 13,
                                                //       color:
                                                //           Colors.grey.shade400,
                                                //     ),
                                                //     SizedBox(
                                                //       width: 10,
                                                //     ),
                                                //     Text(
                                                //       '20/08/2022 Fri, 02:00 PM',
                                                //       style: TextStyle(
                                                //           color: Colors
                                                //               .grey.shade400,
                                                //           fontFamily: 'Poppins',
                                                //           fontSize: 12),
                                                //     ),
                                                //   ],
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     Icon(
                                                //       MdiIcons
                                                //           .packageVariantClosed,
                                                //       color:
                                                //           Colors.grey.shade400,
                                                //       size: 13,
                                                //     ),
                                                //     SizedBox(
                                                //       width: 10,
                                                //     ),
                                                //     Text(
                                                //       '20/08/2022 Fri, 02:00 PM',
                                                //       style: TextStyle(
                                                //           color: Colors
                                                //               .grey.shade400,
                                                //           fontFamily: 'Poppins',
                                                //           fontSize: 12),
                                                //     ),
                                                //   ],
                                                // )
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
    
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: isAddToCart == false
      //     ? FloatingActionButton(
      //         elevation: 0.0,
      //         child: Icon(Icons.add),
      //         backgroundColor: firstColor,
      //         onPressed: () {
      //           setState(() {
      //             isAddToCart = true;
      //             print('current user is ${widget.uId.toString()}}');
      //           });
      //         })
      //     : null,
    );
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
