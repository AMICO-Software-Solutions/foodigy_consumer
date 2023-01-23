// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/cart_controller/cart_count_controller.dart';
import 'package:foodigy/controller/cart_controller/get_cart_list_controller.dart';
import 'package:foodigy/model/cart_details_model.dart';
import 'package:foodigy/presentation/cart_screens.dart/cart_cusomize_screen.dart';
import 'package:foodigy/presentation/cart_screens.dart/cart_filter_bottom_sheet.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

int totalValue = 0;
int totalWithTax = 0;

class CartBuildData extends StatefulWidget {
  final CartDetailsModel? cartData;
  final int index;
  const CartBuildData({super.key, this.cartData, required this.index});

  @override
  State<CartBuildData> createState() => _CartBuildDataState();
}

class _CartBuildDataState extends State<CartBuildData> {
  CartCountController cartCOntroller = Get.put(CartCountController());

  int _counter = 1;
  @override
  void initState() {
    // updateItemTimingList();
    _counter = int.parse(
        widget.cartData!.data!.cartDetails![widget.index].quantity.toString());
    //cartCOntroller.addCart(widget.cartData);

    super.initState();
  }

  void updateItemTimingList() {
    var timeIndex = int.parse(widget
        .cartData!.data!.cartDetails![widget.index].productAvailableTime
        .toString()
        .substring(widget
            .cartData!.data!.cartDetails![widget.index].productAvailableTime
            .toString()
            .indexOf(':')));
    print('Sub string time');
    print(timeIndex);
  }

  @override
  Widget build(BuildContext context) {
    int value = _counter *
        int.parse(widget.cartData!.data!.cartDetails![widget.index].itemCost
            .toString());
    totalValue = value + totalValue;
    // cartCOntroller.totValu.value = value + totalValue;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        height: 73,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 10,
                  width: MediaQuery.of(context).size.width / 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade200,
                      image: DecorationImage(
                          image: NetworkImage(widget.cartData!.data!
                              .cartDetails![widget.index].itemSlug
                              .toString()),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  // width: MediaQuery.of(context).size.width/1.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.cartData!.data!
                                      .cartDetails![widget.index].itemName
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text(
                                    widget.cartData!.data!
                                        .cartDetails![widget.index].itemDesc
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GetBuilder<CartCountController>(
                                    init: CartCountController(),
                                    builder: (cartCOntroller) {
                                      return FutureBuilder(
                                          // future: cartCOntroller.add(addValue),
                                          builder: (context, snapshot) {
                                        return Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                //     setState(() {
                                                if (_counter <= 1) {
                                                  return null;
                                                } else {
                                                  _counter--;
                                                  //  totalValue = totalValue - value;
                                                  // cartCOntroller
                                                  //     .subtract(value);
                                                  cartCOntroller.countIncrease(
                                                      cartId: widget
                                                          .cartData!
                                                          .data!
                                                          .cartDetails![
                                                              widget.index]
                                                          .cartId,
                                                      itemCost: widget
                                                          .cartData!
                                                          .data!
                                                          .cartDetails![
                                                              widget.index]
                                                          .itemCost,
                                                      cartDetailsId: widget
                                                          .cartData!
                                                          .data!
                                                          .cartDetails![
                                                              widget.index]
                                                          .cartDetailsId,
                                                      quantity:
                                                          _counter.toString());
                                                }
                                                print(_counter);
                                                //     });
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Divider(
                                                    height: 2,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                              ),
                                            ),
                                            Container(
                                              height: 20,
                                              width: 30,
                                              color: Colors.white,
                                              child: Center(
                                                child: Text(
                                                  _counter.toString(),
                                                  style: FoodigyTextStyle
                                                      .addTocartStyle,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                //              setState(() {
                                                _counter++;
                                                // totalValue = totalValue + value;
                                                print(_counter);
                                                //  cartCOntroller.add(value);
                                                // cartCOntroller.addCart(
                                                //     widget.cartData, _counter);

                                                print(widget
                                                    .cartData!
                                                    .data!
                                                    .cartDetails![widget.index]
                                                    .itemName);
                                                //worked
                                                cartCOntroller.countIncrease(
                                                  cartId: widget
                                                      .cartData!
                                                      .data!
                                                      .cartDetails![
                                                          widget.index]
                                                      .cartId,
                                                  itemCost: widget
                                                      .cartData!
                                                      .data!
                                                      .cartDetails![
                                                          widget.index]
                                                      .itemCost,
                                                  cartDetailsId: widget
                                                      .cartData!
                                                      .data!
                                                      .cartDetails![
                                                          widget.index]
                                                      .cartDetailsId,
                                                      quantity:  _counter.toString()
                                                );
                                                // cartCOntroller.addCart(
                                                //     widget.cartData,
                                                //     _counter);

                                                //   print(value);
                                                //            });
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text("+"),
                                                )),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                    }),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  //     width: 70,
                                  child: Text(
                                    // " \u{20B9} $value",
                                    "${iRubee.toString()} ${double.parse(value.toString()).toStringAsFixed(2)}",
                                    style: FoodigyTextStyle.amountStyle,
                                  ),
                                ),
                              ],
                            ),

                            // IconButton(
                            //     onPressed: () {
                            //       print('click');
                            //       GetCartDetailsController().deleteCartItem(
                            //           cartDetailsID: widget.cartData!.data!
                            //               .cartDetails![widget.index].cartDetailsId,
                            //           itemId: widget
                            //               .cartData!.data!.cartDetails![widget.index].itemId,
                            //           providerId: widget.cartData!.data!
                            //               .cartDetails![widget.index].providerId,
                            //           iName: widget.cartData!.data!.cartDetails![widget.index]
                            //               .itemName,
                            //           currency: widget.cartData!.data!
                            //               .cartDetails![widget.index].currency,
                            //           itemdec: widget.cartData!.data!
                            //               .cartDetails![widget.index].itemDesc,
                            //           iSlug: widget.cartData!.data!.cartDetails![widget.index]
                            //               .itemSlug,
                            //               proCost: widget.cartData!.data!
                            //               .cartDetails![widget.index].itemCost,
                            //           pTiming: widget.cartData!.data!
                            //               .cartDetails![widget.index].productTiming,
                            //               pAvaiTiming: widget.cartData!.data!
                            //               .cartDetails![widget.index].productAvailableTime,
                            //           cartId: widget
                            //               .cartData!.data!.cartDetails![widget.index].cartId);
                            //     },
                            //     icon: Icon(
                            //        MdiIcons .deleteOutline,
                            //       size: iconHeight,
                            //       color: FoodigyColors.deleteIcon,
                            //     ))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                     widget.cartData!.data!.cartDetails![widget.index].customization==null ?Container():       InkWell(
                              onTap: () {
                                Get.to(CartCustomizeScreen(
                                  index: widget.index,
                                  cartData: widget.cartData,
                                 
                                ));
                                // foodigyBottomSheet(
                                //     context, widget.cartData, widget.index);
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    'Personalized',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    MdiIcons.chevronDown,
                                    size: 12,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                GetCartDetailsController().deleteCartItem(
                                    cartDetailsID: widget
                                        .cartData!
                                        .data!
                                        .cartDetails![widget.index]
                                        .cartDetailsId,
                                    itemId: widget.cartData!.data!
                                        .cartDetails![widget.index].itemId,
                                    providerId: widget.cartData!.data!
                                        .cartDetails![widget.index].providerId,
                                    iName: widget.cartData!.data!
                                        .cartDetails![widget.index].itemName,
                                    currency: widget.cartData!.data!
                                        .cartDetails![widget.index].currency,
                                    itemdec: widget.cartData!.data!
                                        .cartDetails![widget.index].itemDesc,
                                    iSlug: widget.cartData!.data!
                                        .cartDetails![widget.index].itemSlug,
                                    proCost: widget.cartData!.data!
                                        .cartDetails![widget.index].itemCost,
                                    pTiming: widget
                                        .cartData!
                                        .data!
                                        .cartDetails![widget.index]
                                        .productTiming,
                                    pAvaiTiming: widget
                                        .cartData!
                                        .data!
                                        .cartDetails![widget.index]
                                        .productAvailableTime,
                                    cartId: widget.cartData!.data!
                                        .cartDetails![widget.index].cartId);
                              },
                              child: Text("Delete",
                                  style: FoodigyTextStyle.addTocartStyle),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> foodigyBottomSheet(
      BuildContext context, CartDetailsModel? cartData, int? index) {
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
        return FilterBottomSheet(
          cartData: cartData,
          index: index,
        );
      },
    );
  }
}
