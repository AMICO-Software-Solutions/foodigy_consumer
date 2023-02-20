import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodigy/presentation/home_screens/search_screens/filter_enable_screen.dart';
import 'package:foodigy/presentation/home_screens/search_screens/home_search_pagination.dart';
import 'package:foodigy/presentation/home_screens/search_screens/search_chef_screen.dart';
import 'package:foodigy/service/bottom_sheet_services.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Tech {
  String label;
  Color color;
  bool isSelected;
  Tech(this.label, this.color, this.isSelected);
}

class HomeSearchScreen extends StatefulWidget {
  final String? uId;
  const HomeSearchScreen({super.key, this.uId});

  @override
  State<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  TextEditingController search = TextEditingController();
  bool selected = false;


  @override
  void dispose() {
    search.removeListener(() {});
    super.dispose();
  }

  bool isSearch = false;
  List data = [];

  // List filterData = ['South indian', 'North indian', 'Chettinad', 'Kerala'];
  // String filterMenu = '';

  // Future<String> getFoods(String value, String? menu) async {
  //   Map<String, dynamic> searchFoods = {};
  //   isSearch = true;
  //   var response = await http.post(
  //       Uri.parse(
  //           "${ApiDomain.apiInventory}/itrustinventory/inventory/mobile/search"),
  //       headers: {
  //         "content-type": "application/json; charset=utf-8",
  //         "Authorization": 'Bearer $cToken',
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         "menuTag": menu,
  //         "text": value.toString(),
  //         "invType": "product",
  //         "latitude": 12.8812,
  //         "limit": 100,
  //         "longitude": 80.23119,
  //         "offset": 0,
  //         "searchDate": "2022-07-28T07:29:43.366Z",
  //         "tenantId": 1,
  //         "timeZone": "Asia/Calcutta"
  //       }));
  //   print(response.statusCode);

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     // print(response.body);
  //     setState(() {
  //       searchFoods = convert.jsonDecode(response.body);
  //       data = searchFoods["data"];
  //       //  isLoading = false;
  //       print("deatails is $data");
  //     });
  //   }
  //   print(response.body);
  //   return "Success";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
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
            // automaticallyImplyLeading: search.text.isEmpty ? true : false,
            title: SizedBox(
              height: 48,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 35,
                ),
                child: TextFormField(
                  controller: search,
                  // onChanged: (value) => setState(() {
                  //   getFoods(
                  //       value.isNotEmpty ? value[0] + value.substring(1) : value,
                  //       '');
                  // }),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      //fontSize: fontSize,
                      fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          //fontSize: fontSize,
                          fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                      // border: OutlineInputBorder(

                      //   borderRadius: BorderRadius.circular(5),
                      // ),

                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          Get.to(HomeSearchPagination(
                            search: search.text,
                            uId: widget.uId,
                          ));
                        },
                        icon: Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: 'Search for food, chefs, cruisines',
                      helperStyle: FoodigyTextStyle.addressTextStyle),
                ),
              ),
            ),
          ),
        ),
        body:
            //  search.text.isEmpty  ?
            SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        BottomSheetService().foodigyFilter(context, true);
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
              filterMethod()
            ],
          ),
        )
        // : Container(
        //     color: Colors.white,
        //     height: double.infinity,
        //     width: double.infinity,
        //     child: Column(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(left: 1, right: 1),
        //           child: SizedBox(
        //             height: 50,
        //             width: double.infinity,
        //             child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Container(
        //                     height: 35,
        //                     width: 90,
        //                     decoration: BoxDecoration(
        //                       border: Border.all(
        //                         color: Colors.grey,
        //                       ),
        //                       borderRadius: BorderRadius.circular(20),
        //                     ),
        //                     child: Padding(
        //                       padding: const EdgeInsets.all(8.0),
        //                       child: Row(
        //                         children: [
        //                           SizedBox(
        //                             width: 5,
        //                           ),
        //                           Text(
        //                             "Sort by",
        //                             style: TextStyle(
        //                                 fontWeight: FontWeight.w500,
        //                                 fontSize: 11,
        //                                 fontFamily: 'Popins'),
        //                           ),
        //                           SizedBox(
        //                             width: 5,
        //                           ),
        //                           Icon(
        //                             MdiIcons.chevronDown,
        //                             color: Colors.grey.shade500,
        //                           )
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     width: 5,
        //                   ),
        //                   SizedBox(
        //                     width: MediaQuery.of(context).size.width / 1.5,
        //                     height: 35,
        //                     child: ListView.separated(
        //                       itemCount: filterData.length,
        //                       scrollDirection: Axis.horizontal,
        //                       itemBuilder: (context, index) {
        //                         return InkWell(
        //                           onTap: () {
        //                             print(filterData[index]);
        //                             getFoods(search.text, filterData[index]);
        //                             filterMenu = filterData[index];
        //                           },
        //                           child: Container(
        //                             height: 40,
        //                             width: 90,
        //                             decoration: BoxDecoration(
        //                               color: filterData[index] == filterMenu
        //                                   ? firstColor
        //                                   : Colors.white,
        //                               border: Border.all(
        //                                 color: Colors.grey,
        //                               ),
        //                               borderRadius: BorderRadius.circular(20),
        //                             ),
        //                             child: Center(
        //                                 child: Text(
        //                               filterData[index],
        //                               style: TextStyle(
        //                                   color:
        //                                       filterData[index] == filterMenu
        //                                           ? Colors.white
        //                                           : Colors.black,
        //                                   fontWeight: FontWeight.w500,
        //                                   fontSize: 11,
        //                                   fontFamily: 'Popins'),
        //                             )),
        //                           ),
        //                         );
        //                       },
        //                       separatorBuilder: (context, index) {
        //                         return SizedBox(
        //                           width: 2,
        //                         );
        //                       },
        //                     ),
        //                   )
        //                 ]),
        //           ),
        //         ),
        //         Divider(
        //           color: Colors.grey.shade300,
        //           thickness: 2,
        //         ),
        //         Expanded(child: FutureBuilder(
        //             //  future: getFoods(''),
        //             builder: (context, snapshot) {
        //           return ListView.builder(
        //               itemCount: data.isEmpty ? 0 : data.length,
        //               itemBuilder: (context, index) {
        //                 return Padding(
        //                   padding: const EdgeInsets.only(
        //                       left: 15, right: 15, bottom: 15),
        //                   child: Container(
        //                     height: 215,
        //                     width: double.infinity,
        //                     decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(10),
        //                         color: Colors.white,
        //                         boxShadow: [
        //                           BoxShadow(
        //                             offset: Offset(0.5, 2),
        //                             blurRadius: 4,
        //                             color: Colors.grey.shade500,
        //                           ),
        //                         ]),
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Stack(
        //                           children: [
        //                             Container(
        //                                 height: 140,
        //                                 width: double.infinity,
        //                                 decoration: BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(10),
        //                                     color: Colors.grey.shade400,
        //                                     image: DecorationImage(
        //                                         image: NetworkImage(
        //                                             data[index]
        //                                                 ['productSlug']),
        //                                         fit: BoxFit.cover))),
        //                             Padding(
        //                               padding: const EdgeInsets.all(10.0),
        //                               child: Row(
        //                                 children: [
        //                                   frostedEdged(
        //                                     Container(
        //                                       height: 20,
        //                                       color: Colors.white
        //                                           .withOpacity(0.3),
        //                                       width: 50,
        //                                       child: Padding(
        //                                         padding:
        //                                             const EdgeInsets.all(2.0),
        //                                         child: Row(
        //                                           children: [
        //                                             Icon(
        //                                               Icons.star,
        //                                               color: Colors.yellow,
        //                                               size: 15,
        //                                             ),
        //                                             SizedBox(
        //                                               width: 2,
        //                                             ),
        //                                             Text(
        //                                               data[index][
        //                                                       'productAverageRating'] ??
        //                                                   '',
        //                                               style: TextStyle(
        //                                                   color: Colors.white,
        //                                                   fontWeight:
        //                                                       FontWeight
        //                                                           .bold),
        //                                             )
        //                                           ],
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   SizedBox(
        //                                     width: 5,
        //                                   ),
        //                                   frostedEdged(
        //                                     Container(
        //                                       height: 20,
        //                                       color: Colors.white
        //                                           .withOpacity(0.3),
        //                                       width: 70,
        //                                       child: Row(
        //                                           mainAxisAlignment:
        //                                               MainAxisAlignment
        //                                                   .center,
        //                                           crossAxisAlignment:
        //                                               CrossAxisAlignment
        //                                                   .center,
        //                                           children: const [
        //                                             Text(
        //                                               "Available 3",
        //                                               style: TextStyle(
        //                                                   color: Colors.white,
        //                                                   fontFamily:
        //                                                       'Poppins',
        //                                                   fontSize: 11,
        //                                                   fontWeight:
        //                                                       FontWeight
        //                                                           .bold),
        //                                             )
        //                                           ]),
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                         SizedBox(
        //                           height: 5,
        //                         ),
        //                         Container(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: SizedBox(
        //                               //  height: ,
        //                               width: double.infinity,
        //                               child: Column(
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.spaceBetween,
        //                                 children: [
        //                                   Row(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment
        //                                             .spaceBetween,
        //                                     children: [
        //                                       Text(data[index]
        //                                           ['productTitle']),
        //                                       RichText(
        //                                         text: TextSpan(
        //                                           style: TextStyle(
        //                                               color: Colors.black,
        //                                               fontSize: 12),
        //                                           children: [
        //                                             TextSpan(
        //                                                 text:
        //                                                     '\u{20B9}${data[index]["productCost"]} ',
        //                                                 style: TextStyle(
        //                                                     fontSize: 12,
        //                                                     color: Colors
        //                                                         .black)),
        //                                             TextSpan(
        //                                                 text: '/Per Person ',
        //                                                 style: TextStyle(
        //                                                     fontSize: 7,
        //                                                     color: Colors.grey
        //                                                         .shade500,
        //                                                     fontFamily:
        //                                                         'Poppins')),
        //                                           ],
        //                                         ),
        //                                       )
        //                                     ],
        //                                   ),
        //                                   SizedBox(
        //                                     height: 2,
        //                                   ),
        //                                   Text(
        //                                     "By ${data[index]['profileName']}",
        //                                     style: FoodigyTextStyle
        //                                         .smallGreyTextStyle,
        //                                   ),
        //                                   SizedBox(
        //                                     height: 2,
        //                                   ),
        //                                   Row(
        //                                     children: [
        //                                       Row(
        //                                         children: [
        //                                           Icon(
        //                                             MdiIcons.alarm,
        //                                             size: 12,
        //                                             color: Colors.red,
        //                                           ),
        //                                           Text(
        //                                             'Order before: ${data[index]["productAvailableTime"]}',
        //                                             style: FoodigyTextStyle
        //                                                 .smallGreyTextStyle,
        //                                           ),
        //                                         ],
        //                                       ),
        //                                       SizedBox(
        //                                         width: 10,
        //                                       ),
        //                                       Row(
        //                                         children: [
        //                                           Icon(
        //                                             MdiIcons.motorbike,
        //                                             size: 12,
        //                                             color: Colors.red,
        //                                           ),
        //                                           Text(
        //                                             "Deliver Available from: ${data[index]["orderCutOffTime"]}",
        //                                             style: FoodigyTextStyle
        //                                                 .smallGreyTextStyle,
        //                                           )
        //                                         ],
        //                                       )
        //                                     ],
        //                                   )
        //                                 ],
        //                               ),
        //                             ),
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 );
        //               });
        //         }))
        //       ],
        //     ),
        //   ),
        );
  }

  Widget filterMethod() {
    if (
    selectedProductTiming.isEmpty &&
        vegOrNonveg.isEmpty &&
        healthTags.isEmpty &&
        selectedCuisineList.isEmpty) {
      return nonOfFilter();
    } else {
      return FilterEnableScreen();
    }
  }

  Column nonOfFilter() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          height: 180,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Popular Chefs',
                  style: FoodigyTextStyle.subHeadingStyle,
                ),
                SearchChefScreen(
                  uId: widget.uId.toString(),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          // height: 180,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Recent Search',
                style: FoodigyTextStyle.subHeadingStyle,
              ),
              Wrap(
                spacing: 0,
                direction: Axis.horizontal,
                children: techChips(),
              )
            ]),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: FilterChip(
          //elevation: 5,
          label: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              width: 85,
              child: Row(
                children: [
                  // Icon(
                  //   MdiIcons.update,
                  //   size: 12,
                  //   color: chipsList[i].isSelected == false
                  //       ? Colors.grey
                  //       : Colors.white,
                  // ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(chipsList[i].label),
                ],
              ),
            ),
          ),
          labelStyle: chipsList[i].isSelected == false
              ? const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400)
              : TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
          shadowColor: Colors.black,
          showCheckmark: false,
          //   backgroundColor: _chipsList[i].color,
          backgroundColor: Colors.white,
          selectedColor: firstColor,
          selected: chipsList[i].isSelected,
          //   shape: const StadiumBorder(side: BorderSide(),),

          onSelected: (bool value) {
            setState(() {
              chipsList[i].isSelected = value;
              //  print(chipsList[i].label);
              // print(chipsList[i].isSelected);
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Tech> chipsList = [
    Tech("Briyani", Colors.white, false),
    Tech("Juice", Colors.blueGrey, false),
    Tech("Croos", Colors.deepOrange, false),
    Tech("Python", Colors.cyan, false),
    Tech("Go lang", Colors.yellow, false),
    Tech("Python", Colors.cyan, false),
    Tech("Go lang", Colors.yellow, false)
  ];

  Widget frostedEdged(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
        child: child,
      ),
    );
  }
}
