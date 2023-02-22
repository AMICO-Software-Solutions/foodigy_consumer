import 'package:flutter/material.dart';
import 'package:foodigy/controller/user_contoller/current_user_profie_controller.dart';
import 'package:foodigy/model/curent_user_profile_model.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';
import 'package:foodigy/widgets/profile/profile_textForm_field.dart';

class GeneralScreen extends StatefulWidget {
  final CurrentUserProfileModel? currentProfile;
  //final bool isLoading;
  const GeneralScreen(
      {super.key, this.currentProfile, });

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  
  TextEditingController profileName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  void initState() {
   // registerController.getProfile();
    profileName = TextEditingController(
        text: widget.currentProfile == null
            ? ""
            : widget.currentProfile!.data!.profileName);
    email = TextEditingController(
        text: widget.currentProfile == null
            ? ""
            : widget.currentProfile!.data!.user!.email);
    phoneNumber = TextEditingController(
        text: widget.currentProfile == null
            ? ""
            : widget.currentProfile!.data!.user!.phoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(text: 'My Profile'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 7,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Profile name*',
                style: FoodigyTextStyle.addTocartStyle,
              ),

              ProfileTextFormField(
                hintText: '',
                controller: profileName,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Email*',
                style: FoodigyTextStyle.addTocartStyle,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    email.text,
                    style: FoodigyTextStyle.addressTextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Text(
                'Mobile*',
                style: FoodigyTextStyle.addTocartStyle,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    phoneNumber.text,
                    style: FoodigyTextStyle.addressTextStyle,
                  ),
                ),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 1,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'City',
              //             style: FoodigyTextStyle.addTocartStyle,
              //           ),
              //           SizedBox(
              //               width: MediaQuery.of(context).size.width / 2.5,
              //               child: SettingsTextFormField(
              //                 hintText: '',
              //                 controller: city,
              //               )),
              //         ],
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'State',
              //             style: FoodigyTextStyle.addTocartStyle,
              //           ),
              //           SizedBox(
              //               width: MediaQuery.of(context).size.width / 2.5,
              //               child: SettingsTextFormField(
              //                 hintText: '',
              //                 controller: state,
              //               )),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 1,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Country',
              //             style: FoodigyTextStyle.addTocartStyle,
              //           ),
              //           SizedBox(
              //               width: MediaQuery.of(context).size.width / 2.5,
              //               child: SettingsTextFormField(
              //                 hintText: '',
              //                 controller: country,
              //               )),
              //         ],
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Pincode',
              //             style: FoodigyTextStyle.addTocartStyle,
              //           ),
              //           SizedBox(
              //               width: MediaQuery.of(context).size.width / 2.5,
              //               child: SettingsTextFormField(
              //                 hintText: '',
              //                 controller: pincode,
              //               )),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
            ]),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FoodigyButton(
            color: firstColor,
            text: 'update profile',
            onPressed: () {
              CurrentUserProfileController()
                  .updateProfile(profileName: profileName.text);
            }),
      ),
    );
  }
}
