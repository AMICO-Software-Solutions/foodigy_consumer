// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/cart_controller/get_cart_list_controller.dart';
import 'package:foodigy/controller/item_available_search_controller.dart';
import 'package:foodigy/controller/update_values_controller.dart';
import 'package:foodigy/controller/user_contoller/current_user_all_details_controller.dart';
import 'package:foodigy/controller/user_contoller/current_user_details.dart';
import 'package:foodigy/customizations/bottom_calendar.dart';
import 'package:foodigy/presentation/home_screens/home_screens/item_available_now.dart';
import 'package:foodigy/presentation/home_screens/home_screens/popular_chefs_details.dart';
import 'package:foodigy/presentation/home_screens/home_screens/popular_view_all.dart';
import 'package:foodigy/presentation/home_screens/search_screens/home_search_screen.dart';
import 'package:foodigy/presentation/location_screens/home_address_screen.dart';
import 'package:foodigy/presentation/on_boarding_screen/on_board_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CurrentUserDetails currentUserControler = Get.put(CurrentUserDetails());
  CurrentUserAllDetailsController curent =
      Get.put(CurrentUserAllDetailsController());
  MainScreenController updateController = Get.put(MainScreenController());
  GetCartDetailsController cartListController =
      Get.put(GetCartDetailsController());
        ItemAvailableSearchController itemAvailableController =
      Get.put(ItemAvailableSearchController());

  @override
  void initState() {
    curent.getRecent();
    cartListController.getCartDetails('');
     itemAvailableController.getItemSearchFood(timing: ["ANYTIME"]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: firstColor,
          onPressed: () {
            selectedAddress = '';
            Get.to(Onbording());
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: () {
            
            //  print("Hiii");
            Get.to(HomeAddressScreen());
          },
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your location',
                    style: TextStyle(
                        color: firstColor, fontFamily: 'Poppins', fontSize: 10),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: Text(
                            selectedAddress.toString() == ""
                                ? add
                                : selectedAddress,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 14)),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
               foodigyBottomSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                //  height:20,
                width: 120,
                child: Row(children: [
                  Icon(
                    MdiIcons.calendarBlankOutline,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    selectDisaplayDate,
                   // selectDate,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontFamily: 'Popins'),
                  ),
                  Icon(
                    MdiIcons.chevronDown,
                    color: Colors.grey,
                  )
                ]),
                //  MainScreen()
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(229, 131, 233, 7)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: const [],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // Text(
                    //   "Let's find good and",
                    //   style: FoodigyTextStyle.homeHeadLine,
                    // ),
                    // Text(
                    //   "Quality food around you",
                    //   style: FoodigyTextStyle.homeHeadLine,
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade100),
                      child: InkWell(
                        onTap: () {
                          // Get.to(HomeSearchPagination(
                          //   uId: currentUserControler.currentUser == null
                          //       ? ''
                          //       : currentUserControler.currentUser!.data!.id
                          //           .toString(),
                          // ));
                          Get.to(HomeSearchScreen(
                            uId: currentUserControler.currentUser == null
                                ? ''
                                : currentUserControler.currentUser!.data!.id
                                    .toString(),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "Search your food",
                              style: FoodigyTextStyle.addressTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                 
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ItemAvailableSearchList(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Chefs",
                      style: FoodigyTextStyle.homeHeadLine,
                    ),
                    TextButton(
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => PopularViewAllChef()));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PopularViewAllChef(
                                        uId: currentUserControler.currentUser ==
                                                null
                                            ? ''
                                            : currentUserControler
                                                .currentUser!.data!.id
                                                .toString(),
                                      )));
                          // Get.off(PopularViewAllChef());
                          // Get.to(PopularViewAllChef(), //next page class
                          //     duration: const Duration(milliseconds: 300), //duration of transitions, default 1 sec
                          //     transition:
                          //         Transition.downToUp //transition effect
                          //     );
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
              PopularChefDetails(
                uId: currentUserControler.currentUser == null
                    ? ''
                    : currentUserControler.currentUser!.data!.id.toString(),
              )
            ],
          ),
        ),
      ),
    );
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
}
