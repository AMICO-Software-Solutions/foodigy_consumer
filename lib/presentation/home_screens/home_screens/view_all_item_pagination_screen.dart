// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'package:foodigy/presentation/home_screens/home_screens/item_available_product/item_available_disable_product.dart';
import 'package:foodigy/presentation/home_screens/home_screens/item_available_product/item_available_product_enable.dart';
import 'package:foodigy/presentation/home_screens/home_screens/item_available_view_page_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/bottom_filter_screen.dart';
import 'package:foodigy/widgets/bottom_sort_by_screen.dart';
import 'package:foodigy/widgets/glass_blur.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:foodigy/model/item_available_search_model.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ViewAllItemPaginationScreen extends StatefulWidget {
  final String? productTIming;
  const ViewAllItemPaginationScreen({super.key, this.productTIming});

  @override
  State<ViewAllItemPaginationScreen> createState() =>
      _ViewAllItemPaginationScreenState();
}

class _ViewAllItemPaginationScreenState
    extends State<ViewAllItemPaginationScreen> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  List<Datum>? result = [];

  ScrollController scrollController = ScrollController();
  bool loading = true;
  bool isNoData = false;
  int offset = 0;

  DateTime now = DateTime.now();
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  String? productTime;
  String? one = '';
  String? second = '';
  String? third = '';
  int? valu;

  List anySelected = ["ANYTIME"];
  List passValue = [];

  @override
  void initState() {
    result!.clear();
    anySelected.addAll(selectedProductTiming);

    print(selectedProductTiming);
    passValue =
        selectedProductTiming.isEmpty ? selectedProductTiming : anySelected;
    //       //: selectedProductTiming.insert(0, "ANYTIME";);
    // : selectedProductTiming.add("ANYTIME");
    print(anySelected);
    print(selectedProductTiming);
    print(passValue);

    super.initState();
    fetchData(paraOffset: offset);
    handleNext();
  }

  // @override
  // void dispose() {
  //   fetchData(paraOffset: offset, pTiming: widget.productTIming);
  //   handleNext();
  //   super.dispose();
  // }
  Future fetchData({paraOffset}) async {
    try {
      setState(() {
        isNoData == true ? loading = false : loading = true;
      });
      print(sortBy);

      var response = await http.post(
          Uri.parse(
              "https://itrustinventory-mko4ihns5q-el.a.run.app/api/v1/itrustinventory/inventory/mobile/search"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": 'Bearer $cToken',
          },
          body: jsonEncode(<String, dynamic>{
            // "productTiming": selectedProductTiming,
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        ItemAvailableSearchFoodModel modelClass =
            ItemAvailableSearchFoodModel.fromJson(json.decode(response.body));
        //  print(modelClass.data!.length);
        result = result! + modelClass.data!;
          if(result!.isEmpty){
      setState(() {
          loading = false;
        loading=false;
      });

    }else{
     
    int localOffset = offset + 10;
    setState(() {
      result;
      //loading = false;
      offset = localOffset;
       Timer(const Duration(seconds: 2), () {
      setState(() {
         
            loading = false;
            isNoData = true;
          });
        });
      print(offset);
      print(result);
    });

    }

        // int localOffset = offset + 10;
        // setState(() {
        //   result;
        //   loading = false;
        //   offset = localOffset;
        //   // print(offset);
        //   // print(modelClass.data!.length);
        //   // print(modelClass.data![0]);
        // });
      } else {
        result = result! + [];
        print('no data');
        setState(() {
         
            loading = false;
           // isNoData = true;
         
        });
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        // loading=false;
        //   isNoData =true;
      });
    }
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: firstColor,
          title: Text("")),
      body: Column(
        children: [
          Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                // color: Colors.grey,
                border: Border.symmetric(vertical: BorderSide.none),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    foodigyFilter(context);
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
              //future: fetchData(),
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
      ),
    );
  }

  Future<dynamic> foodigyFilter(BuildContext context) {
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
          isSearch: false,
        );
      },
    ).then((value) => setState(() {}));
  }

  Future<dynamic> aloSortSheet(BuildContext context) {
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
        return BottomSortByScreen(
          isSearch: false,
          onPressed: () {
            groupValue = null;
            Get.back();
            print(groupValue);
          },
        );
      },
    ).then((value) => setState(() {}));
  }
}
