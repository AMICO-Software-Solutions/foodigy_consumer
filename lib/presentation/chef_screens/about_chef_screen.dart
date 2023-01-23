import 'package:flutter/material.dart';
import 'package:foodigy/controller/chef_details_controller.dart';
import 'package:foodigy/model/chef_details_model.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AboutChefScreen extends StatefulWidget {
  final  ChefDetailsModelList? chefDetailsList;
  final int? index;
  final String? chefId, uId;
  const AboutChefScreen({super.key, this.chefId, this.uId, this.chefDetailsList, this.index});

  @override
  State<AboutChefScreen> createState() => _AboutChefScreenState();
}

class _AboutChefScreenState extends State<AboutChefScreen> {
  ChefDetailsControllerList chefDetailsController =
      Get.put(ChefDetailsControllerList());

  // @override
  // void initState() {
  //   chefDetailsController.chefDetails(
  //     chefId: widget.chefId.toString(),
  //   );
  //   print("success");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double spaceHeight = 15;
    return Scaffold(
      body: Obx(() {
        if (chefDetailsController.isDataLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(color: firstColor),
          );
        } else if (chefDetailsController.chefDetailsList== null ) {
          return Center(child: Text(' This chef is not available at this location', style: FoodigyTextStyle.homeHeadLine,),);

        }
        
         else if (chefDetailsController.chefDetailsList!.data!.isEmpty ) {
          return Center(child: Text(' This chef is not available at this location', style: FoodigyTextStyle.homeHeadLine,),);
        } else {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: const [
                //     Icon(
                //       MdiIcons.mapMarkerOutline,
                //       size: 14,
                //       color: Colors.black,
                //     ),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     Text(
                //       'fssaiNo',
                //       style: FoodigyTextStyle.aboutChefTitleStyle,
                //     )
                //   ],
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                
                // SizedBox(
                //   height: spaceHeight,
                // ),
                // Row(
                //   children: const [
                //     Icon(
                //       MdiIcons.phoneInTalkOutline,
                //       size: 14,
                //       color: Colors.black,
                //     ),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     Text(
                //       'Contact',
                //       style: FoodigyTextStyle.aboutChefTitleStyle,
                //     )
                //   ],
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                // Text(
                //   '044-848489',
                //   style: FoodigyTextStyle.aboutChefStyle,
                // ),
                // SizedBox(
                //   height: spaceHeight,
                // ),
                // Row(
                //   children: const [
                //     Icon(
                //       MdiIcons.messageProcessingOutline,
                //       size: 14,
                //       color: Colors.black,
                //     ),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     Text(
                //       "Chef's description",
                //       style: FoodigyTextStyle.aboutChefTitleStyle,
                //     )
                //   ],
                // ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  chefDetailsController
                      .chefDetailsList!.data![0].profileDescription
                      .toString(),
                  textAlign: TextAlign.justify,
                  style: FoodigyTextStyle.aboutChefStyle,
                ),
                SizedBox(
                  height: spaceHeight,
                ),
                // Row(
                //   children: const [
                //     Icon(
                //       MdiIcons.lightbulbOutline,
                //       size: 14,
                //       color: Colors.black,
                //     ),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     Text(
                //       'Recommended Dishes',
                //       style: FoodigyTextStyle.aboutChefTitleStyle,
                //     )
                //   ],
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                // SizedBox(
                //   height: 200,
                //   child: ListView.builder(
                //       itemCount:
                //           chefDetailsController.chefDetailsList!.data!.isEmpty? 0  :chefDetailsController.chefDetailsList!.data!.length ,
                //       itemBuilder: (context, index) {
                //         return Text(
                //           chefDetailsController
                //               .chefDetailsList!.data![index].productTitle
                //               .toString(),
                //           style: FoodigyTextStyle.aboutChefStyle,
                //         );
                //       }),
                // )
              ],
            ),
          );
        }
      }),
    );
  }
}
