import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodigy/model/cart_details_model.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:intl/intl.dart';

class FilterBottomSheet extends StatefulWidget {
  final CartDetailsModel? cartData;
  final int? index;
  const FilterBottomSheet({Key? key, this.cartData, this.index})
      : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool isStrechedDropDown = false;
  bool isVegNonVeg = false;
  bool isDeliveryTime = false;
  int? groupValue;
  int? typeValue;
  int? timeValue;
  String title = '';
  String type = '';
  String time = '';

  String? productTime;
  String? one = '';
  String? second = '';
  String? third = '';
  int? valu;
  @override
  void initState() {
    productTime = widget
        .cartData!.data!.cartDetails![widget.index!].productAvailableTime
        .toString();
    Timer(const Duration(seconds: 1), () {
      maaa();
    });
    super.initState();
  }

  void maaa() {
    setState(() {
      print('timing');
      print(productTime);
      valu = int.parse(productTime
              .toString()
              .substring(0, productTime.toString().indexOf(':'))) +
          1;
      one = productTime.toString().substring(2, 5);
      second = productTime
          .toString()
          .substring(productTime.toString().indexOf(':'));
      third = productTime
          .toString()
          .substring(productTime.toString().indexOf(':') + 1, 5);

      print(valu.toString());
      print(one);
      print(second.toString());
      print(third);

      //  int pTIme = int.parse(productTime.toString());
      DateTime date = DateTime(
          2021, 3, 28, 1, 50, 30); // Setting the DateTime to 2021-03-28, 1 AM
      print(date.add(Duration(minutes: 60)));
      DateTime dateTime = DateTime(
          date.year, date.month, date.day + 1, date.hour + 1, date.minute);
      print(dateTime.day);
      var time = "${dateTime.day}, ${dateTime.hour}, ${dateTime.minute}";
      print(time);

      print(DateFormat.jm().format(DateFormat("hh:mm:ss").parse(
          "${dateTime.hour}:${dateTime.minute}:${dateTime.microsecond}")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      width: double.infinity,
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                maaa();
                              },
                              child: Text(
                                "Customise as per you choice  ",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${widget.cartData!.data!.cartDetails![widget.index!].itemName.toString()} \u{20B9}${widget.cartData!.data!.cartDetails![widget.index!].itemCost.toString()}',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.close_rounded)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(4.0),
                        //   child: Text(
                        //     "Add ons",
                        //     style: FoodigyTextStyle.addTocartStyle,
                        //   ),
                        // ),
                        // Container(
                        //   height: 80,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(6),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(10.0),
                        //     child: Column(children: [
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: const [
                        //           Text(
                        //             'Mayo Sause',
                        //             style: FoodigyTextStyle.addTocartStyle,
                        //           ),
                        //           Text(
                        //             '\u{20B9}2,000',
                        //             style: FoodigyTextStyle.smallTextStyle,
                        //           )
                        //         ],
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: const [
                        //           Text(
                        //             'Mayo Sause',
                        //             style: FoodigyTextStyle.addTocartStyle,
                        //           ),
                        //           Text(
                        //             '\u{20B9}2,000',
                        //             style: FoodigyTextStyle.smallTextStyle,
                        //           )
                        //         ],
                        //       )
                        //     ]),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          // height: 60,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Wrap(
                            children: [
                              Text(
                                '${widget.cartData!.data!.cartDetails![widget.index!].itemDesc.toString()} ',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300),
                          child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Delivery available from ${valu.toString()}${second.toString()}", style: FoodigyTextStyle.addTocartStyle,),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(0.0),
                        //   child: Text(
                        //     "Any Special Request?",
                        //     style: FoodigyTextStyle.addTocartStyle,
                        //   ),
                        // ),
                        // SizedBox(height: 10,),
                        
                        // Container(
                        //   // height: 150,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(6),
                        //   ),
                        //   child: Padding(
                        //       padding: const EdgeInsets.all(10.0),
                        //       child: TextFormField(
                        //         maxLines: 6,
                        //         decoration: InputDecoration(
                        //             border: InputBorder.none,
                        //             hintText: 'Type your request here....',
                        //             hintStyle: TextStyle(
                        //                 fontFamily: 'Poppins',
                        //                 fontSize: 12,
                        //                 color: Colors.grey,
                        //                 fontWeight: FontWeight.w400)),
                        //       )),
                        // )
                     
                      ],
                    ),
                  ]),
            ),
            Container(
              height: 70,
              color: Colors.white,
              child: Column(
                children: [
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                          // height: 38,
                          // width: MediaQuery.of(context).size.width / 3,
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.cartData!.data!.cartDetails!.length} items in cart",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            '\u{20B9}${widget.cartData!.data!.cartDetails![widget.index!].itemCost.toString()} ',
                            style: TextStyle(
                                color: Colors.black,
                                //fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                      // SizedBox(
                      //   height: 38,
                      //   width: MediaQuery.of(context).size.width / 3,
                      //   child: TextButton(
                      //     child: Text(
                      //       "Add to Cart",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //     style: TextButton.styleFrom(
                      //         primary: Colors.purple,
                      //         backgroundColor: firstColor,
                      //         textStyle: const TextStyle(
                      //             fontSize: 14, fontFamily: 'Poppins')),
                      //     onPressed: () {},
                      //   ),
                      // )
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
