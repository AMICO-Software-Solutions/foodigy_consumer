// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/item_available_search_controller.dart';
import 'package:foodigy/presentation/home_screens/home_screens/item_available_view_page_screen.dart';
import 'package:foodigy/presentation/home_screens/home_screens/view_all_item_pagination_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_design.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/custom_rating_bar_foodigy.dart';
import 'package:get/get.dart';

class ItemAvailableSearchList extends StatefulWidget {
  const ItemAvailableSearchList({super.key});

  @override
  State<ItemAvailableSearchList> createState() =>
      _ItemAvailableSearchListState();
}

class _ItemAvailableSearchListState extends State<ItemAvailableSearchList> {
  ItemAvailableSearchController itemAvailableController =Get.put(ItemAvailableSearchController());
 @override
  void initState() {
    itemAvailableController.getItemSearchFood(timing: selecedData);
    super.initState();
  }

  List selecedData = ["ANYTIME"];

  @override
  Widget build(BuildContext context) {
    return 
        SizedBox(
          child: Obx(() {
            if (itemAvailableController.isDataLoading.isTrue) {
              return Center(
                child: CircularProgressIndicator(
                  color: firstColor,
                ),
              );
            } else {
              return FutureBuilder(
                future: itemAvailableController.getLoader(),
                //   future: itemAvailableController.getItemSearchFood(),
                  //     timing: selecedData),
                  builder: (context, snapshot) {
                    if (itemAvailableController.searchModel == null) {
                      return Center(
                        child: InkWell(
                          onTap: (){
                             itemAvailableController.getItemSearchFood();
                          },
                          child: Text(
                            "Food is not available at this location. Please refine your search",
                            style: FoodigyTextStyle.homeHeadLine,
                          ),
                        ),
                      );
                    } else if (itemAvailableController
                        .searchModel!.data!.isEmpty) {
                      return SizedBox(
                        height: 100,
                        child: Center(
                          child: InkWell(
                            onTap: (){
                             itemAvailableController.getItemSearchFood();
                            },
                            child: Text(
                              "No chef available in your area to serve at the moment!",
                              textAlign: TextAlign.center,
                              style: FoodigyTextStyle.homeHeadLine,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Text("Food near your location",
                                        style: FoodigyTextStyle.homeHeadLine),
                                  ],
                                ),
                                itemAvailableController.searchModel!.data!.isEmpty
                                    ? Container()
                                    : TextButton(
                                        onPressed: () {
                                          // Get.to(ViewAllItemAvailable());
                                          Get.to(ViewAllItemPaginationScreen());
                                        },
                                        child: Text(
                                          'View all',
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 13,
                                          ),
                                        ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 215,
                            width: double.infinity,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    itemAvailableController.searchModel == null
                                        ? 0
                                        : itemAvailableController
                                            .searchModel!.data!.length,
                                itemBuilder: (context, index) {
                                  return itemAvailableController.searchModel!
                                              .data![index].productStatus ==
                                          false
                                      ? Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 210,
                                              width: 155,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey.shade400,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ColorFiltered(
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.grey.shade100,
                                                        BlendMode.saturation,
                                                      ),
                                                      child: Container(
                                                        height:
                                                            homeImageContainerHeight,
                                                        width:
                                                            homeImageContainerWidth,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    itemAvailableController
                                                                        .searchModel!
                                                                        .data![
                                                                            index]
                                                                        .productSlug
                                                                        .toString()),
                                                                fit:
                                                                    BoxFit.cover),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                            color: Colors
                                                                .grey.shade500),
                                                        child: ratingContainer(
                                                            index),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 100,
                                                              child: Text(
                                                                itemAvailableController
                                                                    .searchModel!
                                                                    .data![index]
                                                                    .productTitle
                                                                    .toString(),
                                                                //  textAlign: TextAlign.justify,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize: 10,
                                                                    fontFamily:
                                                                        'Poppins'),
                                                              ),
                                                            ),
                                                            Text(
                                                              'By ${itemAvailableController.searchModel!.data![index].profileName}',
                                                              style: FoodigyTextStyle
                                                                  .smallGreyTextStyle,
                                                            )
                                                          ],
                                                        ),
                                                        ColorFiltered(
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                            Colors.grey.shade100,
                                                            BlendMode.saturation,
                                                          ),
                                                          child: Container(
                                                            height: 25,
                                                            width: 25,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: NetworkImage(itemAvailableController
                                                                        .searchModel!
                                                                        .data![
                                                                            index]
                                                                        .profileImage
                                                                        .toString()),
                                                                    fit: BoxFit
                                                                        .cover),
                                                                shape: BoxShape
                                                                    .circle),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        itemAvailableController
                                                                .searchModel!
                                                                .data![index]
                                                                .availableCustomization!
                                                                .custom!
                                                                .isEmpty
                                                            ? SizedBox(
                                                                //   height: 25,
                                                                child: Text(
                                                                  "",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10,
                                                                      fontFamily:
                                                                          'Poppins'),
                                                                ),
                                                              )
                                                            : SizedBox(
                                                                //   height: 25,
                                                                child: Text(
                                                                  "Personalize",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          10,
                                                                      fontFamily:
                                                                          'Poppins'),
                                                                ),
                                                              ),
                                                        RichText(
                                                          text: TextSpan(
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      '${iRubee.toString()} ${itemAvailableController.searchModel!.data![index].productCost.toString()} ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          25,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal)),
                                                              TextSpan(
                                                                  text: '',
                                                                  style: FoodigyTextStyle
                                                                      .smallTextStyle),
                                                            ],
                                                          ),
                                                          textScaleFactor: 0.5,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(ItemAvaliableViewScreen(
                                                result: itemAvailableController
                                                    .searchModel!.data,
                                                index: index,
                                                pName: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .profileName
                                                    .toString(),
                                                pDescription:
                                                    itemAvailableController
                                                        .searchModel!
                                                        .data![index]
                                                        .profileDescription
                                                        .toString(),
                                                pCurrency: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .prefferedCurrency
                                                    .toString(),
                                                pImage: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .profileImage
                                                    .toString(),
                                                userId: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .userId,
                                                invenId: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .inventoryId,
                                                invType: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .invType
                                                    .toString(),
                                                address: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .address
                                                    .toString(),
                                                city: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .city
                                                    .toString(),
                                                proTitle: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .productTitle
                                                    .toString(),
                                                proDes: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .productDescription
                                                    .toString(),
                                                proSlug: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .productSlug
                                                    .toString(),
                                                proCost: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .productCost
                                                    .toString(),
                                                naturalPro:
                                                    itemAvailableController
                                                        .searchModel!
                                                        .data![index]
                                                        .natureofProduct
                                                        .toString(),
                                                proTiming: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .productTiming
                                                    .toString(),
                                                proId: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .productId
                                                    .toString(),
                                                menuTag: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .menuTag
                                                    .toString(),
                                                healthTag: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .healthTag
                                                    .toString(),
                                                customization:
                                                    itemAvailableController
                                                        .searchModel!
                                                        .data![index]
                                                        .availableCustomization!
                                                        .custom,
                                                proAvgRat: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .productAverageRating
                                                    .toString(),
                                                proRatCoun:
                                                    itemAvailableController
                                                        .searchModel!
                                                        .data![index]
                                                        .productRatingCount
                                                        .toString(),
                                                fssaiNo: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .fssaiNo
                                                    .toString(),
                                                prounit: itemAvailableController
                                                    .searchModel!
                                                    .data![index]
                                                    .productUnits
                                                    .toString(),
                                                proAvaiTime:
                                                    itemAvailableController
                                                        .searchModel!
                                                        .data![index]
                                                        .productAvailableTime
                                                        .toString(),
                                                orCutOffTime:
                                                    itemAvailableController
                                                        .searchModel!
                                                        .data![index]
                                                        .orderCutOffTime
                                                        .toString(),
                                              ));
                                            },
                                            child: Container(
                                              height: 210,
                                              width: 155,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey.shade400,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      height:
                                                          homeImageContainerHeight,
                                                      width:
                                                          homeImageContainerWidth,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  itemAvailableController
                                                                      .searchModel!
                                                                      .data![
                                                                          index]
                                                                      .productSlug
                                                                      .toString()),
                                                              fit: BoxFit.cover),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors
                                                              .grey.shade500),
                                                      child:
                                                          ratingContainer(index),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 100,
                                                              child: Text(
                                                                itemAvailableController
                                                                    .searchModel!
                                                                    .data![index]
                                                                    .productTitle
                                                                    .toString(),
                                                                //  textAlign: TextAlign.justify,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 10,
                                                                    fontFamily:
                                                                        'Poppins'),
                                                              ),
                                                            ),
                                                            Text(
                                                              'By ${itemAvailableController.searchModel!.data![index].profileName}',
                                                              style: FoodigyTextStyle
                                                                  .smallTextStyle,
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(itemAvailableController
                                                                      .searchModel!
                                                                      .data![
                                                                          index]
                                                                      .profileImage
                                                                      .toString()),
                                                                  fit: BoxFit
                                                                      .cover),
                                                              shape: BoxShape
                                                                  .circle),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        itemAvailableController
                                                                .searchModel!
                                                                .data![index]
                                                                .availableCustomization!
                                                                .custom!
                                                                .isEmpty
                                                            ? SizedBox(
                                                                child: Text(
                                                                  "Personalize",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10,
                                                                      fontFamily:
                                                                          'Poppins'),
                                                                ),
                                                              )
                                                            : Row(
                                                                // ignore: prefer_const_literals_to_create_immutables
        
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    child:Image(image: 
                                                                      AssetImage("assets/images/personalize.png"),
                                                                      width:24,
                                                                    ), 
                                                                  ),
                                                                  SizedBox(
                                                                    //   height: 25,
                                                                    child: Text(
                                                                      "Personalize",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              10,
                                                                          fontFamily:
                                                                              'Poppins'),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                      
                                                      
                                                        RichText(
                                                          text: TextSpan(
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      '${iRubee.toString()} ${itemAvailableController.searchModel!.data![index].productCost.toString()} ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          25,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal)),
                                                              TextSpan(
                                                                  text: '',
                                                                  style: FoodigyTextStyle
                                                                      .smallTextStyle),
                                                            ],
                                                          ),
                                                          textScaleFactor: 0.5,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                }),
                          ),
                        ],
                      );
                    }
                  });
            }
          }),
        );
      
  }

  Padding ratingContainer(int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            itemAvailableController
                        .searchModel!.data![index].productAverageRating ==
                    null
                ? Container()
                : Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CustomRatingFav(
                            productAverageRating: itemAvailableController
                                .searchModel!.data![index].productAverageRating
                                .toString(),
                          )),
                      Text(
                        "(${itemAvailableController.searchModel!.data![index].productRatingCount.toString()})",
                        style: TextStyle(
                            color: Colors.amber,
                            fontFamily: 'Poppins',
                            fontSize: 12),
                      )
                    ],
                  ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ]),
    );
  }
}
