// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:foodigy/controller/user_contoller/current_user_all_details_controller.dart';
import 'package:foodigy/controller/user_contoller/current_user_details.dart';
import 'package:foodigy/presentation/cart_screens.dart/cart_home_screen.dart';
import 'package:foodigy/presentation/home_screens/profile_screen.dart';
import 'package:foodigy/presentation/home_screens/home_page.dart';
import 'package:foodigy/presentation/home_screens/notification_screen.dart';
import 'package:foodigy/presentation/home_screens/search_screens/home_search_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed

  CurrentUserAllDetailsController curent =
      Get.put(CurrentUserAllDetailsController());
  CurrentUserDetails currentUserControler = Get.put(CurrentUserDetails());

  @override
  void initState() {
    curent.getRecent();
    currentUserControler.getRecent();

    super.initState();
  }

  int currentTab = 0; // to keep track of active tab index
  List<Widget> screens = [
    HomePage(),
    CartHomeScreen(),

    NotificationScreen(),
    ProfileScreen(),

    //CartScreen()
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Exit App',
              style: FoodigyTextStyle.homeHeadLine,
            ),
            content: Text(
              'Do you want to exit the App?',
              style: FoodigyTextStyle.addTocartStyle,
            ),
            actions: [
              
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                child: Text('Yes', style: FoodigyTextStyle.addressTextStyle,),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                child: Text('No',style: FoodigyTextStyle.addressTextStyle),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
  // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: PageStorage(
          // ignore: sort_child_properties_last
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: firstColor,
          child: Icon(Icons.search),
          onPressed: () {
         // Get.to(GoogleSignUpScreen());
            Get.to(HomeSearchScreen(
              uId: currentUserControler.currentUser == null
                  ? ''
                  : currentUserControler.currentUser!.data!.id.toString(),
            ));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen =
                                HomePage(); // if user taps on this dashboard tab will be active
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.homeVariantOutline,
                              color: currentTab == 0 ? firstColor : Colors.grey,
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                color:
                                    currentTab == 0 ? firstColor : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen =
                                CartHomeScreen(); // if user taps on this dashboard tab will be active
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.cartOutline,
                              color: currentTab == 1 ? firstColor : Colors.grey,
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                color:
                                    currentTab == 1 ? firstColor : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  // Right Tab bar icons

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen =
                                NotificationScreen(); // if user taps on this dashboard tab will be active
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.bellOutline,
                              color: currentTab == 2 ? firstColor : Colors.grey,
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                color:
                                    currentTab == 2 ? firstColor : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen =
                                ProfileScreen(); // if user taps on this dashboard tab will be active
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.accountOutline,
                              color: currentTab == 3 ? firstColor : Colors.grey,
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                color:
                                    currentTab == 3 ? firstColor : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
