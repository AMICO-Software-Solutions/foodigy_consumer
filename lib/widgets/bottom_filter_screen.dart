// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/cms_controller/health_tag_controller.dart';
import 'package:foodigy/model/local_model/filter_model.dart';
import 'package:foodigy/presentation/chef_screens/chef_page.dart';
import 'package:foodigy/presentation/home_screens/home_screens/view_all_item_pagination_screen.dart';
import 'package:foodigy/presentation/home_screens/search_screens/home_search_pagination.dart';
import 'package:foodigy/presentation/home_screens/search_screens/home_search_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/custom_switch_button.dart';
import 'package:foodigy/widgets/expanded_widget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../controller/cms_controller/item_timing_controller.dart';

class FilterBottom extends StatefulWidget {
  final bool isSearch;
  final bool? isChef;
  final bool? afterSearch;
  final String? searchName;
  const FilterBottom({
    Key? key,
    required this.isSearch,
    this.isChef = false,
    this.afterSearch = false,
    this.searchName,
  }) : super(key: key);

  @override
  State<FilterBottom> createState() => _FilterBottomState();
}

List<String> itemTIming = ['Breakfast', "Lunch", "Dinner", 'Snacks', 'Brunch'];

//List<String> healthTags = ['vega', 'Less than 45 minus'];
// List productTiming = ["ANYTIME"];
String productTiming = '';

class _FilterBottomState extends State<FilterBottom> {
  final HealthTagController healthTag = Get.put(HealthTagController());
  final ItemTimingController itemTag = Get.put(ItemTimingController());
  // @override
  // void initState() {
  //   itemTag.getHealthDetails();
  //   healthTag.getHealthDetails();
  //   super.initState();
  // }
  @override
  void initState() {
    super.initState();
    getItemTiming();
    getAppoint();
  }

  List checkBoxList = [];
  List cusinesList = [];
  //List itemsTimings = [];

  var chefList = [];
  // List productList = [];

  Map<String, dynamic> map = {};
  Future<String> getAppoint() async {
    checkBoxList.clear();
    var responseData = await http.get(
      Uri.parse("https://cms-mko4ihns5q-el.a.run.app/healthtags"),
      headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer ${cmsToken.toString()}',
      },
    );

    if (responseData.statusCode == 200 ||
        responseData.statusCode == 201 ||
        responseData.statusCode == 202) {
      setState(() {
        chefList = convert.jsonDecode(responseData.body);
        print("*************************************");
        // print(responseData.body);
        print(chefList.length);

        for (int i = 0; i <= chefList.length; i++) {
          checkBoxList.add(HealthTagModel(title: chefList[i]['tags']));

          print(chefList[i]['tags']);
        }
      });
    } else {
      print(responseData.body);
    }
    return "success";
  }

  var cuList = [];
  // List productList = [];

  Future<String> getItemTiming() async {
    cusinesList.clear();
    var responseData = await http.get(
      Uri.parse("https://cms-mko4ihns5q-el.a.run.app/menu-tags-v-2-s"),
      headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer ${cmsToken.toString()}',
      },
    );

    if (responseData.statusCode == 200 ||
        responseData.statusCode == 201 ||
        responseData.statusCode == 202) {
      setState(() {
        cuList = convert.jsonDecode(responseData.body);
        print("*************************************");
        // print(responseData.body);
        print(cuList.length);

        for (int i = 0; i <= cuList.length; i++) {
          cusinesList.add(
            CusinesListModel(title: cuList[i]["tagname"]),
          );

          print(cuList[i]["tagname"]);
        }
      });
    } else {
      print(responseData.body);
    }
    return "success";
  }

  bool isStrechedDropDown = false;
  bool isVegNonVeg = false;
  bool isDeliveryTime = false;
  // int? groupValue;
  // int? typeValue;
  // int? timeValue;
  // String title = '';
  // String type = '';
  // String time = '';

  //check box

  final allChecked = HealthTagModel(title: 'all Checked');

  //checkBox health tag
  // final checkBoxList = [
  //   HealthTagModel(title: 'Fiber'),
  //   HealthTagModel(title: 'Low sugar'),
  //   HealthTagModel(title: 'Healthy fat'),
  //   HealthTagModel(title: 'Antioxidants'),
  //   HealthTagModel(title: 'Choline'),
  //   HealthTagModel(title: 'Low carbs'),
  //   HealthTagModel(title: 'Low fat'),
  //   HealthTagModel(title: 'Low salt'),
  // ];

  //cuisines list

  // final cusinesList = [
  //   CusinesListModel(title: 'Continental'),
  //   CusinesListModel(title: 'Chinese'),
  //   CusinesListModel(title: 'Italian'),
  //   CusinesListModel(title: 'North indian'),
  //   CusinesListModel(title: 'South indian'),
  // ];

//items timings list
  final itemsTimings = [
    ProductTimingModel(title: 'Breakfast'),
    ProductTimingModel(title: 'Brunch'),
    ProductTimingModel(title: 'Lunch'),
    ProductTimingModel(title: 'snacks'),
    ProductTimingModel(title: 'Dinner'),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        print('suceess');
              if (widget.isSearch == true) {
                  //  Get.back();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HomeSearchScreen())));
                } else if (widget.isChef == true) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: ((context) => ChefPage())));
                } else if (widget.afterSearch == true) {
                  print(widget.searchName);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HomeSearchPagination(
                                search: widget.searchName,
                              ))));
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ViewAllItemPaginationScreen(
                                productTIming: productTiming,
                              )));
                }
        return true;
      },
      
      child: Container(
        height: MediaQuery.of(context).size.height / 1.4,
        width: double.infinity,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filter",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                             if (widget.isSearch == true) {
                  //  Get.back();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HomeSearchScreen())));
                } else if (widget.isChef == true) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: ((context) => ChefPage())));
                } else if (widget.afterSearch == true) {
                  print(widget.searchName);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HomeSearchPagination(
                                search: widget.searchName,
                              ))));
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ViewAllItemPaginationScreen(
                                productTIming: productTiming,
                              )));
                }
                           // Get.back();
                          },
                          icon: Icon(Icons.close_rounded)),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SwitchButton(
                            scale: 1,
                            value: valueOne,
                            onChanged: (value) => setState(() {
                              valueOne = value;
                              // print(valueOne == false ? '' : 'veg');
                              if (valueOne == true) {
                                vegOrNonveg.add('veg');
                                print(vegOrNonveg);
                              } else {
                                vegOrNonveg
                                    .removeWhere((element) => element == 'veg');
                                print(vegOrNonveg);
                              }
                            }),
                          ),
                          Text('Veg', style: FoodigyTextStyle.addTocartStyle)
                        ],
                      ),
                      Row(
                        children: [
                          SwitchButton(
                            scale: 1,
                            value: valueTwo,
                            onChanged: (value) => setState(() {
                              valueTwo = value;
                              if (valueTwo == true) {
                                vegOrNonveg.add('nonveg');
                              } else {
                                vegOrNonveg.removeWhere(
                                    (element) => element == 'nonveg');
                              }
                              print(vegOrNonveg);
    
                              //   print(valueTwo);
                            }),
                          ),
                          Text('Non-Veg', style: FoodigyTextStyle.addTocartStyle)
                        ],
                      ),
                      Row(
                        children: [
                          SwitchButton(
                            scale: 1,
                            value: valueThree,
                            onChanged: (value) => setState(() {
                              valueThree = value;
    
                              if (valueThree == true) {
                                vegOrNonveg.add('egg');
                              } else {
                                vegOrNonveg
                                    .removeWhere((element) => element == 'egg');
                              }
                              print(vegOrNonveg);
    
                              //   print(valueTwo);
                            }),
                          ),
                          Text(
                            'Eggeterian',
                            style: FoodigyTextStyle.addTocartStyle,
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                      // height: 45,
                      width: 250,
                      padding: EdgeInsets.only(right: 0),
                      constraints: BoxConstraints(
                        minHeight: 45,
                        minWidth: 200,
                      ),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isStrechedDropDown = !isStrechedDropDown;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Menu timings",
                                style: FoodigyTextStyle.aboutChefStyle,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isStrechedDropDown = !isStrechedDropDown;
                                  });
                                },
                                child: Icon(
                                  isStrechedDropDown
                                      ? Icons.expand_less_sharp
                                      : Icons.expand_more_sharp,
                                  size: 30,
                                ))
                          ],
                        ),
                      )),
                  ExpandedSection(
                    expand: isStrechedDropDown,
                    height: 150,
                    child: SizedBox(
                      //  color: Colors.grey,
                      height: 300,
                      child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ...itemsTimings.map(
                              (items) => ListTile(
                                onTap: () => productTimingClicked(items),
                                leading: SizedBox(
                                  child: Checkbox(
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius: BorderRadius.circular(15),
                                    // ),
                                    splashRadius: 0,
                                    activeColor: firstColor,
                                    value: selectedProductTiming
                                        .contains(items.title),
                                    onChanged: (value) {
                                      setState(() {
                                        print(items);
                                        productTimingClicked(items);
                                      });
                                    },
                                  ),
                                ),
                                title: Text(
                                  items.title,
                                  style: FoodigyTextStyle.smallTextStyle,
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  Container(
                      // height: 45,
                      width: 250,
                      padding: EdgeInsets.only(right: 0),
                      constraints: BoxConstraints(
                        minHeight: 45,
                        minWidth: 200,
                      ),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isVegNonVeg = !isVegNonVeg;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Cuisines",
                                style: FoodigyTextStyle.aboutChefStyle,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isVegNonVeg = !isVegNonVeg;
                                  });
                                },
                                child: Icon(
                                  isStrechedDropDown
                                      ? Icons.expand_less_sharp
                                      : Icons.expand_more_sharp,
                                  size: 30,
                                ))
                          ],
                        ),
                      )),
                  ExpandedSection(
                    expand: isVegNonVeg,
                    height: 150,
                    child: SizedBox(
                      //  color: Colors.grey,
                      height: 500,
                      child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            // ListTile(
                            //   onTap: () =>onAllClicked(allChecked),
                            //   leading: Checkbox(
                            //     value: allChecked.value,
                            //     onChanged: (value) {},
                            //   ),
                            //   title: Text(allChecked.title),
                            // ),
                            // Divider(),
                            ...cusinesList.map(
                              (items) => ListTile(
                                onTap: () => cuisinesClicked(items),
                                leading: SizedBox(
                                  child: Checkbox(
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius: BorderRadius.circular(15),
                                    // ),
                                    //  shape: OutlinedBorder(side: BorderSide.),
                                    splashRadius: 0,
                                    activeColor: firstColor,
                                    //  value: true,
                                    value:
                                        selectedCuisineList.contains(items.title),
                                    onChanged: (value) {
                                      //print(healthTags.contains(items));
                                      setState(() {
                                        print(items);
                                        cuisinesClicked(items);
                                      });
                                    },
                                  ),
                                ),
                                title: Text(
                                  items.title,
                                  style: FoodigyTextStyle.smallTextStyle,
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  Container(
                      // height: 45,
                      width: 250,
                      padding: EdgeInsets.only(right: 0),
                      constraints: BoxConstraints(
                        //   maxHeight: 600,
                        maxWidth: 600,
                        minHeight: 45,
                        minWidth: 200,
                      ),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isDeliveryTime = !isDeliveryTime;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Health Options",
                                style: FoodigyTextStyle.aboutChefStyle,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDeliveryTime = !isDeliveryTime;
                                  });
                                },
                                child: Icon(
                                  isStrechedDropDown
                                      ? Icons.expand_less_sharp
                                      : Icons.expand_more_sharp,
                                  size: 30,
                                ))
                          ],
                        ),
                      )),
                  ExpandedSection(
                      expand: isDeliveryTime,
                      height: 1050,
                      child: SizedBox(
                        //  color: Colors.grey,
                        height: 1050,
                        child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              // ListTile(
                              //   onTap: () =>onAllClicked(allChecked),
                              //   leading: Checkbox(
                              //     value: allChecked.value,
                              //     onChanged: (value) {},
                              //   ),
                              //   title: Text(allChecked.title),
                              // ),
                              // Divider(),
                              ...checkBoxList.map(
                                (item) => ListTile(
                                  onTap: () => onAllClicked(item),
                                  leading: SizedBox(
                                    child: Checkbox(
                                      // shape: RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(15),
                                      // ),
                                      //  shape: OutlinedBorder(side: BorderSide.),
                                      splashRadius: 0,
                                      activeColor: firstColor,
                                      value: healthTags.contains(item.title),
                                      onChanged: (value) {
                                        print(healthTags.contains(item));
                                        setState(() {
                                          print(item);
                                          onAllClicked(item);
                                        });
                                      },
                                    ),
                                  ),
                                  title: Text(
                                    item.title,
                                    style: FoodigyTextStyle.smallTextStyle,
                                  ),
                                ),
                              )
                            ]),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                             setState(() {
                                valueOne = false;
                              valueTwo = false;
                              valueThree = false;
                              vegOrNonveg.clear();
                              selectedCuisineList.clear();
                              healthTags.clear();
                              selectedProductTiming.clear();
                            //  selectedProductTiming.add("ANYTIME");
                              productTiming = '';
                              print(selectedProductTiming);
                              print(vegOrNonveg);
                              print(healthTags);
                             });
                              if (widget.isSearch == true) {
                               // Get.off(HomeSearchScreen());
                               
                              } else {
                                // Navigator.pop(context);
                              //  Get.back(result: "Hello world");
                                //  Get.off(ViewAllItemPaginationScreen());
    
                              }
                            },
                            child: Text(
                              'Clear All',
                              style: FoodigyTextStyle.aboutChefStyle,
                            )),
                      ),
                      doneButton(widget.isSearch)
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget doneButton(bool isSearch) {
    if (selectedCuisineList.isNotEmpty ||
        healthTags.isNotEmpty ||
        vegOrNonveg.isNotEmpty ||
        selectedProductTiming.isNotEmpty) {
       
      return SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: ElevatedButton(
            onPressed: () {
              print(vegOrNonveg);
              print(healthTags);
              print(productTiming);

              if (isSearch == true) {
                //  Get.back();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => HomeSearchScreen())));
              } else if (widget.isChef == true) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => ChefPage())));
              } else if (widget.afterSearch == true) {
                print(widget.searchName);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => HomeSearchPagination(
                              search: widget.searchName,
                            ))));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ViewAllItemPaginationScreen(
                              productTIming: productTiming,
                            )));
              }
              // Get.off(ViewAllItemPaginationScreen(
              //   productTIming: productTiming,
              //  ));
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(firstColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            )),
      );
    } else {
      return SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: ElevatedButton(
            onPressed: () {
              print(vegOrNonveg);
              print(healthTags);
              print(productTiming);

             
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey.shade300),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            )),
      );
    }
  }

  onAllClicked(HealthTagModel obxMdl) {
    setState(() {
      obxMdl.value = !obxMdl.value;
      print(obxMdl.title);
      if (healthTags.contains(obxMdl.title.toString())) {
        healthTags.removeWhere((element) => element == obxMdl.title);
        print(healthTags);
      } else {
        // healthTags.clear();
        healthTags.add(obxMdl.title.toString());

        print(healthTags);
      }
    });
  }

  cuisinesClicked(CusinesListModel cuisineMdl) {
    setState(() {
      cuisineMdl.value = !cuisineMdl.value;
      print(cuisineMdl.title);
      if (selectedCuisineList.contains(cuisineMdl.title.toString())) {
        selectedCuisineList
            .removeWhere((element) => element == cuisineMdl.title);
        print(selectedCuisineList);
      } else {
        // healthTags.clear();
        selectedCuisineList.add(cuisineMdl.title.toString());

        print(selectedCuisineList);
      }
    });
  }

  productTimingClicked(ProductTimingModel pTimgMdl) {
    setState(() {
      pTimgMdl.value = !pTimgMdl.value;
      print(pTimgMdl.title);
      if (selectedProductTiming.contains(pTimgMdl.title.toString())) {
        selectedProductTiming
            .removeWhere((element) => element == pTimgMdl.title);
        print(selectedProductTiming);
      } else {
        // healthTags.clear();
        selectedProductTiming.add(pTimgMdl.title.toString());

        print(selectedProductTiming);
      }
    });
  }
}
