import 'package:declarative_refresh_indicator/declarative_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/user_contoller/current_user_profie_controller.dart';
import 'package:foodigy/controller/user_contoller/log_out_controller.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/contact_us_screen.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/help_screen.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/my_account_screen.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/orders_screen.dart';
import 'package:foodigy/presentation/location_screens/profile_address_screen.dart';
import 'package:foodigy/presentation/sign_in/login_screen.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/profile/account_container.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CurrentUserProfileController registerController =
      Get.put(CurrentUserProfileController());
  ///CartTimerController cartTimer = Get.put(CartTimerController());
  @override
  void initState() {
   // registerController.getProfile();
    //  cartTimer.getMaxTiming();
    //cartTimer.updateItemTimingList();
    super.initState();
         _load();
  }

  var _loading = false;
  var forceShowIndicator = false;
  void _load() async {
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(seconds: 2));
   registerController.getProfile();
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: firstColor,
        // leading: BackButton(color: Colors.white,),
        title: Obx(() {
          if (registerController.isDataLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (registerController.currentProfile == null) {
            return Container();
          } else {
            return Row(            
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(MdiIcons.accountOutline),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      registerController.currentProfile == null
                          ? ""
                          : registerController.currentProfile!.data!.profileName
                              .toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      registerController.currentProfile == null
                          ? ''
                          : registerController
                              .currentProfile!.data!.user!.phoneNumber
                              .toString(),
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ),
              ],
            );
          }
        }),
       
      ),
      body: DeclarativeRefreshIndicator(
        refreshing: _loading || forceShowIndicator,
        onRefresh: _load,
        color: firstColor,
        child: SingleChildScrollView(
              child: Column(
                children: [                
                  Obx(() {
                    if (registerController.isDataLoading.isTrue) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } 
                    else if (registerController.currentProfile != null){
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.to(MyAccountScreen(
                                    // currentProfile: registerController.currentProfile,
                                    // isLoading: registerController.isDataLoading.value,
                                  ));
                                },
                                child: AccountContainer(
                                  isNext: true,
                                  text: 'My Account',
                                  icon: MdiIcons.accountOutline,
                                )),
                            Divider(
                              color: Colors.grey.shade200,
                              thickness: 2,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(ProfileAddressScreen(
                                    profileId: registerController.currentProfile == null
                                        ? ''
                                        : registerController.currentProfile!.data!.id
                                            .toString(),
                                  ));
                                },
                                child: AccountContainer(
                                  isNext: true,
                                  text: 'Addresses',
                                  icon: MdiIcons.mapMarkerOutline,
                                )),
                            Divider(
                              color: Colors.grey.shade200,
                              thickness: 2,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(OrdersScreen());
                                },
                                child: AccountContainer(
                                  isNext: true,
                                  text: 'Orders',
                                  icon: MdiIcons.cart,
                                )),
                            Divider(
                              color: Colors.grey.shade200,
                              thickness: 2,
                            ),
        
                            InkWell(
                                onTap: () {
                                  Get.to(HelpScreen());
                                },
                                child: AccountContainer(
                                  isNext: true,
                                  text: 'Help',
                                  icon: MdiIcons.helpCircleOutline,
                                )),
                            Divider(
                              color: Colors.grey.shade200,
                              thickness: 2,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(ContactUsScreen());
                                },
                                child: AccountContainer(
                                  isNext: true,
                                  text: 'Support',
                                  icon: MdiIcons.phoneInTalkOutline,
                                )),
                            Divider(
                              color: Colors.grey.shade200,
                              thickness: 2,
                            ),
                              InkWell(
                                onTap: () {
                                 // Get.to(ContactUsScreen());
                                },
                                child: AccountContainer(
                                  isNext: true,
                                  text: 'Rate Foodigy',
                                  icon: MdiIcons.star,
                                )),
                            Divider(
                              color: Colors.grey.shade200,
                              thickness: 2,
                            ),
                            InkWell(
                                onTap: () {
                                  LogOutController().logOutSession();
                                  
                               //   Get.offAll(LoginSCreen());
                                },
                                child: AccountContainer(
                                  isNext: false,
                                  text: 'Log Out',
                                  icon: MdiIcons.logout,
                                )),
                            Divider(
                              color: Colors.grey.shade200,
                              thickness: 2,
                            ),
        
                            //  ActiveOrderList()
                          ]);
                    }else  {
                      return 
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(HelpScreen());
                                  },
                                  child: AccountContainer(
                                    isNext: true,
                                    text: 'Help',
                                    icon: MdiIcons.helpCircleOutline,
                                  )),
                              Divider(
                                color: Colors.grey.shade200,
                                thickness: 2,
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.to(ContactUsScreen());
                                  },
                                  child: AccountContainer(
                                    isNext: true,
                                    text: 'Support',
                                    icon: MdiIcons.phoneInTalkOutline,
                                  )),
                              Divider(
                                color: Colors.grey.shade200,
                                thickness: 2,
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.to(LoginSCreen());
                                  },
                                  child: AccountContainer(
                                    isNext: false,
                                    text: 'Login',
                                    icon: MdiIcons.logout,
                                  )),
                              Divider(
                                color: Colors.grey.shade200,
                                thickness: 2,
                              ),
                            
                              //  ActiveOrderList()
                            ]
                      );
                    } 
                  }),
             Container(
                    height: 400,
                  ),
                ],
              ),
            )
         
      ),
    );
  }
}
