// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/item_available_search_controller.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/glass_blur.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ViewAllItemAvailable extends StatefulWidget {
  const ViewAllItemAvailable({super.key});

  @override
  State<ViewAllItemAvailable> createState() => _ViewAllItemAvailableState();
}

class _ViewAllItemAvailableState extends State<ViewAllItemAvailable> {
  ItemAvailableViewSearchController itemAvailableController =
      Get.put(ItemAvailableViewSearchController());
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    itemAvailableController.getItemSearchFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.grey.shade500, //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text("")),
        body: Obx(() {
          if (itemAvailableController.isDataLoading.value == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (itemAvailableController.searchModel!.data!.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1,
              child: Center(
                child: Text(
                  "No chef available in your area to serve at the moment!",
                  style: FoodigyTextStyle.homeHeadLine,
                ),
              ),
            );
          } else {
            return SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () {
                  print('hello');
                  // final result = await getPassengerData(isRefresh: true);
                  // if (result) {
                  //   refreshController.refreshCompleted();
                  // } else {
                  //   refreshController.refreshFailed();
                  // }
                },
                onLoading: () async {
                  print("loading");
                  // final result = await getPassengerData();
                  // if (result) {
                  //   refreshController.loadComplete();
                  // } else {
                  //   refreshController.loadFailed();
                  //  }
                },
                //   child: FutureBuilder(
                // //  future: getFoods(''),
                // future:
                //     itemAvailableController.getItemSearchFood(timing: []),
                //    builder: (context, snapshot) {
                //  return
                child: ListView.builder(
                    itemCount: itemAvailableController.searchModel == null
                        ? 0
                        : itemAvailableController.searchModel!.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15),
                        child: Container(
                          height: 215,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.5, 2),
                                  blurRadius: 4,
                                  color: Colors.grey.shade500,
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                      height: 140,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade400,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  itemAvailableController
                                                      .searchModel!
                                                      .data![index]
                                                      .productSlug
                                                      .toString()),
                                              fit: BoxFit.cover))),
                                  itemAvailableController
                                              .searchModel!
                                              .data![index]
                                              .productAverageRating ==
                                          null
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              GlassBlur(
                                                child: Container(
                                                  height: 20,
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                  width: 50,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                          size: 15,
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          itemAvailableController
                                                              .searchModel!
                                                              .data![index]
                                                              .productAverageRating
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              // GlassBlur(
                                              //  child: Container(
                                              //     height: 20,
                                              //     color: Colors.white
                                              //         .withOpacity(0.3),
                                              //     width: 70,
                                              //     child: Row(
                                              //         mainAxisAlignment:
                                              //             MainAxisAlignment
                                              //                 .center,
                                              //         crossAxisAlignment:
                                              //             CrossAxisAlignment
                                              //                 .center,
                                              //         children: const [
                                              //           Text(
                                              //             "Available 3",
                                              //             style: TextStyle(
                                              //                 color: Colors.white,
                                              //                 fontFamily:
                                              //                     'Poppins',
                                              //                 fontSize: 11,
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .bold),
                                              //           )
                                              //         ]),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    //  height: ,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(itemAvailableController
                                                .searchModel!
                                                .data![index]
                                                .productTitle
                                                .toString()),
                                            RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          '$iRubee ${itemAvailableController.searchModel!.data![index].productCost.toString()}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black)),
                                                  TextSpan(
                                                      text: '/Per Person ',
                                                      style: TextStyle(
                                                          fontSize: 7,
                                                          color: Colors
                                                              .grey.shade500,
                                                          fontFamily:
                                                              'Poppins')),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "By ${itemAvailableController.searchModel!.data![index].profileName.toString()}",
                                          style: FoodigyTextStyle
                                              .smallGreyTextStyle,
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                               
                                                Text(
                                                  'Order before: ',
                                                  style: FoodigyTextStyle
                                                      .smallGreyTextStyle,
                                                ),
                                                Text(
                                                        itemAvailableController.searchModel!.data![index].orderCutOffTime.toString(),
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.red,
                                                          fontFamily: 'Poppins',
                                                        )),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Row(
                                              children: [
                                               
                                                Text(
                                                  " ${itemAvailableController.searchModel!.data![index].productAvailableTime.toString()}",
                                                  style: FoodigyTextStyle
                                                      .smallGreyTextStyle,
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
                // })
                );
          }
        }));
  }
}
