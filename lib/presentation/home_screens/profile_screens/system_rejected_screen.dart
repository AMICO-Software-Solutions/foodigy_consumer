import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodigy/model/past_order_model.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/custom_appbar.dart';
import 'package:foodigy/widgets/profile/order_button.dart';
import 'package:intl/intl.dart';

import '../../../utilities/const_color.dart';

class SystemRejectedScreen extends StatefulWidget {
  final String? orderStatus;
  final String? orderStatusTime;
  final DateTime? orderStatusDate;
  final DateTime? orderCancelledDate;
  final PastOrderModel? pastOrder;
  final List<OrderDetail>? orderList;
  final List<DeliveryType>? delivery;
  final List<RazorpayPayment>? razer;
  final int index;

  const SystemRejectedScreen(
      {super.key,
      this.pastOrder,
      this.orderList,
      this.delivery,
      this.razer,
      required this.index, this.orderStatus, this.orderStatusTime, this.orderStatusDate, this.orderCancelledDate});

  @override
  State<SystemRejectedScreen> createState() => _SystemRejectedScreenState();
}

class _SystemRejectedScreenState extends State<SystemRejectedScreen> {
  // DateTime orderAt = DateTime.parse('2022-08-29T10:33:49.283Z');
  // DateTime rejectedAt = DateTime.parse('2022-08-29T10:33:49.283Z');
  @override
  void initState() {
    // orderAt = DateTime.parse(
    //     widget.pastOrder!.data![widget.index].bookingDate.toString());
    // rejectedAt = DateTime.parse(widget.orderStatusTime.toString());
    Timer(const Duration(seconds: 0), () {
     String? productTime = DateFormat('HH:mm a').format(widget.orderCancelledDate!);
      maaa(productTime);
    });
    super.initState();
  }
  //String? productTime;
  String? pATIme = '';
  String? one = '';
  int? second;
  String? third = '';
  int? valu;

  void maaa( String? productTime) {
    setState(() {
      print("product time");
      third = productTime.toString().substring(6, 8);
   //   print(third);
      valu = int.parse(productTime
              .toString()
              .substring(0, productTime.toString().indexOf(':'))) +
          5;
      one = productTime.toString().substring(3, 5);
      second = int.parse(one.toString()) + 30;
      if (third == "AM") {
        if (int.parse(second.toString()) >= 60) {
          valu = valu! + 1;
           second =second! -60;
            String  seco =second.toString().length ==1? "0$second":second.toString();
          if (valu! < 12) {
          String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${seco.toString()} $third";
          } else {
             valu =valu! - 12;
             String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${seco.toString()} PM";
          }
        } else {
          if (valu! < 12) {
            String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${second.toString()} $third";
          } else {
             valu =valu! - 12;
                 String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${second.toString()} PM";
          }
        }
        print("am values");
      } else {
        print("pm value");
        if (int.parse(second.toString()) >= 60) {
          valu = valu! + 1;
          second =second! -60;
           String  seco =second.toString().length ==1? "0$second":second.toString();
          if (valu! < 24) { 
            valu =valu!-12;
                String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${seco.toString()} PM";
          } else {
             valu =valu! - 12;
                 String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${seco.toString()} AM";
          }
        } else {
          if (valu! < 24) {
             valu =valu!-12;
                 String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${second.toString()} PM";
          } else {
             valu =valu! - 12;
                 String valuTwo =  valu.toString()=="0"?"12": valu.toString();
            pATIme = "${valuTwo.toString()}:${second.toString()} AM";
          }
        }
      }
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
    int discountValue=widget.pastOrder!.data![widget.index].couponCost == null ? 0 :int.parse(widget.pastOrder!.data![widget.index].productTotalCost.toString())- int.parse(widget.pastOrder!.data![widget.index].couponCost.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        text: 'Order Details',
        backgroundColor: firstColor,
        textColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget
                                    .pastOrder!.data![widget.index].profileName
                                    .toString(),
                                style: FoodigyTextStyle.homeHeadLine,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                height: 20,
                                child: Wrap(
                                  children: [
                                    Text(
                                        "Order #: ${widget.pastOrder!.data![widget.index].orderId.toString()}",
                                        style:
                                            FoodigyTextStyle.addressTextStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ]),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 20,
                                width: 100,
                                alignment: Alignment.center,
                                child: ListView.builder(
                                  itemCount: 1,
                                  itemBuilder:(context, i){
                                    return widget.pastOrder!.data![widget.index].razorpayPayment![i].paymentStatus.toString()=="failed"?
                                       Container():  Text(
                                  " ${widget.pastOrder!.data![widget.index].razorpayPayment![i].razorpayRefund![0].refundStatus.toString()}",
                                //  "Refund Completed",
                                  style: FoodigyTextStyle.smallGreyTextStyle,
                                );
                                   
                                    
                              
                                  } )),
                              widget.pastOrder!.data![widget.index].orderRejectReason.toString()=="null"?Container():    Container(
                                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(5)),

                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(widget.pastOrder!.data![widget.index].orderRejectReason.toString(),style: FoodigyTextStyle.smallGreyTextStyle,),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                            width: 60,
                          ),
                  Container(
                    // height: 40,
                    // width: MediaQuery.of(context).size.width / 2.2,
                    // decoration: BoxDecoration(
                    //   color: Colors.grey.shade300,
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order At",
                            style: FoodigyTextStyle.smallTextBoldStyle,
                          ),
                           Text("${DateFormat.yMMMd().format(widget.orderStatusDate!).toString()}, ${ widget.orderStatusTime.toString()}",
                            style: FoodigyTextStyle.smallTextStyle,
                          )
                          // Text( "${DateFormat.yMMMd().format(orderAt)}, ${DateFormat('HH:mm a').format(orderAt)}",
                          //   style: FoodigyTextStyle.smallTextStyle,
                          // )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2.2,
                    // decoration: BoxDecoration(
                    //   color: Colors.amber.shade800,
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${widget.orderStatus.toString()}",
                            style: FoodigyTextStyle.smallTextBoldStyle,
                          ),
                          Text(
                            "${DateFormat.yMMMd().format(widget.orderCancelledDate!).toString()},$pATIme ",
                            style: FoodigyTextStyle.smallTextStyle,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                .orderList![index].productSlug
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
                                        style: FoodigyTextStyle.addTocartStyle,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            widget.orderList![index].quantity
                                                .toString(),
                                            style:
                                                FoodigyTextStyle.aboutChefStyle,
                                          ),
                                          Text(" x ",
                                              style: FoodigyTextStyle
                                                  .aboutChefStyle),
                                          Text(
                                              "$iRubee${double.parse(widget.orderList![index].cost.toString()).toStringAsFixed(2)}",
                                              style:
                                                  FoodigyTextStyle.amountStyle)
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
                  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Items in cart",
          style: FoodigyTextStyle.aboutChefStyle,
        ),
        Text(
          widget.orderList!.length.toString(),
          style: FoodigyTextStyle.amountStyle,
        )
      ],
    ),
                 
                  SizedBox(
                    height: 10,
                  ),
                   paymentCard(
                      title: "Amount",
                      value:widget.pastOrder!.data![widget.index].productTotalCost==null ? '0':  widget.pastOrder!.data![widget.index].productTotalCost
                          .toString()),
                  SizedBox(
                    height: 10,
                  ),
                   paymentCard(
                      title: "Discount",
                      value:widget.pastOrder!.data![widget.index].productTotalCost==null ? '0':  discountValue.toString()),
                  SizedBox(
                    height: 10,
                  ),
                   paymentCard(
                      title: "After Discount",
                      value:widget.pastOrder!.data![widget.index].couponCost==null ? '0':  "${int.parse(widget.pastOrder!.data![widget.index].couponCost.toString())}"),
                  SizedBox(
                    height: 10,
                  ),
                  paymentCard(
                      title: "SGST @ 2.5%",
                      value:widget.pastOrder!.data![widget.index].sgstCost==null ? '0':  widget.pastOrder!.data![widget.index].sgstCost
                          .toString()),
                  SizedBox(
                    height: 10,
                  ),
                  paymentCard(
                      title: 'CGST @ 2.5%',
                      value:widget.pastOrder!.data![widget.index].cgstCost==null ? '0':  widget.pastOrder!.data![widget.index].cgstCost
                          .toString()),
                  SizedBox(
                    height: 10,
                  ),
                  paymentCard(
                      title: 'Delivery Charge',
                      value: widget.pastOrder!.data![widget.index].deliveryRate==null ? '0': widget.pastOrder!.data![widget.index].deliveryRate
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
            Container(
              height: 30,
              width: double.infinity,
              color: Colors.white,
            )
          ],
        ),
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
    value.toString() =="null"? Text('0'):    Text(
          '$iRubee ${double.parse(value.toString()).toStringAsFixed(2)}',
          style: FoodigyTextStyle.amountStyle,
        )
      ],
    );
  }
}
