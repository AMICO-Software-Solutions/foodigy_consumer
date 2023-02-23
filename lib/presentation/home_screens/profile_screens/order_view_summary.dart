// ignore_for_file: avoid_print

import 'dart:async';

import 'package:foodigy/utilities/api_const_value.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/foundation.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/pdf_view_page.dart';
import 'package:http/http.dart' as http;

import 'package:foodigy/model/past_order_model.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/custom_appbar.dart';
import 'package:foodigy/widgets/profile/order_button.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderViewSummary extends StatefulWidget {
  final String? orderStatusTime;
  final DateTime? orderStatusDate;
  final DateTime? orderDeliveredDate;
  final PastOrderModel? pastOrder;
  final List<OrderDetail>? orderList;
  final List<DeliveryType>? delivery;
  final List<RazorpayPayment>? razer;
  final int index;
  const OrderViewSummary(
      {super.key,
      this.orderList,
      this.delivery,
      this.razer,
      this.pastOrder,
      required this.index, this.orderStatusTime, this.orderStatusDate, this.orderDeliveredDate});

  @override
  State<OrderViewSummary> createState() => _OrderViewSummaryState();
}

class _OrderViewSummaryState extends State<OrderViewSummary> {
  Future<void>? launched;
  String phone = '';

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: widget.pastOrder!.data![widget.index].phoneNumber.toString(),
    );
    // ignore: deprecated_member_use
    await launch(launchUri.toString());
  }

  StepperType stepperType = StepperType.vertical;
  int _currentStep = 0;

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  void initState() {
    print(widget.pastOrder!.data![widget.index].bookingDate.toString());
    print(widget.pastOrder!.data![widget.index].deliveredTime.toString());
    // orderAt = DateTime.parse(
    //     widget.pastOrder!.data![widget.index].bookingDate.toString());
    // rejectedAt = DateTime.parse(widget.pastOrder!.data![widget.index].deliveredTime.toString());
    Timer(const Duration(seconds: 0), () {
     String? productTime = DateFormat('HH:mm a').format(widget.orderDeliveredDate!);
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
    // ignore: unrelated_type_equality_checks
    DateTime orderAt = widget.pastOrder!.data![widget.index].bookingDate == ""
        ? DateTime.parse('2022-08-29T10:33:49.283Z')
        : DateTime.parse(
            widget.pastOrder!.data![widget.index].bookingDate.toString());
    DateTime rejectedAt = DateTime.parse('2022-08-29T10:33:49.283Z');
    // widget.pastOrder!.data![widget.index].bookingDate.toString() == ""
    //     ? DateTime.parse('2022-08-29T10:33:49.283Z')
    // : DateTime.parse(
    //     widget.pastOrder!.data![widget.index].deliveredTime.toString());

    double height = 50;
    double legnth = widget.pastOrder!.data![widget.index].orderDetail!.isEmpty
        ? 0
        : widget.pastOrder!.data![widget.index].orderDetail!.length.toDouble();
    double? to;
     int discountValue= widget.pastOrder!.data![widget.index].couponCost == null ? 0 :int.parse(widget.pastOrder!.data![widget.index].productTotalCost.toString())- int.parse(widget.pastOrder!.data![widget.index].couponCost.toString());

    to = height * legnth;
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
                        Container(
                            height: 30,
                            width: 100,
                            alignment: Alignment.center,
                            // decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     boxShadow: const [
                            //       BoxShadow(
                            //         color: Colors.grey,
                            //         blurRadius: 5.0,
                            //       ),
                            //     ]),
                            child: Text(
                              widget.pastOrder!.data![widget.index].orderStatus
                                  .toString(),
                              style: FoodigyTextStyle.smallGreyTextStyle,
                            ))
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Colors.white,
                  //   width: double.infinity,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         'Rate our chef',
                  //         style: FoodigyTextStyle.aboutChefStyle,
                  //       ),
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           color: Colors.white,
                  //         ),
                  //         width: 250,
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(10.0),
                  //           child: FittedBox(
                  //             child: Row(
                  //               children: [
                  //                 RatingBar.builder(
                  //                   initialRating: 4.5,
                  //                   minRating: 1,
                  //                   direction: Axis.horizontal,
                  //                   allowHalfRating: true,
                  //                   itemCount: 5,
                  //                   itemPadding:
                  //                       EdgeInsets.symmetric(horizontal: 0),
                  //                   itemBuilder: (context, _) => Icon(
                  //                     Icons.star,
                  //                     color: Colors.amber,
                  //                     size: 5,
                  //                   ),
                  //                   onRatingUpdate: (rating) {
                  //                     print(rating);
                  //                   },
                  //                 ),
                  //                 // SizedBox(
                  //                 //   width: 7,
                  //                 // ),
                  //                 // Text(
                  //                 //   "4.4 out of 5",
                  //                 //   style: TextStyle(fontSize: 20),
                  //                 // ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Divider(),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Order Details",
                  //         style: FoodigyTextStyle.aboutChefStyle,
                  //       ),
                  //       widget.delivery!.isEmpty
                  //           ? Container()
                  //           : Text(widget.delivery![0].trackingId.toString())
                  //     ],
                  //   ),
                  // ),
                  // Divider(),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2.2,
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
                          Text(
                          "${DateFormat.yMMMd().format(widget.orderStatusDate!).toString()}, ${ widget.orderStatusTime.toString()}",
                            style: FoodigyTextStyle.smallTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
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
                          Text(
                            "Delivered By",
                            style: FoodigyTextStyle.smallTextBoldStyle,
                          ),
                          Text(
                            "${DateFormat.yMMMd().format(widget.orderDeliveredDate!).toString()}, $pATIme",
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
                          value: widget.pastOrder!.data![widget.index]
                                      .couponCost ==
                                  null
                              ? '0'
                              : "${int.parse(widget.pastOrder!.data![widget.index].couponCost.toString())}"),
                  //  paymentCard(
                  //     title: "Discount",
                  //     value:widget.pastOrder!.data![widget.index].productTotalCost==null ? '0':  discountValue.toString()),
                  SizedBox(
                    height: 10,
                  ),
                   paymentCard(
                          title:  "After Discount",
                          value: widget.pastOrder!.data![widget.index]
                                      .productTotalCost ==
                                  null
                              ? '0'
                              : discountValue.toString()),
                  //  paymentCard(
                  //     title: "After Discount",
                  //     value:widget.pastOrder!.data![widget.index].couponCost==null ? '0':  "${int.parse(widget.pastOrder!.data![widget.index].couponCost.toString())}"),
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
              //height: 100,
              width: double.infinity, color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 150,
                                child: OrderButton(
                                    buttonColor: firstColor,
                                    color: firstColor,
                                    text: "Invoice",
                                    onPressed: () async {
                                      String url =
                                          "http://www.africau.edu/images/default/${widget.pastOrder!.data![widget.index].orderId.toString()}_invoice.pdf";
                                      final file = await loadPdfFromNetwork(
                                          url,
                                        widget.pastOrder!
                                              .data![widget.index].orderId
                                              .toString());
                                      openPdf(context, file, url);
                                      // getBlobdata(1);
                                      // getCartDetails('');
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )
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

  Future<File> loadPdfFromNetwork(String url, String id) async {
    final response = await http.get(
      Uri.parse("${ApiDomain.apiDomain}/ordermgmt/media/$id"),
      headers: {
        //   'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": 'Bearer $token',
      },
    );
    final bytes = response.bodyBytes;
    print("bytes");
    print(bytes);
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
  //  final dir = await getApplicationDocumentsDirectory();
   final dir = await DownloadsPathProvider.downloadsDirectory;
    // String dir = (await getApplicationDocumentsDirectory()).path;
    //   return File('$dir/gamerel_data.json');
    final file = File('${dir!.path}/$filename'); 
    print("check");
    print(file.toString());
    await file.writeAsBytes(bytes, 
    mode:  FileMode.write,
    flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }


  void openPdf(BuildContext context, File file, String url) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PdfViewerPage(
            file: file,
            url: url,
          ),
        ),
      );


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
}
