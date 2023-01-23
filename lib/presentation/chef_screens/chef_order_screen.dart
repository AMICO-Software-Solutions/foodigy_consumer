// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/chef_order_controller.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';

class ChefOrderScreen extends StatefulWidget {
  final String? userId;
  final String? chefId;
  const ChefOrderScreen({super.key, this.userId, this.chefId});

  @override
  State<ChefOrderScreen> createState() => _ChefOrderScreenState();
}

class _ChefOrderScreenState extends State<ChefOrderScreen> {
  ChefOrderController chefOrderController = Get.put(ChefOrderController());

  @override
  void initState() {
    chefOrderController.chefOrderList(
        chefId: widget.chefId,);
    print(widget.chefId);
    print(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double spaceHeight = 15;
    return Scaffold(
      body: Obx(() {
        if (chefOrderController.isDataLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(color: firstColor),
          );
        } else if (chefOrderController.chefOrder == null) {
          return Center(
            child: Text(
              " This chef is not available at this location",
              style: FoodigyTextStyle.homeHeadLine,
            ),
          );
        } else if (chefOrderController.chefOrder!.data == null) {
          return Center(
            child: Text(
              " This chef is not available at this location",
              style: FoodigyTextStyle.homeHeadLine,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ], borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chefOrderController.chefOrder!.data![index]
                                .orderDetail![0].productName
                                .toString(),
                            style: FoodigyTextStyle.addressTextStyle,
                          ),
                          Text(
                            chefOrderController
                                .chefOrder!.data![index].readyForDeliverTime
                                .toString(),
                            style: FoodigyTextStyle.smallGreyTextStyle,
                          ),
                          Text(
                            'Delivered to:${chefOrderController.chefOrder!.data![index].invoiceAddress.toString()}',
                            style: FoodigyTextStyle.smallGreyTextStyle,
                          ),
                          Text(
                              '$iRubee ${chefOrderController.chefOrder!.data![index].totalCost.toString()}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Center(
                                      child: Text(
                                    'RE-ORDER',
                                    style: FoodigyTextStyle.addressTextStyle,
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Center(
                                      child: Text(
                                    'RATE ORDER',
                                    style: FoodigyTextStyle.addressTextStyle,
                                  )),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: chefOrderController.chefOrder!.data!.length),
          );
        }
      }),
    );
  }
}
