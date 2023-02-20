// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:foodigy/presentation/home_screens/home_screens/item_available_product/item_available_disable_product.dart';
import 'package:foodigy/presentation/home_screens/home_screens/item_available_product/item_available_product_enable.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/widgets/bottom_filter_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:foodigy/model/item_available_search_model.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeSearchPagination extends StatefulWidget {
  final String? uId;
  final String? search;
  const HomeSearchPagination({super.key, this.uId, this.search});

  @override
  State<HomeSearchPagination> createState() => _HomeSearchPaginationState();
}

class _HomeSearchPaginationState extends State<HomeSearchPagination> {
  TextEditingController search = TextEditingController();
  GlobalKey<ScaffoldState> key = GlobalKey();
  List<Datum>? result = [];

  ScrollController scrollController = ScrollController();
  bool loading = true;
  bool isNoData = false;
  int offset = 0;
  List anySelected = ["ANYTIME"];
  List passValue = [];

  @override
  void initState() {
    anySelected.addAll(selectedProductTiming);

    print(selectedProductTiming);
    passValue =
        selectedProductTiming.isEmpty ? selectedProductTiming : anySelected;
    super.initState();
    // selectedProductTiming.isEmpty
    //     ? selectedProductTiming
    //     : selectedProductTiming.add("ANYTIME");
    fetchData(paraOffset: offset, value: widget.search);
    handleNext();
  }

  ItemAvailableSearchFoodModel? modelClass;

  Future fetchData({
    paraOffset,
    String? value,
  }) async {
    try {
      setState(() {
        isNoData == true ? loading = false : loading = true;
      });
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
            "text": value,
            "productPrice": sortBy,
            "latitude": latFoodigy,
            "limit": 10,
            "longitude": longFoodigy,
            "radius": 60,
            "offset": paraOffset,
            "searchDate": passDate,
            "tenantId": 1,
            "invType": "product",
            "timeZone": "Asia/Calcutta"
          }));
      print(response.statusCode);
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
           
            Timer( Duration(seconds: 2), (){
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
          // isNoData=true;
        });
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        //  loading = true;
        print('value is $value');
      });
    }

    // print(sortBy);
  }

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        fetchData(
          paraOffset: offset,
        );
      }
    });
  }

  @override
  void dispose() {
    result!.clear();
    search.removeListener(() {});
    super.dispose();
  }

  Future<dynamic> foodigyFilter(BuildContext context, bool isSearch) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FilterBottom(
          searchName: widget.search,
          isSearch: false,
          afterSearch: true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            elevation: search.text.isEmpty ? 2 : 0,
            iconTheme: IconThemeData(
              color: Colors.white, // <-- SEE HERE
            ),
            //  flexibleSpace: SizedBox(height: 30),
            toolbarHeight: 120,
            backgroundColor: firstColor,
            automaticallyImplyLeading: search.text.isEmpty ? true : false,
            title: Text(widget.search.toString() == "null"
                ? ""
                : widget.search.toString()),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // color: Colors.grey,
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 10,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     BottomSheetService().aloSortSheet(context,true);
                  //     //     aloSortSheet(context);
                  //   },
                  //   child: Container(
                  //     color: Colors.white,
                  //     width: MediaQuery.of(context).size.width / 2.2,
                  //     height: 52,
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Icon(
                  //             MdiIcons.sort,
                  //             size: 18,
                  //             color: firstColor,
                  //           ),
                  //           SizedBox(
                  //             width: 8,
                  //           ),
                  //           Text(
                  //             'Sort',
                  //             style: FoodigyTextStyle.addressTextStyle,
                  //           )
                  //         ]),
                  //   ),
                  // ),
                  // RotatedBox(
                  //   quarterTurns: 1,
                  //   child: Divider(
                  //     color: Colors.grey,
                  //     thickness: 1,
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      foodigyFilter(context, true);
                      //   foodigyFilter(context);
                    },
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width / 3,
                      height: 52,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.tuneVariant,
                              size: 18,
                              color: firstColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Filter',
                              style: FoodigyTextStyle.addressTextStyle,
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            FutureBuilder(
                // future: fetchData(),
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
                          ? ItemAvailableProductDisable(
                              index: index,
                              result: result,
                            )
                          : ItemAvailableNowProductDetails(
                              index: index,
                              result: result,
                            );
                    }),
              );
            }),
          ],
        ));
  }
}
