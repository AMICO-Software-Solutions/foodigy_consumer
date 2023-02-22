// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:foodigy/presentation/home_screens/home_screens/item_available_view_page_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/glass_blur.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:foodigy/model/item_available_search_model.dart';
import 'package:foodigy/utilities/const_value.dart';

class FilterEnableScreen extends StatefulWidget {
  const FilterEnableScreen({super.key});
  @override
  State<FilterEnableScreen> createState() => _FilterEnableScreenState();
}

class _FilterEnableScreenState extends State<FilterEnableScreen> {
  List<Datum>? result = [];
  ScrollController scrollController = ScrollController();
  bool loading = true;
  bool isNoData=false;
  int offset = 0;
  List anySelected = ["ANYTIME"];
  List passValue = [];

  @override
  void initState() {
    anySelected.addAll(selectedProductTiming);
    print(selectedProductTiming);
    passValue = selectedProductTiming.isEmpty ? selectedProductTiming : anySelected;
    print(passValue);
    // print(widget.productTIming);
    super.initState();
    fetchData(paraOffset: offset, pTiming: '');
    handleNext();
  }

  @override
  void dispose() {
    fetchData(paraOffset: offset, pTiming: '');
    handleNext();
    super.dispose();
  }

  Future fetchData({paraOffset, pTiming}) async {
    try{ 
    setState(() {
     // loading = true;
      isNoData == true ? loading = false : loading = true;
    });
    print(sortBy);

    var response = await http.post(
        Uri.parse(
            "${ApiDomain.apiInventory}/itrustinventory/inventory/mobile/search"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer $cToken',
        },
        body: jsonEncode(<String, dynamic>{
          "productTiming": passValue,
          "natureofProduct": vegOrNonveg,
          "healthTag": healthTags,
          "menuTag": selectedCuisineList,
          // "productTiming": [pTiming],
          "productPrice": sortBy,
          "latitude": latFoodigy,
          "longitude": longFoodigy,
            "radius":60,
          //   "longitude": 80.21842,
          // "latitude": 12.97145,
          "limit": 10,

          "offset": paraOffset,
          "searchDate": passDate,
          // "searchDate": "2022-07-25T03:44:57.055Z",
          "tenantId": 1,
          "invType": "product",
          "timeZone": "Asia/Calcutta"
        }));
    print(response.statusCode);
    print(cToken);
    print(response.body);
     if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        ItemAvailableSearchFoodModel modelClass =
            ItemAvailableSearchFoodModel.fromJson(json.decode(response.body));
        print(modelClass.data!.length);
        result = result! + modelClass.data!;
        if (result!.isEmpty) {
          print('result is null');
          setState(() {
            loading = false;
              isNoData=true;
            print('loading false');
          });
        } else {
          int localOffset = offset + 10;
          setState(() {
            result;
            //loading = false;
            offset = localOffset;
             Timer(const Duration(seconds: 2), () {
            setState(() {
             
                loading = false;
                isNoData = true;
                print('no data true');
              });
            });
            print(offset);
            print(result);
          });
        }
      } else {
        result = result! + [];
        print('no data');
        setState(() {
          loading = false;
        });
      }
    }catch(e){
      print(e);
    }finally{
    }
  }

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        fetchData(paraOffset: offset, pTiming: '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   ////  var df =  DateFormat("h:mma");
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: FutureBuilder(
          //  future:fetchData(paraOffset: offset, pTiming: widget.productTIming),
          builder: (context, snapshot) {
        return Expanded(
          child: ListView.builder(
              controller: scrollController,
              itemCount: result!.length + 1,
              itemBuilder: (context, index) {
                if (index == result!.length) {
                 if (loading == true) {
                          return SizedBox(
                            height: 200,
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                color: firstColor,
                              ),
                            ),
                          );
                        } else if (result!.isEmpty) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                "Food is not available at this location",
                                style: FoodigyTextStyle.homeHeadLine,
                              ),
                            ),
                          );
                        }else if(isNoData==true){
                          return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Yay! You have seen it all",
                                      // "Item is not available",
                                      style: FoodigyTextStyle.homeHeadLine,
                                    ),
                                  ),
                                );
                        }
                         else {
                          return isNoData
                              ? SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Yay! You have seen it all",
                                      // "Item is not available",
                                      style: FoodigyTextStyle.homeHeadLine,
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Item is not available",
                                      style: FoodigyTextStyle.homeHeadLine,
                                    ),
                                  ),
                                );
                        }
                }
                return result![index].productStatus == false
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 215,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade100,
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
                                    ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        Colors.grey.shade100,
                                        BlendMode.saturation,
                                      ),
                                      child: Container(
                                          height: 140,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey.shade400,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      result![index]
                                                          .productSlug
                                                          .toString()),
                                                  fit: BoxFit.cover))),
                                    ),
                                    result![index].productAverageRating == null
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
                                                            color:
                                                                Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text(
                                                            result![index]
                                                                .productAverageRating
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                              ],
                                            ),
                                          )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
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
                                            Text(
                                              result![index]
                                                  .productTitle
                                                  .toString(),
                                              style: FoodigyTextStyle
                                                  .itemAvialableDisableTitleStyle,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          '$iRubee ${result![index].productCost.toString()}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black)),
                                                  TextSpan(
                                                      text: '',
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
                                          "By ${result![index].profileName.toString()}",
                                          style: FoodigyTextStyle
                                              .smallGreyTextStyle,
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            result![index]
                                                        .orderCutOffTime
                                                        .toString() ==
                                                    ""
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Text(
                                                        'Order before: ',
                                                        style: FoodigyTextStyle
                                                            .smallGreyTextStyle,
                                                      ),
                                                      Text(
                                                        result![index].orderCutOffTime.toString(),
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.red,
                                                          fontFamily: 'Poppins',
                                                        )),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                            result![index]
                                                        .productAvailableTime
                                                        .toString() ==
                                                    ""
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Text(
                                                        "Delivery Available from: ${result![index].productAvailableTime.toString()}",
                                                        // ${DateFormat('HH:mm').format(df.parse('13:45PM'))}",
                                                        
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
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15),
                        child: InkWell(
                          onTap: () {
                            Get.to(ItemAvaliableViewScreen(
                              result: result,
                              index: index,
                              pName: result![index].profileName.toString(),
                              pDescription:
                                  result![index].profileDescription.toString(),
                              pCurrency:
                                  result![index].prefferedCurrency.toString(),
                              pImage: result![index].profileImage.toString(),
                              userId: result![index].userId,
                              invenId: result![index].inventoryId,
                              invType: result![index].invType.toString(),
                              address: result![index].address.toString(),
                              city: result![index].city.toString(),
                              proTitle: result![index].productTitle.toString(),
                              proDes:
                                  result![index].productDescription.toString(),
                              proSlug: result![index].productSlug.toString(),
                              proCost: result![index].productCost.toString(),
                              naturalPro:
                                  result![index].natureofProduct.toString(),
                              proTiming:
                                  result![index].productTiming.toString(),
                              proId: result![index].productId.toString(),
                              menuTag: result![index].menuTag.toString(),
                              healthTag: result![index].healthTag,
                              customization:
                                  result![index].availableCustomization!.custom,
                              proAvgRat: result![index]
                                  .productAverageRating
                                  .toString(),
                              proRatCoun:
                                  result![index].productRatingCount.toString(),
                              fssaiNo: result![index].fssaiNo.toString(),
                              prounit: result![index].productUnits.toString(),
                              proAvaiTime: result![index]
                                  .productAvailableTime
                                  .toString(),
                              orCutOffTime:
                                  result![index].orderCutOffTime.toString(),
                            ));
                          },
                          child: Container(
                            // height: 215,
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
                                                    result![index]
                                                        .productSlug
                                                        .toString()),
                                                fit: BoxFit.cover))),
                                    result![index].productAverageRating == null
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
                                                            color:
                                                                Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text(
                                                            result![index]
                                                                .productAverageRating
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                              ],
                                            ),
                                          )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
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
                                            Text(
                                              result![index]
                                                  .productTitle
                                                  .toString(),
                                              style: FoodigyTextStyle
                                                  .itemAvialableTitleStyle,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          '$iRubee ${result![index].productCost.toString()}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black)),
                                                  TextSpan(
                                                      text: '',
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
                                          "By ${result![index].profileName.toString()}",
                                          style:
                                              FoodigyTextStyle.smallTextStyle,
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            result![index]
                                                        .orderCutOffTime
                                                        .toString() ==
                                                    ""
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Text(
                                                        'Order before: ',
                                                        style: FoodigyTextStyle
                                                            .smallTextStyle,
                                                      ),
                                                      Text(
                                                        result![index].orderCutOffTime.toString(),
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.red,
                                                          fontFamily: 'Poppins',
                                                        )),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                            result![index]
                                                        .productAvailableTime
                                                        .toString() ==
                                                    ""
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Text(
                                                        "Delivery Available from: ",
                                                        style: FoodigyTextStyle
                                                            .smallTextStyle,
                                                      ),
                                                      Text(" ${result![index].productAvailableTime.toString()}",
                                                      //  " ${DateFormat('HH:mm').format(DateFormat.jm().parse(result![index].productAvailableTime.toString()))}",
                                                       // result![index].productAvailableTime.toString(),
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: firstColor,
                                                          fontFamily: 'Poppins',
                                                        )),
                                                    ],
                                                  )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
              }),
        );
      }),
    );
  }
}
