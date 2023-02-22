import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/user_contoller/current_user_profie_controller.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/change_password_screen.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/general_screen.dart';
import 'package:foodigy/widgets/profile/account_container.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';
import 'package:get/get.dart';

class MyAccountScreen extends StatefulWidget {
  //final CurrentUserProfileModel? currentProfile;
  //inal bool isLoading;
  const MyAccountScreen(
      {super.key, });

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  CurrentUserProfileController registerController =
      Get.put(CurrentUserProfileController());
  @override
  void initState() {
    registerController.getProfile();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant MyAccountScreen oldWidget) {
    registerController.getProfile();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ProfileAppBar(text: 'My Account'),
        body: Obx(() {
          if (registerController.isDataLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FutureBuilder(
                future: registerController.getProfile(),
                builder: (context, snapshot) {
                  return Column(children: [
                    InkWell(
                      onTap: () {
                        registerController.getProfile();
                        Timer(const Duration(milliseconds: 2), () {
                         Get.off(GeneralScreen(
                          currentProfile: registerController.currentProfile,
                          //isLoading: registerController.isLoading,
                        ));
                        });
                        // Timer(Duration(microseconds: 2)(),{
                        //   
                        // })
                      },
                      child: AccountContainer(
                        isNext: true,
                        text: "General",
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                      thickness: 2,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(ChangePasswordScreen());
                        },
                        child: AccountContainer(
                          isNext: true,
                          text: "Change Password",
                        )),
                    Divider(
                      color: Colors.grey.shade200,
                      thickness: 2,
                    ),
                  ]);
                });
          }
        }));
  }
}
