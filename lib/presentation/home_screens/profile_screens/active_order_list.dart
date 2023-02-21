// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:foodigy/controller/order_controller/active_order_controller.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/active_order_list_design.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:get/get.dart';

class ActiveOrderList extends StatefulWidget {
  const ActiveOrderList({super.key});
  @override
  State<ActiveOrderList> createState() => _ActiveOrderListState();
}

class _ActiveOrderListState extends State<ActiveOrderList> {
  ActiveOrderController activeController = Get.put(ActiveOrderController());
  @override
  void initState() {
    activeController.activeOrderList();
    super.initState();
  }
  DateTime? date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: activeController.activeOrderList(),
        builder: (context, snapshot) {
          return SizedBox(
            child: Obx(() {
              if (activeController.isDataLoading.isTrue) {
                return Center(
                  child: CircularProgressIndicator(
                    color: firstColor,
                  ),
                );
              } else if (activeController.activeOrder == null) {
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
                                "Your Active Order is Empty!",
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
                        itemCount: activeController.activeOrder!.data == null
                            ? 0
                            : activeController.activeOrder!.data!.length,
                        itemBuilder: (context, index) {
                          date = DateTime.parse(activeController
                              .activeOrder!.data![index].orderPlacedTime
                              .toString());
                          return ActiveOrderListDesign(index: index,activeOrder: activeController.activeOrder!,date: '',);
                        }),
                  ),
                );
              }
            }),
          );
        });
  }
 
}

