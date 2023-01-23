// ignore_for_file: avoid_print

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/chef_details_controller.dart';
import 'package:foodigy/customizations/bottom_calendar.dart';
import 'package:foodigy/model/chef_details_model.dart';
import 'package:foodigy/presentation/chef_screens/chef_food_details_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/bottom_filter_screen.dart';
import 'package:foodigy/widgets/custom_rating_bar_foodigy.dart';
import 'package:foodigy/widgets/custom_switch_button.dart';
import 'package:get/get.dart';


class ChefMenu extends StatefulWidget {
  final String? chefId, uId;
  const ChefMenu({Key? key, this.chefId, this.uId}) : super(key: key);

  @override
  State<ChefMenu> createState() => _ChefMenuState();
}

class FilterFoodList {
  String label;
  Color color;
  bool isSelected;
  FilterFoodList(this.label, this.color, this.isSelected);
}

class _ChefMenuState extends State<ChefMenu> {
  List selecedFood = [];
  List nProduct = [];
  bool valueOne = false;
  bool valueTwo = false;
  bool valueThree = false;
  List<FilterFoodList> foodList = [
    FilterFoodList("South indian", Colors.white, false),
    FilterFoodList("North indian", Colors.white, false),
    FilterFoodList("Chettinad", Colors.white, false),
    FilterFoodList("Kerala", Colors.white, false),
  ];
  ChefDetailsControllerList chefDetailsController =
      Get.put(ChefDetailsControllerList());

  @override
  void initState() {
    chefDetailsController.chefDetails(
        chefId: widget.chefId.toString(),
        menuTag: selecedFood,
        nProduct: nProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: chefDetailsController.chefDetails(
            chefId: widget.chefId.toString(),
            menuTag: selecedFood,
            nProduct: nProduct),
        builder: (context, snapshot) {
          return Obx(() {
            if (chefDetailsController.isDataLoading.value == true) {
              return Center(
                child: CircularProgressIndicator(
                  color: firstColor,
                ),
              );
            }
            else if(chefDetailsController.chefDetailsList!.data!.isEmpty){
              return Center(child: Text('This chef is not available at this location', style: FoodigyTextStyle.homeHeadLine,),);
            }
            else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: techChips()),
                          ),
                          // Positioned(
                          //     right: 2,
                          //     child: InkWell(
                          //       onTap: () {
                          //         foodigyFilter(context);
                          //         //  foodigyFilter(context);
                          //       },
                          //       child: Container(
                          //         color: Colors.white,
                          //         width: MediaQuery.of(context).size.width / 3,
                          //         height: 52,
                          //         child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.center,
                          //             children: [
                          //               Icon(
                          //                 MdiIcons.tuneVariant,
                          //                 size: 18,
                          //                 color: firstColor,
                          //               ),
                          //               SizedBox(
                          //                 width: 8,
                          //               ),
                          //               Text(
                          //                 'Filter',
                          //                 style:
                          //                     FoodigyTextStyle.addressTextStyle,
                          //               )
                          //             ]),
                          //       ),
                          //     ))
                        ],
                      ),
                      // Container(
                      //   height: 60,
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.grey.shade400),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: InkWell(
                      //     onTap: () {
                      //       foodigyBottomSheet(context);
                      //       //  Get.to(TableBasicsExample());
                      //     },
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Column(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: const [
                      //               Text(
                      //                 'Delivery Day',
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontFamily: 'Poppins',
                      //                     fontSize: 13,
                      //                     fontWeight: FontWeight.w500),
                      //               ),
                      //               Text(
                      //                 'Choose exact delivry time to checkout',
                      //                 style: TextStyle(
                      //                     color: Colors.grey,
                      //                     fontFamily: 'Poppins',
                      //                     fontSize: 10,
                      //                     fontWeight: FontWeight.w400),
                      //               )
                      //             ],
                      //           ),
                      //           Icon(
                      //             MdiIcons.creditCardClockOutline,
                      //             color: Colors.grey.shade400,
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              SwitchButton(
                                scale: 1,
                                value: valueOne,
                                onChanged: (value) => setState(() {
                                  this.valueOne = value;
                                  // print(valueOne == false ? '' : 'veg');
                                  if (valueOne == true) {
                                    nProduct.add('veg');
                                    chefDetailsController.chefDetails(
                                        chefId: widget.chefId.toString(),
                                        menuTag: selecedFood,
                                        nProduct: nProduct);
                                  } else {
                                    nProduct.removeWhere(
                                        (element) => element == 'veg');
                                    chefDetailsController.chefDetails(
                                        chefId: widget.chefId.toString(),
                                        menuTag: selecedFood,
                                        nProduct: nProduct);
                                  }
                                  print(nProduct);
                                }),
                              ),
                              Text('Veg',
                                  style: FoodigyTextStyle.addTocartStyle)
                            ],
                          ),
                          Row(
                            children: [
                              SwitchButton(
                                scale: 1,
                                value: valueTwo,
                                onChanged: (valueTwo) => setState(() {
                                  this.valueTwo = valueTwo;

                                  if (valueTwo == true) {
                                    nProduct.add('nonveg');
                                    chefDetailsController.chefDetails(
                                        chefId: widget.chefId.toString(),
                                        menuTag: selecedFood,
                                        nProduct: nProduct);
                                  } else {
                                    nProduct.removeWhere(
                                        (element) => element == 'nonveg');
                                    chefDetailsController.chefDetails(
                                        chefId: widget.chefId.toString(),
                                        menuTag: selecedFood,
                                        nProduct: nProduct);
                                  }
                                  print(nProduct);
                                  //   print(valueTwo);
                                }),
                              ),
                              Text('Non-Veg',
                                  style: FoodigyTextStyle.addTocartStyle)
                            ],
                          ),
                          Row(
                            children: [
                              SwitchButton(
                                scale: 1,
                                value: valueThree,
                                onChanged: (valueThree) => setState(() {
                                  this.valueThree = valueThree;

                                  if (valueTwo == true) {
                                    nProduct.add('eggeterian');
                                    chefDetailsController.chefDetails(
                                        chefId: widget.chefId.toString(),
                                        menuTag: selecedFood,
                                        nProduct: nProduct);
                                  } else {
                                    nProduct.removeWhere(
                                        (element) => element == 'eggeterian');
                                    chefDetailsController.chefDetails(
                                        chefId: widget.chefId.toString(),
                                        menuTag: selecedFood,
                                        nProduct: nProduct);
                                  }
                                  print(nProduct);
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
                      ChefScreenFoods(
                        chefId: widget.chefId.toString(),
                        uId: widget.uId.toString(),
                        chefDetailsList: chefDetailsController.chefDetailsList,
                      )
                    ],
                  ),
                ),
              );
            }
          });
        });
  }

  Future<dynamic> foodigyBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CalendarTable();
      },
    );
  }

  Widget techChips() {
    List<Widget> filterFood = [];
    for (int i = 0; i < foodList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FilterChip(
              // shape: N\,
              disabledColor: Colors.grey,
              showCheckmark: false,
              clipBehavior: Clip.none,
              elevation: 0,
              label: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(foodList[i].label),
              ),
              labelStyle: foodList[i].isSelected == false
                  ? const TextStyle(color: Colors.black, fontSize: 10)
                  : TextStyle(color: Colors.white, fontSize: 10),
              shadowColor: Colors.black,
              backgroundColor: Colors.grey.shade100,
              selectedColor: firstColor,
              selected: foodList[i].isSelected,
              //   shape: const StadiumBorder(side: BorderSide(),),
              onSelected: (bool value) {
                setState(() {
                  foodList[i].isSelected = value;

                  //  print(chipsList[i].label);
                  //print(chipsList[i].isSelected);
                  if (foodList[i].isSelected == true) {
                    selecedFood.add(foodList[i].label);
                    print(selecedFood);
                    chefDetailsController.chefDetails(
                        chefId: widget.chefId.toString(),
                        menuTag: selecedFood,
                        nProduct: nProduct);
                  } else {
                    selecedFood
                        .removeWhere((item) => item == foodList[i].label);
                    chefDetailsController.chefDetails(
                        chefId: widget.chefId.toString(),
                        menuTag: selecedFood,
                        nProduct: nProduct);
                    print(selecedFood);
                  }
                  //     print(_chipsList[i].label);
                  //    print(_chipsList[i].isSelected);
                });
              }

              // onSelected: (bool value) {
              //   setState(() {
              //     foodList[i].isSelected = value;
              //     //     print(_chipsList[i].label);
              //     //    print(_chipsList[i].isSelected);
              //   });
              // },
              ),
        ),
      );
      filterFood.add(item);
    }
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: filterFood,
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
          isChef: true,
        );
      },
    ).then((value) => setState(() {}));
  }
}

class ChefScreenFoods extends StatefulWidget {
  final String? chefId, uId;
  final ChefDetailsModelList? chefDetailsList;
  const ChefScreenFoods({Key? key, this.chefId, this.uId, this.chefDetailsList})
      : super(key: key);

  @override
  State<ChefScreenFoods> createState() => _ChefScreenFoodsState();
}

class _ChefScreenFoodsState extends State<ChefScreenFoods> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  height: 400,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.chefDetailsList == null
            ? 0
            : widget.chefDetailsList!.data!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.8,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0),
        itemBuilder: (BuildContext context, int index) {
          return widget.chefDetailsList!.data![index].productStatus == false
              ? InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade100,
                      boxShadow: [
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
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.grey.shade100,
                            BlendMode.saturation,
                          ),
                          child: Container(
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget
                                      .chefDetailsList!.data![index].productSlug
                                      .toString()),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        widget.chefDetailsList!.data![index]
                                                    .productAverageRating ==
                                                null
                                            ? Container()
                                            :  Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: 
                                               CustomRatingFav(productAverageRating:widget.chefDetailsList!.data![index]
                                                    .productAverageRating.toString() ,)
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "(${widget.chefDetailsList!.data![index].productRatingCount.toString()})",
                                              style: TextStyle(
                                                  color: Colors.black,
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      widget.chefDetailsList!.data![index]
                                          .productTitle
                                          .toString(),
                                      style: FoodigyTextStyle
                                          .itemAvialableDisableTitleStyle,
                                    ),
                                  ),
                                  Text(
                                    "${iRubee.toString()}${widget.chefDetailsList!.data![index].productCost}",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        //  fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Text(
                                widget.chefDetailsList!.data![index]
                                    .productDescription
                                    .toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              widget.chefDetailsList!.data![index]
                                          .productAvailableTime
                                          .toString() ==
                                      ""
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text(
                                          'Order before: ${widget.chefDetailsList!.data![index].productAvailableTime.toString()}',
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontFamily: 'Poppins',
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                              widget.chefDetailsList!.data![index]
                                          .orderCutOffTime ==
                                      ""
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text(
                                          'Deliver Available from: ${widget.chefDetailsList!.data![index].orderCutOffTime}',
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontFamily: 'Poppins',
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    print(widget.chefDetailsList!.data![0].profileName);
                    Get.to(ChefFoodDetailsScreen(
                      chefDetails: widget.chefDetailsList,
                      index: index,
                      uId: widget.uId.toString(),
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
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
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget
                                    .chefDetailsList!.data![index].productSlug
                                    .toString()),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      widget.chefDetailsList!.data![index]
                                                  .productAverageRating ==
                                              null
                                          ? Container():
                                           Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: CustomRatingFav(productAverageRating:widget.chefDetailsList!.data![index]
                                                    .productAverageRating.toString() ,)
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "(${widget.chefDetailsList!.data![index].productRatingCount.toString()})",
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    child: Text(
                                      widget.chefDetailsList!.data![index]
                                          .productTitle
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "${iRubee.toString()}${widget.chefDetailsList!.data![index].productCost}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        //  fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Text(
                                widget.chefDetailsList!.data![index]
                                    .productDescription
                                    .toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              widget.chefDetailsList!.data![index]
                                          .productAvailableTime
                                          .toString() ==
                                      ""
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text(
                                          'Order before: ${widget.chefDetailsList!.data![index].productAvailableTime.toString()}',
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontFamily: 'Poppins',
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                              widget.chefDetailsList!.data![index]
                                          .orderCutOffTime ==
                                      ""
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text(
                                          'Deliver Available from: ${widget.chefDetailsList!.data![index].orderCutOffTime}',
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontFamily: 'Poppins',
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

 

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