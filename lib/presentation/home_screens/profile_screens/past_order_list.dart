// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/order_controller/past_order_controller.dart';
import 'package:foodigy/presentation/home_screens/home.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/past_order_list_cart_design.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:get/get.dart';


class PastOrderList extends StatefulWidget {
  const PastOrderList({super.key});
  @override
  State<PastOrderList> createState() => _PastOrderListState();
}

class _PastOrderListState extends State<PastOrderList> {
  PastOrderController pastController = Get.put(PastOrderController());
  @override
  void initState() {
    pastController.pastOrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: pastController.pastOrderList(),
        builder: (context, snapshot) {
          return SizedBox(
            child: Obx(() {
              if (pastController.isDataLoading.isTrue) {
                return Center(
                  child: CircularProgressIndicator(
                    color: firstColor,
                  ),
                );
              } else if (pastController.pastOrder == null) {
                return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:const [
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
                                "Your Past Order is Empty!",
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
                              
                                
                            ],
                          ),
                        );
              } else {
                return SizedBox(
                  // height: 600,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pastController.pastOrder!.data == null
                            ? 0
                            : pastController.pastOrder!.data!.length,
                        itemBuilder: (context, index) {
                          return PastOrderListCardDesign(
                              date: '',
                              index: index,
                              pastOrder: pastController.pastOrder!);
                        }),
                  ),
                );
              }
            }),
          );
        });
  }
}
