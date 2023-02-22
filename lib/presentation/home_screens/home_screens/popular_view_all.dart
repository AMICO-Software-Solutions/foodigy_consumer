import 'package:flutter/material.dart';
import 'package:foodigy/controller/popular_chef_controller.dart';
import 'package:foodigy/presentation/chef_screens/chef_page.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class PopularViewAllChef extends StatefulWidget {
  final String? uId;
  const PopularViewAllChef({super.key, this.uId});

  @override
  State<PopularViewAllChef> createState() => _PopularViewAllChefState();
}

class _PopularViewAllChefState extends State<PopularViewAllChef> {
  PopularChefController chefDetailsController =
      Get.put(PopularChefController());

  @override
  void initState() {
    chefDetailsController.getPopularChef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          text: 'Popular Chefs',
          backgroundColor: firstColor,
          textColor: Colors.white,
        ),
        body: Obx(() {
          if (chefDetailsController.isDataLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(
                color: firstColor,
              ),
            );
          } else if (chefDetailsController.popularChefList == null) {
            return Center(
              child: Text("Food near your location",
                  style: FoodigyTextStyle.homeHeadLine),
            );
          }
          return ListView.builder(
              itemCount: chefDetailsController
                      .popularChefList!.data!.list!.isEmpty
                  ? 0
                  : chefDetailsController.popularChefList!.data!.list!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: InkWell(
                    onTap: () {
                      Get.to(ChefPage(
                        chefId: chefDetailsController
                            .popularChefList!.data!.list![index].chefid
                            .toString(),
                        uId: widget.uId.toString(),
                        cImage: chefDetailsController
                            .popularChefList!.data!.list![index].chefavatar
                            .toString(),
                        cName: chefDetailsController
                            .popularChefList!.data!.list![index].chefname
                            .toString(),
                      ));
                    },
                    child: Container(
                      // height: 215,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.5, 2),
                              blurRadius: 4,
                              color: Colors.grey.shade500,
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade400,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              chefDetailsController
                                                  .popularChefList!
                                                  .data!
                                                  .list![index].chefavatar
                                                  .toString()),
                                          fit: BoxFit.cover))),
                              // Padding(
                              //           padding: const EdgeInsets.all(10.0),
                              //           child: Row(
                              //             children: [
                              //               GlassBlur(
                              //                 child: Container(
                              //                   height: 20,
                              //                   color: Colors.white
                              //                       .withOpacity(0.3),
                              //                   width: 50,
                              //                   child: Padding(
                              //                     padding:
                              //                         const EdgeInsets.all(2.0),
                              //                     child: Row(
                              //                       children:const [
                              //                         Icon(
                              //                           Icons.star,
                              //                           color: Colors.yellow,
                              //                           size: 15,
                              //                         ),
                              //                         SizedBox(
                              //                           width: 2,
                              //                         ),
                              //                         Text(
                              //                         '',
                              //                           style: TextStyle(
                              //                               color: Colors.white,
                              //                               fontWeight:
                              //                                   FontWeight
                              //                                       .bold),
                              //                         )
                              //                       ],
                              //                     ),
                              //                   ),
                              //                 ),
                              //               ),
                              //               SizedBox(
                              //                 width: 5,
                              //               ),
                              //               // GlassBlur(
                              //               //  child: Container(
                              //               //     height: 20,
                              //               //     color: Colors.white
                              //               //         .withOpacity(0.3),
                              //               //     width: 70,
                              //               //     child: Row(
                              //               //         mainAxisAlignment:
                              //               //             MainAxisAlignment
                              //               //                 .center,
                              //               //         crossAxisAlignment:
                              //               //             CrossAxisAlignment
                              //               //                 .center,
                              //               //         children: const [
                              //               //           Text(
                              //               //             "Available 3",
                              //               //             style: TextStyle(
                              //               //                 color: Colors.white,
                              //               //                 fontFamily:
                              //               //                     'Poppins',
                              //               //                 fontSize: 11,
                              //               //                 fontWeight:
                              //               //                     FontWeight
                              //               //                         .bold),
                              //               //           )
                              //               //         ]),
                              //               //   ),
                              //               // ),
                              //             ],
                              //           ),
                              //         )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              //  height: ,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/chefhat.png"),
                                        width: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                      Text(chefDetailsController
                                          .popularChefList!
                                          .data!
                                          .list![index]
                                          .chefname
                                          .toString(), style: FoodigyTextStyle.itemAvialableTitleStyle,),
                                      // RichText(
                                      //   text: TextSpan(
                                      //     style: TextStyle(
                                      //         color: Colors.black,
                                      //         fontSize: 12),
                                      //     children: [
                                      //       TextSpan(
                                      //           text:
                                      //               '$iRubee ${chefDetailsController.popularChefList!.data!.list![index].itemid}',
                                      //           style: TextStyle(
                                      //               fontSize: 12,
                                      //               color: Colors.black)),
                                      //       TextSpan(
                                      //           text: '',
                                      //           style: TextStyle(
                                      //               fontSize: 7,
                                      //               color: Colors.grey.shade500,
                                      //               fontFamily: 'Poppins')),
                                      //     ],
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  // Text(
                                  //   "By ${chefDetailsController.popularChefList!.data!.list![index].chefname}",
                                  //   style: FoodigyTextStyle.smallTextStyle,
                                  // ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  // chefDetailsController.popularChefList!.data!
                                  //             .list![index].date
                                  //             .toString() ==
                                  //         ""
                                  //     ? Container()
                                  //     : Row(
                                  //         children: [
                                  //           Row(
                                  //             children: [
                                               
                                  //               Text(
                                  //                 'Order before :${chefDetailsController.popularChefList!.data!.list![index].date}',
                                  //                 style: FoodigyTextStyle
                                  //                     .smallTextStyle,
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           SizedBox(
                                  //             width: 10,
                                  //           ),
                                            
                                  //         ],
                                  //       ),

                                        
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        }));
  }
}
